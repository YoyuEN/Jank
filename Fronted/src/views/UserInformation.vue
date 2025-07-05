<template>
  <div class="user-container">
    <div class="user-dashboard">
      <!-- 左侧：用户基本信息 -->
      <div>
        <div class="user-info-panel">
          <div class="avatar-section">
            <div class="avatar-wrapper">
              <img
                :src="user.avatar || 'https://via.placeholder.com/150'"
                alt="用户头像"
                class="avatar-image"
              />
            </div>
          </div>
          <div class="info-section">
            <h2 class="username">{{ user.nickname || '用户昵称' }}</h2>
            <p class="user-detail">
              <span class="label">用户名：</span>{{ user.username || 'username123' }}
            </p>
            <p class="user-detail">
              <span class="label">邮箱：</span>{{ user.email || 'example@email.com' }}
            </p>
            <p class="user-detail"><span class="label">加入时间：</span>{{ user.createTime }}</p>
            <p class="user-detail">
              <span class="label">地址：</span>{{ userInfo.address || '未设置' }}
            </p>
          </div>
        </div>

        <!-- 技术栈信息 -->
        <div class="tech-stack-panel">
          <div class="tech-stack-header">
            <h3 class="tech-stack-title">技术栈</h3>
            <button class="edit-tech-btn" @click="editTechStack">
              <span class="edit-icon">✏️</span>
              修改
            </button>
          </div>
          <div class="tech-stack-content">
            <div v-if="userInfo.techStacks && userInfo.techStacks.length > 0" class="tech-tags">
              <span
                v-for="tech in userInfo.techStacks"
                :key="tech"
                class="tech-tag"
                :class="getTechTagClass(tech)"
              >
                # {{ tech }}
              </span>
            </div>
            <div v-else class="no-tech-stack">
              <span class="no-tech-text">暂无技术栈信息</span>
            </div>
          </div>
        </div>
      </div>

      <!-- 右侧：帖子和评论 -->
      <div class="user-activity-panel">
        <!-- 上半部分：用户内容导航 -->
        <div class="content-section">
          <div class="content-nav">
            <div
              class="nav-item"
              :class="{ active: activeTab === 'posts' }"
              @click="activeTab = 'posts'"
            >
              我的帖子
            </div>
            <div
              class="nav-item"
              :class="{ active: activeTab === 'moments' }"
              @click="activeTab = 'moments'"
            >
              我的说说
            </div>
            <div
              class="nav-item"
              :class="{ active: activeTab === 'comments' }"
              @click="activeTab = 'comments'"
            >
              我的评论
            </div>
          </div>

          <!-- 帖子内容 -->
          <div v-if="activeTab === 'posts'" class="tab-content">
            <div class="posts-list">
              <div v-if="posts.length === 0" class="empty-message">暂无发布的帖子</div>
              <div
                v-else
                v-for="(post, index) in posts"
                :key="index"
                class="post-item"
                @click="$router.push(`/posts/${post.postId}`)"
              >
                <h4 class="post-title">{{ post.title }}</h4>
                <p class="post-excerpt">{{ post.contentHtml }}</p>
                <div class="post-meta">
                  <span class="post-date">{{ post.createTime }}</span>
                  <div class="menu-container">
                    <button class="menu-button" @click.stop="post.showMenu = !post.showMenu">
                      ...
                    </button>
                    <div v-show="post.showMenu" class="dropdown-menu">
                      <button class="menu-item" @click.stop="updatePostInfo(post.postId)">
                        更新
                      </button>
                      <button class="menu-item" @click.stop="deletePost(post.postId)">删除</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 说说内容 -->
          <div v-if="activeTab === 'moments'" class="tab-content">
            <div class="moments-list">
              <div v-if="moments.length === 0" class="empty-message">暂无发布的说说</div>
              <!-- 这里可以添加说说内容，目前显示为空 -->
              <div v-else v-for="(moment, index) in moments" :key="index" class="post-item">
                <p class="post-excerpt">{{ moment.content }}</p>
                <div class="post-meta">
                  <span class="post-date">{{ moment.createTime }}</span>
                  <button class="delete-button" @click.stop="deleteMoment(moment.momentId)">
                    删除
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 下半部分：用户的评论 -->
        <div v-if="activeTab === 'comments'" class="tab-content">
          <div class="comments-list">
            <div v-if="comments.length === 0" class="empty-message">暂无评论</div>
            <div v-else v-for="(comment, index) in comments" :key="index" class="comment-item">
              <p class="comment-content">{{ comment.content }}</p>
              <div class="comment-meta">
                <span class="comment-post">评论于：{{ comment.username }}</span>
                <span class="comment-date">{{ comment.createTime }}</span>
                <button class="delete-button" @click.stop="deleteComments(comment.commentId)">
                  删除
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 技术栈编辑穿梭框 -->
    <div v-if="showTechStackTransfer" class="modal-overlay" @click="closeTechStackTransfer">
      <div @click.stop>
        <TechStackTransfer
          :current-tech-stack="userInfo.techStacks || []"
          @close="closeTechStackTransfer"
          @update="updateTechStack"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect, onMounted } from 'vue'
