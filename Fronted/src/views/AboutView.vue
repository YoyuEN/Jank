<template>
  <div class="about-container">
    <div class="about-header">
      <el-carousel
        height="400px"
        :autoplay="true"
        :interval="3000"
        :thumbnail="true"
        :thumbnail-options="{
    width: 100,
    height: 60,
    gap: 10
  }"
      >
        <el-carousel-item v-for="(item, index) in headerSlides" :key="index">
          <div class="slide-content">
            <div class="slide-grid">
              <div class="slide-image-container" v-if="item.image">
                <img :src="item.image" alt="" class="slide-image">
              </div>
              <div class="slide-text-content">
                <h3 text="2xl" justify="center">{{ item.text }}</h3>
                <p class="slide-description" v-if="item.description">{{ item.description }}</p>
              </div>
            </div>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>

    <div class="about-content">
      <el-row :gutter="24"> <!-- 增加栅格间距 -->
        <el-col :span="12"> <!-- 调整为更平衡的12:12布局 -->
          <el-card class="about-card">
            <template #header>
              <div class="card-header">
                <h2>项目介绍</h2>
              </div>
            </template>
            <div class="card-content">
              <p>这是一个基于Vue 3和Element Plus的现代化社交平台前端项目，致力于为用户提供流畅、美观的社交体验。</p>
              <p>我们的平台包含帖子发布、朋友圈、评论互动等核心功能，采用最新的前端技术栈构建。</p>

              <h3>核心功能</h3>
              <el-row :gutter="20" class="feature-list">
                <el-col :span="8" v-for="(feature, index) in features" :key="index">
                  <div class="feature-item">
                    <el-icon class="feature-icon"><component :is="feature.icon" /></el-icon>
                    <h4>{{ feature.title }}</h4>
                    <p>{{ feature.description }}</p>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-col>

        <el-col :span="12"> <!-- 调整为更平衡的12:12布局 -->
          <el-card class="tech-stack-card">
            <template #header>
              <div class="card-header">
                <h2>技术栈</h2>
              </div>
            </template>
            <div class="tech-list">
              <div v-for="(tech, index) in techStack" :key="index" class="tech-item">
                <div class="tech-box" :style="{ backgroundColor: tech.color }">
                  <span class="tech-name">{{ tech.name }}</span>

                </div>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <div class="section-title">
        <h2>团队展示</h2>
        <el-divider content-position="center"></el-divider>
      </div>

      <el-carousel
        height="400px"
        :interval="4000"
        type="card"
        :autoplay="true"
        indicator-position="outside"
      >
        <el-carousel-item v-for="(member, index) in teamMembers" :key="index">
          <el-card class="team-card" shadow="hover">
            <div class="team-member">
              <div class="avatar-container">
                <el-avatar :size="100" :src="member.avatar">
                  {{ member.name.charAt(0) }}
                </el-avatar>
              </div>
              <h3>{{ member.name }}</h3>
              <p class="role">{{ member.role }}</p>
              <p class="description">{{ member.description }}</p>
              <div class="social-links">
                <el-tooltip
                  v-for="(link, i) in member.social"
                  :key="i"
                  :content="link.tooltip"
                  placement="top"
                  effect="light"
                >
                  <el-button
                    circle
                    :icon="link.icon"
                    size="small"
                    :type="link.type"
                    class="social-button"
                  >
                  </el-button>
                </el-tooltip>
              </div>
            </div>
          </el-card>
        </el-carousel-item>
      </el-carousel>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue'


import imgyang from '@/assets/imgyang.png'
import YoyuEN from '@/assets/YoyuEN.png'
import zhao from '@/assets/zhao.jpg'
import hua from '@/assets/hua.jpg'
import hu from '@/assets/hu.jpg'




