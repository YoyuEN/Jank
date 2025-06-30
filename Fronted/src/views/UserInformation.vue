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
            <p class="user-detail"><span class="label">用户名：</span>{{ user.username || 'username123' }}</p>
            <p class="user-detail"><span class="label">邮箱：</span>{{ user.email || 'example@email.com' }}</p>
            <p class="user-detail"><span class="label">加入时间：</span>{{ user.createTime }}</p>
          </div>
        </div>
        <div>
          <h3>说说</h3>
        </div>
      </div>


      <!-- 右侧：帖子和评论 -->
      <div class="user-activity-panel">
        <!-- 上半部分：用户发布的帖子 -->
        <div class="posts-section">
          <h3 class="section-title">我的帖子</h3>
          <div class="posts-list">
            <div v-if="posts.length === 0" class="empty-message">
              暂无发布的帖子
            </div>
            <div v-else v-for="(post, index) in posts" :key="index" class="post-item">
              <h4 class="post-title">{{ post.title }}</h4>
              <p class="post-excerpt">{{ post.contentHtml }}</p>
              <div class="post-meta">
                <span class="post-date">{{post.createTime}}</span>
<!--                <span class="post-stats">{{ post.views }} 浏览 · {{ post.comments }} 评论</span>-->
              </div>
            </div>
          </div>
        </div>

        <!-- 下半部分：用户的评论 -->
        <div class="comments-section">
          <h3 class="section-title">我的评论</h3>
          <div class="comments-list">
            <div v-if="comments.length === 0" class="empty-message">
              暂无评论
            </div>
            <div v-else v-for="(comment, index) in comments" :key="index" class="comment-item">
              <p class="comment-content">{{ comment.content }}</p>
              <div class="comment-meta">
                <span class="comment-post">评论于：{{ comment.postTitle }}</span>
                <span class="comment-date">{{comment.createTime}}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect, onMounted } from 'vue'
import { useUserStore } from '@/store/userStore.js'
import { getUserIdPost } from '@/api/posts/posts.js'
import {getCommentByUserId} from '@/api/comment/comment.js'
// 用户基本信息
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(userStore.user || {
  avatar: '/YoyuEN.png',
  username: '游客',
  userId: ''
})
// 监听 store 的变化（响应式更新头像）
watchEffect(() => {
  if (userStore.user) {
    user.value = userStore.user
  }
})

// 用户帖子数据
const posts = ref([])
//用户评论数据
const comments = ref([])

// 获取用户帖子数据
const fetchUserPosts = async () => {
  if (user.value && user.value.userId) {
    try {
      const response = await getUserIdPost(user.value.userId)
      if (response && response.data && response.data.length > 0) {
        // 将API返回的数据映射到我们需要的格式
        posts.value = response.data.map(post => ({
          title: post.title || '无标题',
          contentHtml: post.contentHtml ? post.contentHtml.substring(0, 100) + '...' : '无内容',
          createTime: new Date(post.createTime || Date.now()),
          image: post.image || '/img1.png',
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

//获取评论
const fetchUserComment = async () => {
  if (user.value && user.value.userId) {
    try {
      const response = await getCommentByUserId(user.value.userId)
      if (response && response.data && response.data.length > 0) {
        // 将API返回的数据映射到我们需要的格式
        comments.value = response.data.map(comment => ({
          content:comment.content || '无内容',
          createTime: new Date(comment.createTime || Date.now()),
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
// 在组件挂载时获取用户帖子
onMounted(() => {
  fetchUserPosts()
  fetchUserComment()
})

// 当用户信息变化时重新获取帖子
watchEffect(() => {
  if (user.value && user.value.userId) {
    fetchUserPosts()
    fetchUserComment()
  }
})

</script>

<style scoped>
.user-container {
  min-height: calc(100vh - 80px); /* 减去导航栏的高度 */
  background-color: #f5f5f5;
  padding: 30px; /* 统一内边距 */
  margin-top:50px; /* 减少顶部外边距 */
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
  background-color: white;
  border-radius: 15px;
  padding: 30px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  height: fit-content;
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
  background-color: white;
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

/* 帖子列表样式 */
.posts-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.post-item {
  padding: 15px;
  border-radius: 8px;
  background-color: #f9f9f9;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
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

/* 评论列表样式 */
.comments-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.comment-item {
  padding: 15px;
  border-radius: 8px;
  background-color: #f9f9f9;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
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
  background-color: #f9f9f9;
  border-radius: 8px;
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
