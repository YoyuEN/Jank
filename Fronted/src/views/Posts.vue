<template   >
  <div class="posts-container">
    <PostCard v-for="post in posts" :key="post.id" :post="post" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import PostCard from '@/components/PostCard.vue';

const posts = ref([]);

onMounted(() => {
  // 模拟数据，可换成 API 请求
  posts.value = [
    {
      id: 1,
      title: 'Vue 3 Composition API 入门',
      excerpt: '本文介绍了 Composition API 的核心概念...',
    },
    {
      id: 2,
      title: '构建你的第一个博客系统',
      excerpt: '一步步搭建一个完整的博客应用...',
    },
    // 更多文章...
  ];
});
</script>

<style scoped>
.posts-container {
  padding: 24px;
  max-width: 1400px;
  margin: 0 auto;
}
</style>
