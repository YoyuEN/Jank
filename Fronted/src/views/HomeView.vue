<template>
  <div class="home-container">
    <!-- 欢迎区域 -->
    <div class="hero-section">
      <div class="hero-content">
        <h1 class="hero-title">欢迎来到我的博客</h1>
        <p class="hero-subtitle">分享技术见解，记录学习历程</p>
        <div class="hero-buttons">
          <button class="btn-primary" @click="navigateToPosts">浏览博客</button>
          <button class="btn-secondary" @click="navigateToMoments">查看动态</button>
          <button class="btn-ai" @click="navigateChat">AI 助手</button>
        </div>
      </div>
    </div>

    <!-- AI 智能体区域 - 可折叠 -->
    <div v-if="showAI" class="ai-section">
      <div class="content-wrapper">
        <div class="ai-container">
          <AIagent />
        </div>
      </div>
    </div>

    <!-- 主要内容区域 -->
    <div class="main-content">
      <div class="content-wrapper">
        <!-- 方案选择：可以选择不同的布局 -->
        <div class="layout-selector">
          <button :class="['layout-btn', { active: layout === 'grid' }]" @click="setLayout('grid')">
            网格布局
          </button>
          <button
            :class="['layout-btn', { active: layout === 'sidebar' }]"
            @click="setLayout('sidebar')"
          >
            侧边栏布局
          </button>
        </div>

        <!-- 网格布局：特色功能和博客并排 -->
        <div v-if="layout === 'grid'" class="grid-layout">
          <!-- 特色功能区域 -->
          <div class="features-section">
            <h2 class="section-title">功能特色</h2>
            <div class="features-grid">
              <div class="feature-card">
                <div class="feature-icon">📝</div>
                <h3>技术博客</h3>
                <p>分享编程心得和技术见解</p>
              </div>
              <div class="feature-card">
                <div class="feature-icon">💬</div>
                <h3>互动评论</h3>
                <p>与读者交流讨论，共同成长</p>
              </div>
              <div class="feature-card">
                <div class="feature-icon">📱</div>
                <h3>朋友圈</h3>
                <p>分享生活点滴和日常感悟</p>
              </div>
              <div class="feature-card ai-feature" @click="toggleAI">
                <div class="feature-icon">🤖</div>
                <h3>AI 助手</h3>
                <p>智能对话，解答疑问</p>
              </div>
            </div>
          </div>

          <!-- 最新博客区域 -->
          <div class="latest-posts-section">
            <div class="section-header">
              <h2 class="section-title">最新博客</h2>
              <button class="btn-view-all" @click="navigateToPosts">查看全部</button>
            </div>
            <div class="posts-grid">
              <div v-if="posts.length === 0 && !loading" class="empty-state">
                <div class="empty-icon">📝</div>
                <div class="empty-text">暂无博客信息</div>
                <button class="btn-primary" @click="navigateToPosts">发布第一篇博客</button>
              </div>
              <PostCard v-for="post in posts" :key="post.postId" :post="post" />
            </div>
          </div>
        </div>

        <!-- 侧边栏布局：AI助手在左侧，博客在右侧 -->
        <div v-if="layout === 'sidebar'" class="sidebar-layout">
          <!-- 左侧：AI助手 -->
          <div class="sidebar-ai">
            <AIagent />
          </div>

          <!-- 右侧：博客内容 -->
          <div class="sidebar-content">
            <div class="section-header">
              <h2 class="section-title">最新博客</h2>
              <button class="btn-view-all" @click="navigateToPosts">查看全部</button>
            </div>
            <div class="posts-grid">
              <div v-if="posts.length === 0 && !loading" class="empty-state">
                <div class="empty-icon">📝</div>
                <div class="empty-text">暂无博客信息</div>
                <button class="btn-primary" @click="navigateToPosts">发布第一篇博客</button>
              </div>
              <PostCard v-for="post in posts" :key="post.postId" :post="post" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { getPostList } from '@/api/posts/posts.js'
import { useRouter } from 'vue-router'
import PostCard from '@/components/PostCard.vue'
import AIagent from '@/views/AIagent.vue'

