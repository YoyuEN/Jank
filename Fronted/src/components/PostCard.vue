<template>
  <div v-if="post" class="post-card" @click="$router.push(`/posts/${post.postId}`)"
       @mouseenter="handleMouseEnter" @mouseleave="handleMouseLeave">
    <div class="card-header">
      <div class="post-image-container">
        <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
        <div class="image-overlay"></div>
      </div>
      <div class="post-badge">
        <i class="badge-icon">📝</i>
      </div>
    </div>

    <div class="card-content">
      <h3 class="post-title">{{ post.title }}</h3>

      <div class="post-meta">
        <div class="meta-left">
          <span class="post-time">
            <i class="time-icon">🕒</i>
            {{ post.createTime }}
          </span>
        </div>
        <div class="post-categories">
          <span v-for="id in post.categoryNames" :key="id" class="category-tag"> #{{ id }} </span>
        </div>
      </div>

      <div class="post-content" v-html="post.contentHtml.slice(0, 100) + '...'"></div>

      <div class="card-footer">
        <div class="read-more">
          <span>阅读更多</span>
          <i class="arrow-icon">→</i>
        </div>
      </div>
    </div>
    <div class="chart-container" v-show="showPopup">
      <div id="pieChart" ref="pieChartRef" class="pie-chart"></div>
    </div>
  </div>
</template>

<script setup>
import { ref, onUnmounted, onMounted, watch } from 'vue';
import * as echarts from 'echarts';
import {getCommentLevel} from '@/api/comment/comment.js';

const props = defineProps({
  post: {
    type: Object,
    required: true,
  },
})
//数据可视化弹窗
const showPopup = ref(false);
let timer = null;
let pieChart = null;
const pieChartRef = ref(null);
const chartData = ref([]);
const isLoading = ref(false);

// 从后端获取评论级别数据
const fetchCommentLevel = async (postId) => {
  try {
    isLoading.value = true;
    // 调用导入的getCommentLevel方法
    const response = await getCommentLevel(postId);

    // 处理后端返回的数据格式 {good：1，bad：1，or：1}
    const data = response.data;

    // 转换为饼图所需的数据格式
    return [
      { value: data.good || 0, name: '优秀' },
      { value: data.bad || 0, name: '很差' },
      { value: data.ordinary || 0, name: '一般' }, // 使用or而不是ordinary
    ];
  } catch (error) {
    console.error('获取评论级别数据失败:', error);
    // 如果获取失败，返回一些默认数据
    return [
      { value: 0, name: '优秀' },
      { value: 0, name: '很差' },
      { value: 0, name: '一般' },
    ];
  } finally {
    isLoading.value = false;
  }
};

// 初始化饼图
const initPieChart = async () => {
  if (!pieChartRef.value) return;

  // 销毁之前的图表实例（如果存在）
  if (pieChart) {
    pieChart.dispose();
  }

  // 初始化图表
  pieChart = echarts.init(pieChartRef.value);

  // 设置加载状态
  pieChart.showLoading();

  try {
    // 从后端获取数据，使用fetchCommentLevel函数
    const data = await fetchCommentLevel(props.post.postId);
    chartData.value = data;

    // 配置图表选项
    const option = {
      // 设置饼图颜色为黑白灰配色
      color: ['#333333', '#E0E0E0', '#999999'], // 深灰(优秀)、浅灰(很差)、中灰(一般)
      tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c} ({d}%)'
      },
      // 已移除图例
      series: [
        {
          name: '评论级别',
          type: 'pie',
          radius: '70%', // 实心饼图
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: true, // 显示标签
            position: 'inside', // 标签显示在饼图内部
            formatter: '{b}: {d}%', // 显示名称和百分比
            fontSize: 12,
            fontWeight: 'bold',
            color: '#fff' // 确保标签在深色背景上可见
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 14,
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: chartData.value
        }
      ]
    };

    // 隐藏加载状态
    pieChart.hideLoading();

    // 设置图表配置
    pieChart.setOption(option);
  } catch (error) {
    console.error('初始化饼图失败:', error);
    pieChart.hideLoading();
  }
};

const handleMouseEnter = () => {
  timer = setTimeout(() => {
    showPopup.value = true;
    // 当显示图表时，确保图表已初始化并正确渲染
    setTimeout(() => {
      initPieChart();
    }, 0);
  }, 300); // 设置 300 毫秒的延迟
};

const handleMouseLeave = () => {
  clearTimeout(timer); // 清除定时器
  showPopup.value = false;
};

// 监听showPopup的变化，确保在显示时初始化图表
watch(showPopup, (newVal) => {
  if (newVal && pieChartRef.value) {
    initPieChart();
  }
});

