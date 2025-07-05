<template>
  <div>
    <div class="posts-container">
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
      <div v-if="posts.length === 0 && !loading" class="empty-state">
        <div class="empty-icon">📝</div>
        <div class="empty-text">暂无岗位信息</div>
      </div>
      <PostCard v-for="post in filteredPosts" :key="post.postId" :post="post" />
    </div>
    <div class="sidebar-buttons">
      <button
        @click="$router.push('/publishPost')"
        title="发布帖子"
        class="sidebar-btn publish-btn"
      >
        📝
      </button>
      <button @click="scrollToTop" title="回到顶部" class="sidebar-btn scroll-btn">⬆️</button>
    </div>
  </div>
</template>

<script>
import PostCard from '@/components/PostCard.vue'
import { getPostList } from '@/api/posts/posts.js'

export default {
  name: 'PostList',
  components: { PostCard },
  data() {
    return {
      posts: [],
      // 遮罩层
      loading: true,
      // 显示分页
      showPagination: true,
      // 显示工具栏
      showToolbar: true,
      // 表单参数
      form: {},
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
          return post.categoryName === this.selectedCategory
        })
      }
    },
  },
  props: {
    // 是否显示搜索条件
    showSearch: {
      type: Boolean,
      default: true,
    },
    post: {
      type: Object,
      required: true,
    },
  },
  created() {
    this.getPostList()
  },
  methods: {
    // 获取文章列表
    getPostList() {
      this.loading = true
      getPostList(this.form).then((response) => {
        // 过滤出未删除且可见的文章
        const list = Array.isArray(response.data) ? response.data : []
        this.posts = list.filter((post) => post.deleted === 0 && post.visibility)
        this.loading = false
      })
    },
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' })
    },
  },
}
</script>

<style scoped>
.posts-container {
  padding: 24px;
  max-width: 1000px;
  margin: 40px auto 0; /* 距离顶部 100px，左右自动居中 */
}

.sidebar-buttons {
  position: fixed;
  left: 50px;
  bottom: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  z-index: 999;
}

.sidebar-btn {
  width: 56px;
  height: 56px;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  backdrop-filter: blur(10px);
}

.scroll-btn {
  background: linear-gradient(135deg, #4ecdc4, #44a08d);
  color: white;
}

.publish-btn {
  background: linear-gradient(135deg, #ff6b6b, #ee5a24);
  color: white;
}

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

.category-btn::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  border-radius: 12px;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.category-btn:hover::before {
  opacity: 1;
}

.category-btn:hover {
  transform: translateY(-1px);
  color: #475569;
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.12);
  border-color: rgba(102, 126, 234, 0.2);
}

.category-btn.active {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-color: #667eea;
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.2);
  transform: translateY(-1px);
}

.category-btn.active::before {
  opacity: 0;
}

.category-btn.active:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(102, 126, 234, 0.25);
}
</style>