export default {
  name: 'HomeView',
  components: { PostCard, AIagent },
  data() {
    return {
      posts: [],
      loading: true,
      form: {},
      showAI: false,
      layout: 'grid', // 'grid' 或 'sidebar'
    }
  },
  setup() {
    const router = useRouter()

    const navigateToPosts = () => {
      router.push({ name: 'PostList' })
    }

    const navigateToMoments = () => {
      router.push({ name: 'Moments' })
    }
    const navigateChat = () => {
      router.push({ name: 'Chat' })
    }

    return {
      navigateToPosts,
      navigateToMoments,
      navigateChat,
    }
  },
  created() {
    this.getPostList()
  },
  methods: {
    getPostList() {
      this.loading = true
      getPostList(this.form).then((response) => {
        const list = Array.isArray(response.data) ? response.data : []
        this.posts = list.filter((post) => post.deleted === 0 && post.visibility).slice(0, 6)
        this.loading = false
      })
    },
    toggleAI() {
      this.showAI = !this.showAI
    },
    setLayout(layout) {
      this.layout = layout
    },
  },
}
</script>

<style scoped>
.home-container {
  margin-top: 60px;
  min-height: 100vh;
  background: linear-gradient(135deg, #f8fafc 0%, #e0e7ef 100%);
}

/* 欢迎区域 */
.hero-section {
  padding: 80px 0;
  text-align: center;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 0 0 40px 40px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  margin-bottom: 60px;
}

.hero-content {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 20px;
}

.hero-title {
  font-size: 3.5rem;
  font-weight: 700;
  margin-bottom: 20px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero-subtitle {
  font-size: 1.3rem;
  color: #64748b;
  margin-bottom: 40px;
  font-weight: 500;
}

.hero-buttons {
  display: flex;
  gap: 20px;
  justify-content: center;
  flex-wrap: wrap;
}

/* 按钮样式 */
.btn-primary {
  padding: 16px 32px;
  border: none;
  border-radius: 16px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.2);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(102, 126, 234, 0.3);
}

.btn-secondary {
  padding: 16px 32px;
  border: 2px solid #667eea;
  border-radius: 16px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  background: transparent;
  color: #667eea;
  transition: all 0.3s ease;
}

.btn-secondary:hover {
  background: #667eea;
  color: white;
  transform: translateY(-2px);
}

.btn-ai {
  padding: 16px 32px;
  border: none;
  border-radius: 16px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  box-shadow: 0 4px 16px rgba(16, 185, 129, 0.2);
  transition: all 0.3s ease;
}

.btn-ai:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(16, 185, 129, 0.3);
}

/* AI 区域样式 */
.ai-section {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  margin: 0 auto 40px;
  max-width: 1400px;
  width: 90%;
  overflow: hidden;
}

.ai-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 30px;
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(5, 150, 105, 0.1));
  border-bottom: 1px solid rgba(16, 185, 129, 0.1);
}

.ai-header h3 {
  font-size: 1.5rem;
  font-weight: 600;
  color: #1e293b;
  margin: 0;
}

.btn-close {
  background: none;
  border: none;
  font-size: 24px;
  color: #64748b;
  cursor: pointer;
  padding: 5px;
  border-radius: 50%;
  transition: all 0.3s ease;
}

.btn-close:hover {
  background: rgba(16, 185, 129, 0.1);
  color: #10b981;
}

.ai-container {
  padding: 20px;
  max-height: 400px;
  overflow: hidden;
}

/* 布局选择器 */
.layout-selector {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin-bottom: 40px;
}

.layout-btn {
  padding: 12px 24px;
  border: 2px solid #e2e8f0;
  border-radius: 12px;
  background: white;
  color: #64748b;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.layout-btn.active {
  border-color: #667eea;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  color: #667eea;
}

.layout-btn:hover {
  border-color: #667eea;
  color: #667eea;
}

/* 内容包装器 */
.content-wrapper {
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 20px;
}

/* 区域标题 */
.section-title {
  font-size: 2.5rem;
  font-weight: 700;
  text-align: center;
  margin-bottom: 40px;
  color: #1e293b;
}