// 组件挂载后初始化图表（如果需要的话）
onMounted(() => {
  window.addEventListener('resize', () => {
    if (pieChart) {
      pieChart.resize();
    }
  });
});

onUnmounted(() => {
  clearTimeout(timer); // 组件卸载时清除定时器
  // 销毁图表实例
  if (pieChart) {
    pieChart.dispose();
    pieChart = null;
  }
  // 移除事件监听
  window.removeEventListener('resize', () => {
    if (pieChart) {
      pieChart.resize();
    }
  });
});
</script>

<style scoped>
.post-card {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 20px;
  margin-bottom: 24px;
  box-shadow:
    0 8px 32px rgba(0, 0, 0, 0.08),
    0 2px 8px rgba(0, 0, 0, 0.04),
    inset 0 1px 0 rgba(255, 255, 255, 0.8);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.2);
  cursor: pointer;
  position: relative;

}

.post-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
  opacity: 0;
  transition: opacity 0.3s ease;
  pointer-events: none;
}

.post-card:hover {
  transform: translateY(-8px) scale(1.02);
  box-shadow:
    0 20px 60px rgba(0, 0, 0, 0.15),
    0 8px 24px rgba(0, 0, 0, 0.08),
    inset 0 1px 0 rgba(255, 255, 255, 0.9);
}

.post-card:hover::before {
  opacity: 1;
}

/* 卡片头部 */
.card-header {
  position: relative;
  overflow: hidden;
}

.post-image-container {
  position: relative;
  width: 100%;
  height: 280px;
  overflow: hidden;
}

.post-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.post-card:hover .post-image {
  transform: scale(1.1);
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.3));
  opacity: 0;
  transition: opacity 0.3s ease;
}

.post-card:hover .image-overlay {
  opacity: 1;
}

.post-badge {
  position: absolute;
  top: 16px;
  right: 16px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
  backdrop-filter: blur(10px);
  border-radius: 12px;
  padding: 8px 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.badge-icon {
  font-size: 16px;
}

/* 卡片内容 */
.card-content {
  padding: 20px;
}

.post-title {
  font-size: 1.2em;
  font-weight: 700;
  color: #1e293b;
  margin: 0 0 12px 0;
  line-height: 1.3;
  letter-spacing: -0.02em;
  transition: color 0.3s ease;
}

.post-card:hover .post-title {
  color: #667eea;
}

/* 元信息 */
.post-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
  flex-wrap: wrap;
  gap: 12px;
}

.meta-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.post-time {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 0.9em;
  color: #64748b;
  font-weight: 500;
}

.time-icon {
  font-size: 14px;
}

.post-categories {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.category-tag {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  color: #667eea;
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 0.85em;
  font-weight: 600;
  border: 1px solid rgba(102, 126, 234, 0.2);
  transition: all 0.3s ease;
}

.category-tag:hover {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.2), rgba(118, 75, 162, 0.2));
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.2);
}

/* 内容 */
.post-content {
  color: #475569;
  line-height: 1.5;
  margin-bottom: 16px;
  font-size: 0.9em;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

/* 卡片底部 */
.card-footer {
  border-top: 1px solid rgba(0, 0, 0, 0.06);
  padding-top: 12px;
}

.read-more {
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #667eea;
  font-weight: 600;
  font-size: 0.9em;
  transition: all 0.3s ease;
}

.read-more .arrow-icon {
  font-size: 16px;
  transition: transform 0.3s ease;
}

.post-card:hover .read-more .arrow-icon {
  transform: translateX(4px);
}

/* 响应式设计 */
@media (max-width: 768px) {
  .post-card {
    margin-bottom: 20px;
    border-radius: 16px;
  }

  .card-content {
    padding: 20px;
  }

  .post-title {
    font-size: 1.2em;
  }

  .post-meta {
    flex-direction: column;
    align-items: flex-start;
    gap: 8px;
  }

  .post-image-container {
    height: 220px;
  }
}

@media (max-width: 480px) {
  .card-content {
    padding: 16px;
  }

  .post-title {
    font-size: 1.1em;
  }

  .post-image-container {
    height: 180px;
  }

  .post-badge {
    top: 12px;
    right: 12px;
    padding: 6px 10px;
  }
}


/* 饼图容器样式 */
.chart-container {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: rgba(255, 255, 255, 0.2); /* 半透明背景 */
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  padding: 20px;
  z-index: 100;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.pie-chart {
  width: 280px; /* 增加图表宽度 */
  height: 280px; /* 增加图表高度 */
}
</style>
