<template>
  <div class="post-detail-container">
    <div v-if="loading" class="loading">加载中...</div>
    <div v-else-if="post" class="post-content">
      <!-- 图片与标题组合 -->
      <div class="post-header">
        <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
        <div class="post-title-overlay">
          <h1 class="post-title">{{ post.title }}</h1>
          <div class="post-meta">
            <span>发布时间：{{ post.createTime }}</span>
            <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
          </div>
        </div>
      </div>

      <div class="post-body-wrapper">
        <div class="post-body" v-html="post.contentHtml"></div>
        <div class="post-author">
          <img src="https://www.jank.org.cn/_next/image?url=https%3A%2F%2Fhaowallpaper.com%2Flink%2Fcommon%2Ffile%2FpreviewFileImg%2F16144648753630592&w=1080&q=80" alt="作者头像" class="author-avatar" />
          <span class="author-name">{{ post.title }}</span>
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

<style scoped>
.post-detail-container {
  padding: 24px;
  margin: 40px auto 0; /* 距离顶部 100px，左右自动居中 */
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
}
.post-title-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0));
  color: white;
  border-radius: 0 0 8px 8px;
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
.post-image {
  width: 100%;
  max-height: 400px;
  object-fit: cover;
  border-radius: 8px;
  margin-bottom: 20px;
}
.post-body {
  flex: 1;
  line-height: 1.6;
  color: #333;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 16px;
  background-color: #fafafa;
  transition: all 0.3s ease;
}
.post-body:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
  border-color: #ccc;
}

.loading,
.no-data {
  text-align: center;
  padding: 40px;
  font-size: 1.2em;
  color: #888;
}
.post-body-wrapper {
  display: flex;
  gap: 5%; /* 可选间距 */
  margin-top: 32px;
}
.post-author {
  width: 20%;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  border: 1px dashed #ddd;
  border-radius: 8px;
  padding: 16px;
  background-color: #f9f9f9;
  transition: all 0.3s ease;
  cursor: pointer;
}

.post-author:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
  border-color: #aaa;
}
.post-author:active {
  transform: scale(0.98);
  opacity: 0.8;
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
</style>