export default defineComponent({
  name: 'AboutView',

  setup() {
    const headerSlides = ref([
      {
        text: "探索、创新、分享",
        description: "我们的核心价值观",
        image: YoyuEN
      },
      {
        text: "基于Vue 3的现代化应用",
        description: "使用最新前端技术栈",
        image: YoyuEN
      },
      {
        text: "优雅的设计，流畅的体验",
        description: "以用户为中心的界面设计",
        image: YoyuEN
      },
      {
        text: "欢迎了解我们的项目",
        description: "加入我们的社区",
        image: YoyuEN
      },
      {
        text: "感谢您的援助和支持",
        description: "支持更多交互与个性化设置",
        image: YoyuEN
      }
    ]);

    const features = ref([
      {
        icon: 'ChatLineRound',
        title: '社交互动',
        description: '丰富的评论和互动功能'
      },
      {
        icon: 'Picture',
        title: '朋友圈',
        description: '分享生活点滴'
      },
      {
        icon: 'Star',
        title: '点赞功能',
        description: '表达喜爱和支持'
      }
    ]);

    const techStack = ref([
      { name: 'Vue 3', color: '#42b883' },
      { name: 'Element Plus', color: '#409eff' },
      { name: 'Pinia',  color: '#ffd859' },
      { name: 'Vite',  color: '#646cff' }
    ]);

    const teamMembers = ref([
      {
        name: '王泰乐',
        role: '项目经理',
        avatar: YoyuEN,
        description: '5年前端开发经验，Vue.js专家，热爱开源社区',
        social: [
          { icon: 'Share', type: 'primary', tooltip: '分享' },
          { icon: 'Message', type: 'success', tooltip: '联系' },
          { icon: 'Link', type: 'info', tooltip: '个人主页' }
        ]
      },
      {
        name: '杨旭',
        role: '全栈工程师',
        avatar: imgyang,
        description: '专注用户体验设计，追求极致美感，曾获多项设计大奖',
        social: [
          { icon: 'Share', type: 'primary', tooltip: '分享' },
          { icon: 'Message', type: 'success', tooltip: '联系' },
          { icon: 'Link', type: 'info', tooltip: '作品集' }
        ]
      },
      {
        name: '赵建',
        role:'全栈工程师',
        avatar: zhao,
        description: '洞察用户需求，规划产品路线，拥有丰富的互联网产品经验',
        social: [
          { icon: 'Share', type: 'primary', tooltip: '分享' },
          { icon: 'Message', type: 'success', tooltip: '联系' },
          { icon: 'Link', type: 'info', tooltip: '领英主页' }
        ]
      },
      {
        name: '胡俊涛',
        role: '全栈工程师',
        avatar: hu,
        description: '精通分布式系统设计，性能优化专家，热爱技术分享',
        social: [
          { icon: 'Share', type: 'primary', tooltip: '分享' },
          { icon: 'Message', type: 'success', tooltip: '联系' },
          { icon: 'Link', type: 'info', tooltip: '技术博客' }
        ]
      },
      {
        name: '彭华颖',
        role: '全栈工程师',
        avatar:hua,
        description: '精通分布式系统设计，性能优化专家，热爱技术分享',
        social: [
          { icon: 'Share', type: 'primary', tooltip: '分享' },
          { icon: 'Message', type: 'success', tooltip: '联系' },
          { icon: 'Link', type: 'info', tooltip: '技术博客' }
        ]
      }
    ]);

    return {
      headerSlides,
      features,
      techStack,
      teamMembers
    }
  }
})
</script>

<style scoped>
.about-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.about-header {
  text-align: center;
  margin-top: 65px; /* 添加顶部外边距，将轮播图向下移动，避免被顶部菜单栏遮挡 */
  margin-bottom: 40px;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(64, 158, 255, 0.2);
  background-color: #fff;
  position: relative;
  padding-bottom: 0;
}

:deep(.el-carousel) {
  height: 100%;
}

:deep(.el-carousel__container) {
  height: 100%;
}

.slide-grid {
  display: flex;
  height: 100%;
  align-items: center;
}

.slide-image-container {
  flex: 0 0 40%;
  height: 100%;
  padding: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slide-image {
  max-width: 100%;
  max-height: 80%;
  object-fit: contain;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.slide-text-content {
  flex: 1;
  padding: 20px 40px 40px; /* 上边距20px，左右40px，下边距40px */
  color: #333;
  text-align: left;
  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* 改为顶部对齐 */
  margin-top: -200px; /* 整体上移20px */
}

.slide-text-content h3 {
  font-size: 1.8rem;
  margin-bottom: 15px;
  color: #303133;
  font-weight: 600;
  line-height: 1.3;
}

.slide-description {
  font-size: 1rem;
  line-height: 1.6;
  color: #606266;
  max-width: 100%;
  margin-bottom: 0;
}

/* 响应式调整 */
@media (max-width: 768px) {
  .slide-grid {
    flex-direction: column;
  }

  .slide-image-container {
    flex: 0 0 auto;
    height: 200px;
    width: 100%;
    padding: 10px;
  }

  .slide-text-content {
    padding: 15px;
    text-align: center;
  }
}

.about-header :deep(.el-carousel__item) h3 {
  color: white;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);
}

.slide-description {
  color: rgba(255, 255, 255, 0.9);
}

.about-header::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: radial-gradient(circle at top right, rgba(64, 158, 255, 0.05) 0%, transparent 70%),
              radial-gradient(circle at bottom left, rgba(103, 194, 58, 0.05) 0%, transparent 70%);
  pointer-events: none;
}

