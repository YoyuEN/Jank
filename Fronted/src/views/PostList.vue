<template >
  <div class="posts-container">
    <div v-if="posts.length === 0 && !loading">暂无岗位信息</div>
    <PostCard v-for="post in posts" :key="post.postId" :post="post" />
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

</style>
