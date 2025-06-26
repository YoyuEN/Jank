<template>

  <div class="post-detail-container">
    <!-- 左侧浮动按钮 -->
    <div class="sidebar-buttons">
      <button @click="showCommentPanel = true" title="发表评论" class="sidebar-btn">💬</button>
      <button @click="scrollToTop" title="回到顶部" class="sidebar-btn">⬆️</button>
    </div>
    <!-- 弹窗层 -->
    <transition name="slide">
      <div v-show="showCommentPanel" class="comment-panel">
        <div>
          <h3>发表评论</h3>
          <textarea v-model="newComment" placeholder="写下你的评论..." rows="5"></textarea>
        </div>
        <div class="comment-actions">
          <button @click="submitComment" class="submit-comment-btn">提交评论</button>
          <button @click="showCommentPanel = false" class="close-btn">关闭</button>
        </div>
      </div>
    </transition>

    <div v-if="loading" class="loading">加载中...</div>
    <div v-else-if="post" class="post-content">
      <!-- 图片与标题组合 -->
      <div class="post-header">
        <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
        <div class="title-overlay">
          <h1 class="post-title">{{ post.title }}</h1>
          <div class="post-meta">
            <span>发布时间：{{ post.createTime }}</span>
            <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
          </div>
        </div>
      </div>

      <div class="post-body-wrapper">
        <div class="post-body card" v-html="post.contentHtml"></div>
        <div class="ai-summary card">
          <h2 class="summary-title">AI 摘要</h2>
          <div class="summary-content">
            <p>这里是 AI 根据文章内容自动生成的摘要文字。你可以将实际摘要内容通过接口获取后绑定到此处，或使用前端解析逻辑生成简要概述。</p>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="no-data">未找到该岗位信息</div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { getPostDetail } from '@/api/posts/posts.js'

const route = useRoute()
const postId = route.params.postId

const post = ref(null)
const loading = ref(true)

const showCommentPanel = ref(false)
const newComment = ref('')

const submitComment = () => {
  if (newComment.value.trim()) {
    alert('模拟提交评论: ' + newComment.value)
    // TODO: 调用 API 提交评论
    newComment.value = ''
    showCommentPanel.value = false
  }
}

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

onMounted(async () => {
  try {
    const response = await getPostDetail(postId)
    if (response.code === 200) {
      post.value = response.data
    }
  } catch (error) {
    console.error('获取岗位详情失败:', error)
  } finally {
    loading.value = false
  }
})
</script>

<style>
.sidebar-buttons {
  position: fixed;
  left: 20px;
  bottom: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  z-index: 999;
}

.sidebar-btn {
  background-color: #007BFF;
  color: white;
  border: none;
  width: 48px;
  height: 48px;
  font-size: 24px;
  border-radius: 50%;
  cursor: pointer;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease;
}

.sidebar-btn:hover {
  transform: scale(1.1);
}

.comment-panel {
  position: fixed;
  right: 0;
  top: 50px;
  height: auto;
  width: 20%;
  background: white;
  padding: 24px;
  box-shadow: -4px 0 12px rgba(0, 0, 0, 0.1);
  z-index: 999;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: transform 0.3s ease;
}

.comment-panel textarea {
  width: 100%;
  resize: none;
  margin-bottom: 16px;
}

.comment-actions {
  display: flex;
  justify-content: space-between;
}
.comment-panel h3 {
  margin-top: 0;
  font-size: 1.2em;
  color: #333;
}

.submit-comment-btn {
  margin-top: 10px;
  padding: 8px 16px;
  background-color: #007BFF;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.close-btn {
  margin-left: 10px;
  padding: 8px 12px;
  background-color: #ccc;
  color: #333;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* 动画过渡效果 */
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.3s ease;
}
.slide-enter-from,
.slide-leave-to {
  transform: translateX(100%);
}

.card {
  border: 1px solid #e1e1e1;
  border-radius: 8px;
  padding: 16px;
  transition: all 0.3s ease;
}

.card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
  border-color: #ccc;
}

.title-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0));
  color: white;
  border-radius: 0 0 8px 8px;
}

.flex-center {
  display: flex;
  align-items: center;
}

.flex-column {
  flex-direction: column;
}

.post-detail-container {
  padding: 24px;
  margin: 40px auto 0;
}

.post-header {
  position: relative;
  width: 100%;
}

.post-image {
  width: 100%;
  max-height: 400px;
  object-fit: cover;
  border-radius: 8px;
  display: block;
  margin-bottom: 20px;
}

.post-title {
  font-size: 2em;
  margin-bottom: 16px;
}

.post-meta {
  font-size: 0.9em;
  color: #666;
  margin-bottom: 16px;
}

.category-tag {
  margin-left: 6px;
  color: #007acc;
}

.loading,
.no-data {
  text-align: center;
  padding: 40px;
  font-size: 1.2em;
}

.post-body-wrapper {
  display: flex;
  gap: 5%;
  margin-top: 32px;
}
.post-body {
  width: 70%;
}
.author-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 12px;
}

.author-name {
  font-weight: bold;
  margin-top: 8px;
}

.ai-summary {
  padding: 20px;
  width: 20%;
  background-color: #f9f9f9;
  border-left: 4px solid #007BFF; /* 高亮边框 */
}

.summary-title {
  font-size: 1.5em;
  color: #007BFF;
  margin-bottom: 12px;
}

.summary-content p {
  font-size: 1em;
  color: #555;
  line-height: 1.6;
}


</style>