import { useUserStore } from '@/store/userStore.js'
import { getUserIdPost } from '@/api/posts/posts.js'
import { getCommentByUserId } from '@/api/comment/comment.js'
import { getUserIdMoment } from '@/api/moments/moments.js'
import { deletePostById, deleteMomentById, deleteCommentById } from '@/api/delete/delete.js'
import { ElMessageBox, ElMessage } from 'element-plus'
import { updatePost } from '@/api/posts/posts.js'
import { getUserByUserId } from '@/api/user/user.js'
import TechStackTransfer from '@/components/TechStackTransfer.vue'
// 用户基本信息
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(
  userStore.user || {
    avatar: '/YoyuEN.png',
    username: '游客',
    userId: '',
    address: '',
  },
)
const userInfo = ref({})

// 获取用户详细信息
const fetchUserInfo = async () => {
  if (userStore.user && userStore.user.userId) {
    try {
      const response = await getUserByUserId(userStore.user.userId)
      if (response && response.data) {
        userInfo.value = response.data
      }
    } catch (error) {
      console.error('获取用户详细信息失败:', error)
    }
  }
}

// 监听 store 的变化（响应式更新头像）
watchEffect(() => {
  if (userStore.user) {
    user.value = userStore.user
  }
})

// 用户帖子数据
const posts = ref([])

//用户说说数据
const moments = ref([])

//用户评论数据
const comments = ref([])
// 当前激活的标签页
const activeTab = ref('posts') // 默认显示帖子

// 技术栈穿梭框显示状态
const showTechStackTransfer = ref(false)

// 获取用户帖子数据
const fetchUserPosts = async () => {
  if (user.value && user.value.userId) {
    try {
      const response = await getUserIdPost(user.value.userId)
      if (response && response.data && response.data.length > 0) {
        // 将API返回的数据映射到我们需要的格式
        posts.value = response.data.map((post) => ({
          title: post.title || '无标题',
          contentHtml: post.contentHtml ? post.contentHtml.substring(0, 100) + '...' : '无内容',
          createTime: new Date(post.createTime || Date.now()),
          postId: post.postId,
          image: post.image || '/img1.png',
          showMenu: false,
          // views: post.views || 0,
          // comments: post.commentCount || 0
        }))
      } else {
        posts.value = []
      }
    } catch (error) {
      console.error('获取用户帖子失败:', error)
      posts.value = []
    }
  }
}
//获取用户说说数据
const fetchUsermoments = async () => {
  if (user.value && user.value.userId) {
    try {
      const response = await getUserIdMoment(user.value.userId)
      if (response && response.data && response.data.length > 0) {
        // 将API返回的数据映射到我们需要的格式
        moments.value = response.data.map((moments) => ({
          momentId: moments.momentId,
          content: moments.content ? moments.content.substring(0, 100) + '...' : '无内容',
          createTime: new Date(moments.createTime || Date.now()),
        }))
      } else {
        posts.value = []
      }
    } catch (error) {
      console.error('获取用户帖子失败:', error)
      posts.value = []
    }
  }
}