/* 网格布局 */
.grid-layout {
  display: flex;
  flex-direction: column;
  gap: 60px;
}

/* 特色功能区域 */
.features-section {
  padding: 20px 0;
  margin-bottom: 20px;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 30px;
  margin-top: 40px;
}

.feature-card {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 20px;
  padding: 40px 30px;
  text-align: center;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  transition: all 0.3s ease;
  cursor: pointer;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.15);
}

.feature-card.ai-feature {
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(5, 150, 105, 0.1) 100%);
  border: 1px solid rgba(16, 185, 129, 0.2);
}

.feature-card.ai-feature:hover {
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.15) 0%, rgba(5, 150, 105, 0.15) 100%);
}

.feature-icon {
  font-size: 3rem;
  margin-bottom: 20px;
}

.feature-card h3 {
  font-size: 1.5rem;
  font-weight: 600;
  color: #1e293b;
  margin-bottom: 15px;
}

.feature-card p {
  color: #64748b;
  font-size: 1rem;
  line-height: 1.6;
}

/* 最新博客区域 */
.latest-posts-section {
  padding: 20px 0;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 40px;
}

.btn-view-all {
  padding: 12px 24px;
  border: none;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  color: #667eea;
  border: 1px solid rgba(102, 126, 234, 0.2);
  transition: all 0.3s ease;
}

.btn-view-all:hover {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.2), rgba(118, 75, 162, 0.2));
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
}

.posts-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 30px;
}

/* 侧边栏布局 */
.sidebar-layout {
  display: flex;
  gap: 40px;
  align-items: flex-start;
}

.sidebar-ai {
  flex: 0 0 400px;
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 20px;
  overflow: hidden;
  position: sticky;
  top: 80px;
}

.ai-sidebar-header {
  padding: 24px 32px;
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(5, 150, 105, 0.1));
  border-bottom: 1px solid rgba(16, 185, 129, 0.1);
}

.ai-sidebar-header h3 {
  font-size: 1.5rem;
  font-weight: 600;
  color: #1e293b;
  margin: 0 0 8px 0;
}

.ai-sidebar-header p {
  color: #64748b;
  margin: 0;
  font-size: 0.95rem;
}

.ai-sidebar-container {
  padding: 24px;
  overflow: hidden;
}

.sidebar-content {
  flex: 1;
}

/* 空状态样式 */
.empty-state {
  grid-column: 1 / -1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 80px 20px;
  text-align: center;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.empty-icon {
  font-size: 64px;
  margin-bottom: 20px;
  opacity: 0.6;
}

.empty-text {
  font-size: 18px;
  font-weight: 500;
  color: #94a3b8;
  margin-bottom: 30px;
}

/* 响应式设计 */
@media (max-width: 1024px) {
  .sidebar-layout {
    flex-direction: column;
  }

  .sidebar-ai {
    flex: none;
    width: 100%;
    position: static;
  }
}

@media (max-width: 768px) {
  .hero-section {
    padding: 60px 0;
    margin-bottom: 40px;
  }

  .hero-title {
    font-size: 2.5rem;
  }

  .hero-subtitle {
    font-size: 1.1rem;
  }

  .hero-buttons {
    flex-direction: column;
    align-items: center;
  }

  .btn-primary,
  .btn-secondary,
  .btn-ai {
    width: 200px;
  }

  .section-title {
    font-size: 2rem;
  }

  .features-grid {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .posts-grid {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .content-wrapper {
    padding: 0 15px;
  }

  .ai-section {
    width: 95%;
  }

  .layout-selector {
    flex-direction: column;
    align-items: center;
  }

  .layout-btn {
    width: 200px;
  }
}

@media (max-width: 480px) {
  .hero-title {
    font-size: 2rem;
  }

  .hero-subtitle {
    font-size: 1rem;
  }

  .section-title {
    font-size: 1.8rem;
  }

  .feature-card {
    padding: 30px 20px;
  }

  .feature-icon {
    font-size: 2.5rem;
  }

  .section-header {
    flex-direction: column;
    gap: 20px;
    text-align: center;
  }

  .ai-header {
    padding: 15px 20px;
  }

  .ai-container {
    padding: 15px;
  }
}
</style>
