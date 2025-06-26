<template >
  <div>
  <div class="posts-container">
    <div v-if="posts.length === 0 && !loading">暂无岗位信息</div>
    <PostCard v-for="post in posts" :key="post.postId" :post="post" />
  </div>
    <div class="sidebar-buttons">
      <button @click="showCommentPanel = true" title="发布帖子" class="sidebar-btn" >📝</button>
      <button @click="scrollToTop" title="回到顶部" class="sidebar-btn">⬆️</button>
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
    }
  },
  props: {
    // 是否显示搜索条件
    showSearch: {
      type: Boolean,
      default: true,
    },
    post: {
      type: Object,
      required: true
    }
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
        const list = Array.isArray(response.data) ? response.data : [];
        this.posts = list.filter(post => post.deleted === 0 && post.visibility);
        this.loading = false
      })
    },
  },
}
</script>

<style scoped>
.posts-container {
  padding: 24px;
  max-width: 1400px;
  margin: 40px auto 0; /* 距离顶部 100px，左右自动居中 */
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
.sidebar-buttons {
  position: fixed;
  left: 20px;
  bottom: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  z-index: 999;
}
</style>
