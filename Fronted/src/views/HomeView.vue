<template>
  <!-- 最外层容器，设置背景渐变，可根据实际调整渐变样式 -->
  <div class="home-container">
    <!-- 中间主要内容区域 -->
    <div class="content-wrapper">
      <!-- 标题和副标题 -->
      <div class="title-box">
        <h1>博客系统</h1>
        <p>探索 AI 与数字未来</p>
<!--        <button class="button-say" type="primary" @click="navigateToSay">说说</button>-->
      </div>
      <div>
        <!-- 添加一个小页面 -->
        <SmallPage />
      </div>
      <!-- 近期博客区域 -->
      <div class="blog-section">
        <div class="blog-header">
          <h3>近期博客</h3>
          <button class="button-posts" type="primary" @click="navigateToPosts">查看所有</button>
        </div>

        <div class="posts-container">
          <div v-if="posts.length === 0 && !loading">暂无岗位信息</div>
          <PostCard v-for="post in posts" :key="post.postId" :post="post" />
        </div>

        <!-- 博客列表，用 Element Plus 的卡片组件展示，这里简单循环模拟数据，实际可从接口获取 -->
        <!--        <el-row :gutter="20">-->
        <!--          <el-col :span="8" v-for="(item, index) in blogList" :key="index">-->
        <!--            <el-card :body-style="{ padding: '0px' }">-->
        <!--              <img :src="item.img" class="blog-img" alt="blog" object-cover="fill" />-->
        <!--              <div class="blog-info">-->
        <!--                <p class="blog-title">{{ item.title }}</p>-->
        <!--                <p class="blog-date">{{ item.date }}</p>-->
        <!--              </div>-->
        <!--            </el-card>-->
        <!--          </el-col>-->
        <!--        </el-row>-->
      </div>
    </div>
  </div>
</template>

<script>
import PostCard from '@/components/PostCard.vue'
import { getPostList } from '@/api/posts/posts.js'
import { useRouter } from 'vue-router'
import AIagent from '@/views/AIagent.vue'

export default {
  name: 'PostList',
  components: { SmallPage: AIagent, PostCard },
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
      required: true,
    },
  },
  setup() {
    const router = useRouter()
    const router1 = useRouter() // 获取路由实例

    const navigateToPosts = () => {
      router.push({ name: 'PostList' }) // 使用获取到的路由实例
    }
    const navigateToSay = () => {
      router1.push({ name: 'say' })
    }
    return {
      navigateToPosts,
      navigateToSay,
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
        const list = Array.isArray(response.data) ? response.data : []
        this.posts = list.filter((post) => post.deleted === 0 && post.visibility).slice(0, 2)
        this.loading = false
      })
    },
    // navigateToPosts() {
    //   const router = useRouter()
    //   router.push('/all')
    // }
  },
}
</script>

<style scoped>
/* 页面最外层容器的背景渐变样式，可根据喜好调整颜色值 */
.home-container {
  width: 100%;
  min-height: 100vh;
  background: linear-gradient(to right, #e6f7ff, #f9f0ff);
}
.blog-section {
  padding: 24px;
  max-width: 1400px;
  margin: 40px auto 0; /* 距离顶部 100px，左右自动居中 */
}
/* 内容区域的包裹层，设置内边距等 */
.content-wrapper {
  width: 80%;
  margin: 0 auto;
  padding: 50px 0;
}
/* 标题区域样式 */
.title-box {
  text-align: center;
  margin-bottom: 50px;
}
.title-box h1 {
  font-size: 36px;
  font-weight: bold;
  margin-bottom: 10px;
}
.title-box p {
  font-size: 18px;
  color: #666;
  margin-bottom: 20px;
}

.blog-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
.blog-header h3 {
  font-size: 20px;
  font-weight: bold;
}
.posts-container {
  padding: 24px;
  max-width: 1400px;
  margin: 40px auto 0; /* 距离顶部 100px，左右自动居中 */
}
.button-say {
  padding: 12px 24px;
  border: none;
  border-radius: 12px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  background: rgba(255, 255, 255, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.18);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  color: #333;
}
.button-posts {
  padding: 12px 24px;
  border: none;
  border-radius: 12px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  background: rgba(255, 255, 255, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.18);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  color: #333;
}
</style>
