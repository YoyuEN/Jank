<template>
  <div v-if="post" class="post-card" @click="$router.push(`/posts/${post.postId}`)"
       @mouseenter="handleMouseEnter" @mouseleave="handleMouseLeave">
    <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
    <h3 class="post-title">{{ post.title }}</h3>
    <div class="post-meta">
      <span class="post-time">{{ post.createTime }}</span>
      <span class="post-categories">
        <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
      </span>
    </div>
    <div class="post-content" v-html="post.contentHtml.slice(0, 100) + '...'"></div>
    <!-- 弹窗 -->
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
});

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
  padding: 16px;
  border-radius: 12px;
  margin-bottom: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
  position: relative; /* 添加相对定位 */
}

.post-card:hover {
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.post-image {
  width: 100%;
  max-height: 200px;
  object-fit: cover;
  border-radius: 8px;
}

.post-title {
  font-size: 1.2em;
  margin: 10px 0;
}

.post-meta {
  font-size: 0.9em;
}

.category-tag {
  margin-left: 6px;
  color: #007acc;
}

.post-content {
  margin-top: 10px;
}

/* 饼图容器样式 */
.chart-container {
  position: absolute;
  left: -280px; /* 将图表放置在帖子卡片的左侧 */
  top: 50%;
  transform: translateY(-50%);
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  padding: 15px;
  z-index: 10;
  transition: opacity 0.3s ease;
}

.pie-chart {
  width: 250px; /* 增加图表宽度 */
  height: 250px; /* 增加图表高度 */
}

/* 添加一个小箭头指向帖子卡片 */
.chart-container::after {
  content: '';
  position: absolute;
  right: -10px;
  top: 50%;
  transform: translateY(-50%);
  border-width: 10px 0 10px 10px;
  border-style: solid;
  border-color: transparent transparent transparent white;
}
</style>
