<template>
  <div class="post-detail-container">
    <div v-if="loading" class="loading">加载中...</div>
    <div v-else-if="post" class="post-content">
      <h1 class="post-title">{{ post.title }}</h1>
      <div class="post-meta">
        <span>发布时间：{{ post.createTime }}</span>
        <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
      </div>
      <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
      <div class="post-body" v-html="post.contentHtml"></div>
    </div>
    <div v-else class="no-data">未找到该岗位信息</div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { getPostById } from '@/api/posts/posts.js'

const route = useRoute()
const postId = route.params.id

const post = ref(null)
const loading = ref(true)

onMounted(async () => {
  try {
    const response = await getPostById(postId)
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
  max-width: 800px;
  margin: 0 auto;
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
  line-height: 1.6;
  color: #333;
}
.loading,
.no-data {
  text-align: center;
  padding: 40px;
  font-size: 1.2em;
  color: #888;
}
</style>
