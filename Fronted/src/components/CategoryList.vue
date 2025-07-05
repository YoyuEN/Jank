<template>
  <!-- 分类筛选 -->
  <div class="category-filter">
    <button
      v-for="category in categories"
      :key="category"
      @click="selectedCategory = category"
      :class="{ active: selectedCategory === category }"
      class="category-btn"
    >
      {{ category }}
    </button>
  </div>
</template>
<script>
export default {
  name: 'CategoryList',
  data() {
    return {
      selectedCategory: '全部', // 新增：当前选中的分类
      categories: ['全部', '前端', '后端', '算法', '运维', 'AI'], // 示例分类列表
    }
  },
  computed: {
    filteredPosts() {
      if (this.selectedCategory === '全部') {
        return this.posts
      } else {
        return this.posts.filter((post) => {
          return Array.isArray(post.categoryNames)
            ? post.categoryNames.includes(this.selectedCategory)
            : false
        })
      }
    },
  },
}
</script>
<style>
.category-filter {
  display: flex;
  gap: 10px;
  padding: 16px;
}

.category-btn {
  padding: 8px 16px;
  border: none;
  border-radius: 12px;
  cursor: pointer;
  font-weight: 500;
  font-size: 14px;
  color: #64748b;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
  border: 1.5px solid rgba(255, 255, 255, 0.3);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
  backdrop-filter: blur(10px);
  position: relative;
  overflow: hidden;
}

.category-btn.active {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-color: #667eea;
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.2);
  transform: translateY(-1px);
}
</style>