//获取评论
const fetchUserComment = async () => {
  if (user.value && user.value.userId) {
    try {
      const response = await getCommentByUserId(user.value.userId)
      if (response && response.data && response.data.length > 0) {
        // 将API返回的数据映射到我们需要的格式
        comments.value = response.data.map((comment) => ({
          content: comment.content || '无内容',
          createTime: new Date(comment.createTime || Date.now()),
          username: comment.username || '游客',
          commentId: comment.commentId,
        }))
      } else {
        comments.value = []
      }
    } catch (error) {
      console.error('获取用户评论失败:', error)
      comments.value = []
    }
  }
}
//更新
const updatePostInfo = async (postId) => {
  try {
    const response = await updatePost(postId)
    if (response.code === 200) {
      ElMessage({
        type: 'success',
        message: '更新成功',
      })
    }
  } catch (error) {
    console.error('更新帖子失败:', error)
    ElMessage({
      type: 'error',
      message: '更新失败',
    })
  }
}
//删除
const deletePost = async (postId) => {
  try {
    // 显示确认对话框
    await ElMessageBox.confirm('确定要删除这篇帖子吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })

    // 用户确认后执行删除操作
    const response = await deletePostById(postId)
    if (response.data) {
      // 删除成功，从列表中移除该帖子
      posts.value = posts.value.filter((post) => post.postId !== postId)
      ElMessage({
        type: 'success',
        message: '帖子删除成功',
      })
    }
  } catch (error) {
    if (error !== 'cancel') {
      // 用户取消不显示错误
      console.error('删除帖子失败:', error)
      ElMessage({
        type: 'error',
        message: '删除帖子失败',
      })
    }
  }
}

const deleteMoment = async (momentId) => {
  try {
    // 显示确认对话框
    await ElMessageBox.confirm('确定要删除这条说说吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })

    // 用户确认后执行删除操作
    const response = await deleteMomentById(momentId)
    if (response.data) {
      // 删除成功，从列表中移除该说说
      moments.value = moments.value.filter((moment) => moment.momentId !== momentId)
      ElMessage({
        type: 'success',
        message: '说说删除成功',
      })
    }
  } catch (error) {
    if (error !== 'cancel') {
      // 用户取消不显示错误
      console.error('删除说说失败:', error)
      ElMessage({
        type: 'error',
        message: '删除说说失败',
      })
    }
  }
}

const deleteComments = async (commentId) => {
  try {
    // 显示确认对话框
    await ElMessageBox.confirm('确定要删除这条评论吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })

    // 用户确认后执行删除操作
    const response = await deleteCommentById(commentId)
    if (response.data) {
      // 删除成功，从列表中移除该评论
      comments.value = comments.value.filter((comment) => comment.commentId !== commentId)
      ElMessage({
        type: 'success',
        message: '评论删除成功',
      })
    }
  } catch (error) {
    if (error !== 'cancel') {
      // 用户取消不显示错误
      console.error('删除评论失败:', error)
      ElMessage({
        type: 'error',
        message: '删除评论失败',
      })
    }
  }
}

// 编辑技术栈
const editTechStack = () => {
  showTechStackTransfer.value = true
}

// 关闭技术栈穿梭框
const closeTechStackTransfer = () => {
  showTechStackTransfer.value = false
}

// 更新技术栈
const updateTechStack = (newTechStack) => {
  userInfo.value.techStacks = newTechStack
}

// 获取技术栈标签的CSS类
const getTechTagClass = (techName) => {
  const techColors = {
    Java: 'tech-java',
    Python: 'tech-python',
    JavaScript: 'tech-javascript',
    'C++': 'tech-cpp',
    Ruby: 'tech-ruby',
    Go: 'tech-go',
    Swift: 'tech-swift',
    Kotlin: 'tech-kotlin',
    Rust: 'tech-rust',
    SQL: 'tech-sql',
  }
  return techColors[techName] || 'tech-default'
}
// 在组件挂载时获取用户帖子
onMounted(() => {
  fetchUserPosts()
  fetchUserComment()
  fetchUsermoments()
  fetchUserInfo()
})

// 当用户信息变化时重新获取帖子
watchEffect(() => {
  if (user.value && user.value.userId) {
    fetchUserPosts()
    fetchUserComment()
    fetchUsermoments()
  }
})
</script>

<style scoped>
.user-container {
  min-height: calc(100vh - 80px); /* 减去导航栏的高度 */
  padding: 30px; /* 统一内边距 */
  margin-top: 50px; /* 减少顶部外边距 */
}

.user-dashboard {
  display: grid;
  grid-template-columns: 300px 1fr;
  gap: 30px;
  max-width: 1200px;
  margin: 0 auto;
}

/* 左侧：用户信息面板 */
.user-info-panel {
  border-radius: 15px;
  padding: 30px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  height: fit-content;
  margin-bottom: 20px;
}

/* 技术栈面板 */
.tech-stack-panel {
  border-radius: 15px;
  padding: 25px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  background: white;
}

.tech-stack-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.tech-stack-title {
  font-size: 18px;
  color: #333;
  margin: 0;
  font-weight: 600;
}

.edit-tech-btn {
  display: flex;
  align-items: center;
  gap: 5px;
  padding: 8px 16px;
  border: 1px solid #1890ff;
  border-radius: 6px;
  background: white;
  color: #1890ff;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.3s ease;
}

.edit-tech-btn:hover {
  background: #1890ff;
  color: white;
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(24, 144, 255, 0.3);
}

.edit-icon {
  font-size: 12px;
}

.tech-stack-content {
  min-height: 60px;
}

.tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.tech-tag {
  padding: 8px 16px;
  color: white;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.tech-tag::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
  opacity: 0;
  transition: opacity 0.3s ease;
}

.tech-tag:hover::before {
  opacity: 1;
}

.tech-tag:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
}

/* Java */
.tech-java {
  background: linear-gradient(135deg, #f89820, #e76f00);
}

/* Python */
.tech-python {
  background: linear-gradient(135deg, #3776ab, #ffde57);
  color: #2d5aa0;
}

/* JavaScript */
.tech-javascript {
  background: linear-gradient(135deg, #f7df1e, #f0db4f);
  color: #323330;
}

/* C++ */
.tech-cpp {
  background: linear-gradient(135deg, #00599c, #004482);
}

/* Ruby */
.tech-ruby {
  background: linear-gradient(135deg, #cc342d, #a91e1a);
}

/* Go */
.tech-go {
  background: linear-gradient(135deg, #00add8, #007d9e);
}

/* Swift */
.tech-swift {
  background: linear-gradient(135deg, #ff6b35, #f7931e);
}

/* Kotlin */
.tech-kotlin {
  background: linear-gradient(135deg, #7f52ff, #6b46c1);
}

/* Rust */
.tech-rust {
  background: linear-gradient(135deg, #ce422b, #a91e1a);
}

/* SQL */
.tech-sql {
  background: linear-gradient(135deg, #336791, #2c5aa0);
}

/* 默认样式 */
.tech-default {
  background: linear-gradient(135deg, #667eea, #764ba2);
}

.no-tech-stack {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 60px;
  border: 2px dashed #ddd;
  border-radius: 8px;
  background: #fafafa;
}

.no-tech-text {
  color: #999;
  font-size: 14px;
  font-style: italic;
}

/* 遮罩层样式 */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.avatar-section {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.avatar-wrapper {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  overflow: hidden;
  box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease;
}

.avatar-wrapper:hover {
  transform: scale(1.05);
}

.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.info-section {
  text-align: center;
}

.username {
  font-size: 24px;
  color: #333;
  margin: 0 0 20px 0;
  font-weight: 600;
}

.user-detail {
  text-align: left;
  margin: 10px 0;
  color: #555;
  font-size: 14px;
}

.label {
  font-weight: 600;
  color: #333;
  margin-right: 5px;
}

/* 右侧：活动面板 */
.user-activity-panel {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.posts-section,
.comments-section {
  border-radius: 15px;
  padding: 25px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.section-title {
  font-size: 20px;
  color: #333;
  margin: 0 0 20px 0;
  padding-bottom: 10px;
  border-bottom: 2px solid #eee;
}

/* 内容导航样式 */
.content-nav {
  display: flex;
  border-bottom: 2px solid #eee;
  margin-bottom: 20px;
}

.nav-item {
  padding: 12px 20px;
  font-size: 16px;
  font-weight: 500;
  color: #555;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
}

.nav-item:hover {
  color: #333;
}

.nav-item.active {
  color: #1890ff;
}

.nav-item.active::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: #1890ff;
}

.tab-content {
  padding: 10px 0;
}

/* 帖子列表样式 */
.posts-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
  max-height: 400px; /* 限制最大高度 */
  overflow-y: auto; /* 添加垂直滚动条 */
  padding-right: 10px; /* 为滚动条留出空间 */
}

/* 自定义评论滚动条样式 */
.comments-list::-webkit-scrollbar {
  width: 6px;
}

.comments-list::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

.comments-list::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 10px;
}

.comments-list::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

.post-item {
  padding: 15px;
  border-radius: 8px;
  transition:
    transform 0.2s ease,
    box-shadow 0.2s ease;
}

.post-item:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.post-title {
  font-size: 16px;
  color: #222;
  margin: 0 0 8px 0;
}

.post-excerpt {
  font-size: 14px;
  color: #555;
  margin: 0 0 10px 0;
  line-height: 1.4;
}

.post-meta {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: #777;
}

.delete-button {
  background-color: white;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 2px 8px;
  font-size: 12px;
  color: #666;
  cursor: pointer;
  transition: all 0.2s ease;
}

.delete-button:hover {
  background-color: #f5f5f5;
  border-color: #ccc;
  color: #333;
}

/* 评论列表样式 */
.comments-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
  max-height: 400px; /* 限制最大高度 */
  overflow-y: auto; /* 添加垂直滚动条 */
  padding-right: 10px; /* 为滚动条留出空间 */
}

/* 说说列表样式 */
.moments-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
  max-height: 400px; /* 限制最大高度 */
  overflow-y: auto; /* 添加垂直滚动条 */
  padding-right: 10px; /* 为滚动条留出空间 */
}

.moments-list::-webkit-scrollbar {
  width: 6px;
}

.moments-list::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

.moments-list::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 10px;
}

.moments-list::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

/* 自定义评论滚动条样式 */
.comments-list::-webkit-scrollbar {
  width: 6px;
}

.comments-list::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

.comments-list::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 10px;
}

.comments-list::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

.comment-item {
  padding: 15px;
  border-radius: 8px;
  transition:
    transform 0.2s ease,
    box-shadow 0.2s ease;
}

.comment-item:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.comment-content {
  font-size: 14px;
  color: #333;
  margin: 0 0 10px 0;
  line-height: 1.4;
}

.comment-meta {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: #777;
}

.empty-message {
  padding: 20px;
  text-align: center;
  color: #777;
  font-style: italic;
  border-radius: 8px;
}

/* 下拉菜单样式 */
.menu-container {
  position: relative;
  display: inline-block;
}

.menu-button {
  background-color: white;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 2px 8px;
  font-size: 12px;
  color: #666;
  cursor: pointer;
  transition: all 0.2s ease;
}

.menu-button:hover {
  background-color: #f5f5f5;
  border-color: #ccc;
  color: #333;
}

.dropdown-menu {
  position: absolute;
  right: 0;
  top: 100%;
  background-color: white;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  z-index: 1;
  min-width: 80px;
}

.menu-item {
  display: block;
  width: 100%;
  padding: 6px 12px;
  text-align: left;
  background: none;
  border: none;
  color: #333;
  font-size: 12px;
  cursor: pointer;
}

.menu-item:hover {
  background-color: #f5f5f5;
}

/* 响应式布局 */
@media (max-width: 900px) {
  .user-dashboard {
    grid-template-columns: 1fr;
  }

  .user-info-panel {
    margin-bottom: 30px;
  }
}

@media (max-width: 600px) {
  .user-container {
    padding: 15px;
  }

  .avatar-wrapper {
    width: 120px;
    height: 120px;
  }

  .username {
    font-size: 20px;
  }

  .section-title {
    font-size: 18px;
  }
}
</style>