.demonstration {
  font-size: 1.5rem;
  color: #409eff;
  margin-bottom: 15px;
  padding: 15px 0;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  border-radius: 8px 8px 0 0;
  font-weight: 600;
  letter-spacing: 1px;
  text-transform: uppercase;
  position: relative;
  overflow: hidden;
}

.demonstration::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 3px;
  background: linear-gradient(90deg, #409eff, #67c23a, #e6a23c, #f56c6c, #909399, #409eff);
  background-size: 400% 400%;
  animation: gradient 6s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.about-header :deep(.el-carousel__item) h3 {
  color: #303133;
  opacity: 0.9;
  line-height: 1.4; /* 修改行高，从200px改为1.4，使文本更紧凑 */
  margin: 0;
  text-align: center;
  font-size: 1.8rem;
  font-weight: 600;
}

.about-header :deep(.el-carousel__item:nth-child(2n)) {
  background: linear-gradient(135deg, #e6f1fc 0%, #b5d8ff 100%);
}

.about-header :deep(.el-carousel__item:nth-child(2n + 1)) {
  background: linear-gradient(135deg, #f0f9eb 0%, #c2e7b0 100%);
}

/* 卡片效果样式优化 */
.about-header :deep(.el-carousel--vertical .el-carousel__item.is-active) {
  transform: translateY(0) scale(1.2); /* 调整缩放比例为更合适的1.2 */
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  z-index: 2;
  padding: 15px 20px;
  border: 2px solid #409eff;
  animation: pulse 2s infinite;
  opacity: 1;
  filter: none;
  background-size: 200% 200%;
  animation:
    pulse 2s infinite,
    gradient-shift 5s ease infinite;
  overflow: visible; /* 确保内容可见 */
}

@keyframes gradient-shift {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  }
  50% {
    box-shadow: 0 10px 25px rgba(64, 158, 255, 0.3);
  }
  100% {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  }
}

/* 顶部轮播图卡片大小控制 */

.about-header :deep(.el-carousel--vertical .el-carousel__item:not(.is-active)) {
  filter: grayscale(30%) blur(1px);
}

.about-header :deep(.el-carousel--vertical .el-carousel__item) .slide-content {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  padding: 15px 20px; /* 调整内边距，减少上下内边距 */
  position: relative;
  z-index: 1;
  box-sizing: border-box; /* 确保内边距不会增加元素总大小 */
}

.about-header :deep(.el-carousel--vertical .el-carousel__item) .slide-icon {
  font-size: 2.2rem; /* 稍微减小图标大小 */
  margin-bottom: 10px; /* 减少底部间距 */
  color: #409eff;
  background: rgba(255, 255, 255, 0.8);
  border-radius: 50%;
  padding: 8px; /* 减少内边距 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.about-header :deep(.el-carousel--vertical .el-carousel__item) h3 {
  position: relative;
  z-index: 1;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
  margin-bottom: 10px;
  line-height: 1.4;
}

.about-header :deep(.el-carousel--vertical .el-carousel__item) .slide-description {
  font-size: 1rem; /* 稍微减小字体大小 */
  color: #606266;
  text-align: center;
  max-width: 90%; /* 增加最大宽度，使文本有更多空间显示 */
  margin: 5px auto 0; /* 调整外边距，顶部增加一点间距 */
  line-height: 1.4; /* 添加适当的行高 */
  overflow-wrap: break-word; /* 确保长词可以换行 */
}

.about-header :deep(.el-carousel--vertical .el-carousel__item)::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-100%);
  transition: transform 0.6s ease;
}

.about-header :deep(.el-carousel--vertical .el-carousel__item.is-active)::before {
  transform: translateY(0);
}

.about-header :deep(.el-carousel__mask) {
  opacity: 0.5;
}

/* 指示器样式优化 */
.about-header :deep(.el-carousel__indicators--outside) {
  margin-top: 15px;
}

.about-header :deep(.el-carousel__indicators--outside button) {
  background-color: #c0c4cc;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  margin: 0 4px;
  transition: all 0.3s;
}

.about-header :deep(.el-carousel__indicators--outside button.is-active) {
  background-color: #409eff;
  width: 14px;
  height: 14px;
}

.about-content {
  margin-bottom: 60px; /* 增加底部间距 */
}

.section-title {
  text-align: center;
  margin: 50px 0 30px;
}

.section-title h2 {
  font-size: 2rem;
  color: #303133;
  margin-bottom: 10px;
  position: relative;
  display: inline-block;
}

.section-title h2::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 3px;
  background: linear-gradient(90deg, #409eff, #67c23a);
  border-radius: 3px;
}

