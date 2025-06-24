<template>
  <div class="post-card">
    <div class="thumbnail"></div>
    <div class="info">
      <h3 class="title">{{ post.title }}</h3>
      <p class="excerpt">{{ post.excerpt }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PostCard',
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 显示分页
      showPagination: true,
      // 显示工具栏
      showToolbar: true,
      post: {
        title: 'Vue.js 3.0',
        excerpt: 'Vue.js 3.0 is a new major release of Vue.js.',
      },
    };
  },
};
</script>



<style scoped>
.post-card {
  display: flex;
  background: #fafafa;
  border: 1px solid #eee;
  border-radius: 6px;
  overflow: hidden;
  margin-bottom: 16px;
  padding: 12px;
}

.thumbnail {
  width: 450px;
  height: 150px;
  background-color: #eee;
  margin-right: 16px;
  border-radius: 4px;
}

.info {
  flex: 1;
}

.title {
  font-size: 18px;
  margin: 0 0 8px;
}

.excerpt {
  color: #666;
  font-size: 14px;
}
</style>
