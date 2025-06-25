<template>
  <div v-if="post" class="post-card" @click="$router.push(`/post/${post.postId}`)">
    <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
    <h3 class="post-title">{{ post.title }}</h3>
    <div class="post-meta">
      <span class="post-time">{{ post.createTime }}</span>
      <span class="post-categories">
        <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
      </span>
    </div>
    <div class="post-content" v-html="post.contentHtml.slice(0, 100) + '...'"></div>
  </div>
</template>

<script setup>
defineProps({
  post: {
    type: Object,
    required: true
  }
})
</script>

<style scoped>
.post-card {
  border: 1px solid #eee;
  padding: 16px;
  border-radius: 12px;
  margin-bottom: 20px;
  background: #fff;
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
  color: #666;
}
.category-tag {
  margin-left: 6px;
  color: #007acc;
}
.post-content {
  margin-top: 10px;
  color: #444;
}
</style>