.about-card, .tech-stack-card {
  margin-bottom: 20px;
  transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
  border: none;
  background: linear-gradient(135deg, #ffffff 0%, #f9fafc 100%);
  height: 100%; /* 确保两个卡片高度一致 */
}

.about-card:hover, .tech-stack-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
  background: linear-gradient(135deg, #ffffff 0%, #ecf5ff 100%);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-header h2 {
  margin: 0;
  font-size: 1.5rem;
  color: #303133;
}

.card-content {
  line-height: 1.6;
}

.feature-list {
  margin-top: 20px;
}

.feature-item {
  text-align: center;
  padding: 20px;
  border-radius: 12px;
  background-color: #f5f7fa;
  height: 100%;
  transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
  border: 1px solid transparent;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.feature-item:hover {
  background-color: #ecf5ff;
  transform: translateY(-8px);
  border-color: rgba(64, 158, 255, 0.2);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.feature-icon {
  font-size: 2.5rem;
  color: #409eff;
  margin-bottom: 15px;
  background: rgba(64, 158, 255, 0.1);
  width: 60px;
  height: 60px;
  line-height: 60px;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  transition: all 0.3s ease;
}

.feature-item:hover .feature-icon {
  transform: scale(1.1);
  background: rgba(64, 158, 255, 0.2);
  box-shadow: 0 5px 15px rgba(64, 158, 255, 0.3);
}

.feature-item h4 {
  font-size: 1.2rem;
  margin: 10px 0;
  color: #303133;
  transition: all 0.3s ease;
}

.feature-item:hover h4 {
  color: #409eff;
}

.feature-item p {
  color: #606266;
  transition: all 0.3s ease;
}

.feature-item:hover p {
  color: #303133;
}

.tech-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  padding: 10px 0;
}

.tech-item {
  margin: 15px;
  text-align: center;
  transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
  position: relative;
}

.tech-item:hover {
  transform: translateY(-5px) scale(1.05);
}

.tech-box {
  width: 160px;
  height: 100px;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: white;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
  position: relative;
  overflow: hidden;
  transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
  border: 2px solid rgba(255, 255, 255, 0.2);
}

.tech-box::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, transparent 80%);
  z-index: 1;
}

.tech-name {
  font-size: 1.3rem;
  font-weight: bold;
  margin-bottom: 8px;
  position: relative;
  z-index: 2;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.tech-percentage {
  font-size: 1.1rem;
  font-weight: 600;
  position: relative;
  z-index: 2;
  background-color: rgba(255, 255, 255, 0.2);
  padding: 3px 10px;
  border-radius: 12px;
  transition: all 0.3s ease;
}

.tech-item:hover .tech-box {
  transform: translateY(-8px) scale(1.05);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
}

.tech-item:hover .tech-percentage {
  background-color: rgba(255, 255, 255, 0.3);
  transform: scale(1.1);
}

.team-card {
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, #ffffff 0%, #f9fafc 100%);
  border: none;
  transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.team-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
  background: linear-gradient(135deg, #ffffff 0%, #ecf5ff 100%);
}

.team-member {
  text-align: center;
  padding: 20px;
  border-radius: 8px;
  transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
  position: relative;
  overflow: hidden;
}

.team-member:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
  background-color: #f9fafc;
}

.team-member::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #409eff, #67c23a, #e6a23c, #f56c6c);
  transform: scaleX(0);
  transform-origin: left;
  transition: transform 0.3s ease;
}

.team-member:hover::before {
  transform: scaleX(1);
}

.avatar-container {
  margin-bottom: 15px;
  position: relative;
  display: inline-block;
  transition: all 0.3s ease;
}

.avatar-container::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  box-shadow: 0 0 0 4px rgba(64, 158, 255, 0.2);
  opacity: 0;
  transform: scale(0.8);
  transition: all 0.3s ease;
}

.team-member:hover .avatar-container::after {
  opacity: 1;
  transform: scale(1.1);
}

.team-member:hover .el-avatar {
  transform: scale(1.05);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.role {
  color: #409eff;
  font-weight: bold;
  margin-bottom: 10px;
  position: relative;
  display: inline-block;
  transition: all 0.3s ease;
}

.team-member:hover .role {
  transform: translateY(-2px);
}

.description {
  margin-bottom: 15px;
  color: #606266;
  line-height: 1.6;
  transition: all 0.3s ease;
}

.team-member:hover .description {
  color: #303133;
}

.social-links {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 15px;
}

.social-button {
  transition: all 0.3s ease;
  transform: translateY(0);
}

.social-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

/* 轮播样式优化 */
:deep(.el-carousel__item) {
  border-radius: 8px;
  overflow: hidden;
}

:deep(.el-carousel__arrow) {
  background-color: rgba(64, 158, 255, 0.7);
}

:deep(.el-carousel__arrow:hover) {
  background-color: rgba(64, 158, 255, 1);
}

:deep(.el-carousel__indicators) {
  margin-top: 10px;
}
</style>
