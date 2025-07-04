<template>
  <div class="moment-page">
    <!-- 侧边浮动按钮 -->
    <div class="sidebar-buttons">
      <button
        @click="$router.push('/publishMoment')"
        title="发布说说"
        class="sidebar-btn publish-btn"
      >
        <span class="btn-icon">✏️</span>
      </button>
      <button @click="scrollToTop" title="回到顶部" class="sidebar-btn scroll-btn">
        <span class="btn-icon">⬆️</span>
      </button>
    </div>

    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <div class="loading-spinner"></div>
      <p class="loading-text">正在加载朋友圈...</p>
    </div>

    <!-- 主要内容区域 -->
    <div class="moment-container">
      <!-- 左侧分类菜单 -->
      <div class="category-menu">
        <h3 class="category-title">分类</h3>
        <ul class="category-list">
          <li
            v-for="(category, index) in categories"
            :key="index"
            :class="{ active: selectedCategory === category }"
            @click="selectCategory(category)"
            class="category-item"
          >
            <span class="category-icon">
              {{ category === '全部' ? '📱' : category === '生活' ? '🏠' : '🎉' }}
            </span>
            {{ category }}
          </li>
        </ul>
      </div>

      <!-- 右侧朋友圈列表 -->
      <div class="moment-list">
        <div v-for="(moment, index) in filteredMoments" :key="index" class="moment-card">
          <!-- 朋友圈头部 -->
          <div class="moment-header">
            <div class="user-avatar">
              <img :src="moment.avatarUrl" alt="头像" class="avatar" />
            </div>
            <div class="user-info">
              <span class="username">{{ moment.username }}</span>
              <span class="time">{{ moment.createTime }}</span>
            </div>
            <div class="moment-category" v-if="moment.category && moment.category !== '全部'">
              <span class="category-tag">{{ moment.category }}</span>
            </div>
          </div>

          <!-- 文字内容 -->
          <div class="moment-content">
            <p class="content-text">{{ moment.content }}</p>
          </div>

          <!-- 图片展示 -->
          <div v-if="moment.imageUrls && moment.imageUrls.length > 0" class="moment-images">
            <div
              v-for="(img, idx) in moment.imageUrls.slice(0, 9)"
              :key="idx"
              class="image-container"
              :class="getImageGridClass(moment.imageUrls.length)"
            >
              <img :src="img" alt="图片" class="moment-image" />
            </div>
          </div>

          <!-- 互动按钮 -->
          <div class="moment-actions">
            <button
              @click="handleLike(moment.momentId)"
              :class="{ liked: moment.likedByUser }"
              class="action-btn like-btn"
            >
              <span class="action-icon">{{ moment.likedByUser ? '❤️' : '🤍' }}</span>
              <span class="action-text">{{ moment.likedByUser ? '已点赞' : '点赞' }}</span>
              <span class="action-count">{{ moment.likeCount }}</span>
            </button>
            <button @click="toggleComments(moment.momentId)" class="action-btn comment-btn">
              <span class="action-icon">💬</span>
              <span class="action-text">评论</span>
              <span class="action-count">{{ moment.comments.length }}</span>
            </button>
          </div>

          <!-- 评论区域 -->
          <div v-if="moment.showComments" class="comments-section">
            <div class="comments-header">
              <h4 class="comments-title">评论 ({{ moment.comments.length }})</h4>
            </div>

            <!-- 评论列表 -->
            <div v-if="moment.comments.length > 0" class="comments-list">
              <div v-for="(comment, cIndex) in moment.comments" :key="cIndex" class="comment-item">
                <div class="comment-avatar">
                  <span class="comment-avatar-text">{{ comment.nickname.charAt(0) }}</span>
                </div>
                <div class="comment-content">
                  <div class="comment-header">
                    <span class="comment-author">{{ comment.nickname }}</span>
                  </div>
                  <p class="comment-text">{{ comment.content }}</p>
                </div>
              </div>
            </div>

            <!-- 评论输入框 -->
            <div class="comment-box">
              <div class="comment-input-wrapper">
                <textarea
                  v-model="newComment.content"
                  placeholder="写下你的评论..."
                  class="comment-textarea"
                  rows="3"
                ></textarea>
                <button @click="submitComment" class="comment-submit-btn">
                  <span class="submit-icon">📤</span>
                  发布
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- 空状态 -->
        <div v-if="filteredMoments.length === 0 && !loading" class="empty-state">
          <div class="empty-icon">📭</div>
          <p class="empty-text">暂无朋友圈内容</p>
          <button @click="$router.push('/publishMoment')" class="empty-action-btn">
            发布第一条朋友圈
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { addMomentComment, cancelLike, getMomentList, likeMoment } from '@/api/moments/moments.js'
import { useUserStore } from '@/store/userStore.js'

export default {
  name: 'MomentView',
  data() {
    return {
      categories: ['全部', '生活', '趣事'],
      selectedCategory: '全部',
      moments: [],
      loading: false,
      showCommentBox: false,
      newComment: {
        userId: '', // 用户ID
        content: '', // 评论内容
        momentId: '', // 对应的朋友圈ID
      },
    }
  },
  computed: {
    filteredMoments() {
      if (this.selectedCategory === '全部') {
        return this.moments
      } else if (this.selectedCategory === '生活') {
        return this.moments.filter((m) => m.category === '生活')
      } else if (this.selectedCategory === '趣事') {
        return this.moments.filter((m) => m.category === '趣事')
      }
      return this.moments
    },
  },

  async mounted() {
    console.log('mounted 被调用了')
    this.loading = true
    try {
      const response = await getMomentList()
      console.log('原始响应:', response)
      console.log('映射前的 data:', response.data)

      if (response.code === 200 && Array.isArray(response.data)) {
        this.moments = response.data.map((moment) => ({
          momentId: moment.momentId,
          content: moment.content,
          userId: moment.userId,
          username: moment.username,
          category: moment.category,
          avatarUrl: moment.avatarUrl,
          imageUrls: moment.imageUrls || [],
          likeCount: moment.likeCount || 0,
          likedByUser: !!moment.likedByUser,
          comments: moment.comments || [],
          createTime: moment.createTime,
          showComments: false,
        }))
        console.log('第一条朋友圈:', this.moments[0])
      } else {
        this.moments = []
        this.$message.error('获取朋友圈失败')
      }
    } catch (error) {
      console.error('获取朋友圈出错:', error)
      this.$message.error('网络异常，请稍后再试')
      this.moments = []
    } finally {
      this.loading = false
    }
  },

  methods: {
    getImageGridClass(imageCount) {
      if (imageCount === 1) return 'single-image'
      if (imageCount === 2) return 'two-images'
      if (imageCount === 3) return 'three-images'
      if (imageCount === 4) return 'four-images'
      return 'multiple-images'
    },

    submitComment() {
      if (!this.newComment.content.trim()) return

      const formData = new FormData()
      formData.append('momentId', this.newComment.momentId)
      formData.append('content', this.newComment.content)
      formData.append('userId', this.newComment.userId)

      addMomentComment(formData).then(() => {
        console.log('评论已提交:', this.newComment)

        this.moments = this.moments.map((m) => {
          if (m.momentId === this.newComment.momentId) {
            return {
              ...m,
              comments: [
                ...m.comments,
                {
                  nickname: useUserStore().user.username,
                  content: this.newComment.content,
                },
              ],
            }
          }
          return m
        })

        this.newComment.content = ''
        this.showCommentBox = false
      })
    },

    scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' })
    },

    selectCategory(category) {
      this.selectedCategory = category
    },

    toggleComments(momentId) {
      const userStore = useUserStore()
      // 判断userStore是否为空
      if (!userStore.user || !userStore.user.userId) {
        this.$message.error('请先登录后再查看评论')
        return
      }

      this.newComment = {
        userId: userStore.user.userId,
        content: '',
        momentId: momentId,
      }

      this.moments = this.moments.map((m) => {
        if (m.momentId === momentId) {
          return { ...m, showComments: !m.showComments }
        }
        return m
      })
    },

    async fetchMoments() {
      this.loading = true
      try {
        const response = await getMomentList()
        if (response.code === 200) {
          this.moments = response.data.map((moment) => ({
            ...moment,
            showComments: false,
            likeCount: moment.likeCount || 0,
            comments: moment.comments || [],
          }))
        } else {
          this.$message.error('获取朋友圈失败')
        }
      } catch (error) {
        console.error('获取朋友圈出错:', error)
        this.$message.error('网络异常，请稍后再试')
      } finally {
        this.loading = false
      }
    },

    async handleLike(momentId) {
      const moment = this.moments.find((m) => m.momentId === momentId)
      if (!moment) {
        console.error('找不到对应的朋友圈:', momentId)
        return
      }
      const isLiked = !moment.likedByUser

      try {
        if (isLiked) {
          await likeMoment(moment.momentId)
          console.log(momentId)
          console.log(moment.momentId)
          moment.likeCount += 1
        } else {
          await cancelLike(moment.momentId)
          moment.likeCount -= 1
        }
        moment.likedByUser = isLiked
      } catch (error) {
        console.error('点赞失败:', error)
        this.$message.error('操作失败，请重试')
      }
    },
  },
}
</script>

<style scoped>
/* 页面整体样式 */
.moment-page {
  height: auto;
  padding: 20px 0;
  margin-top: 40px;
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

.publish-btn {
  background: linear-gradient(135deg, #ff6b6b, #ee5a24);
  color: white;
}

.scroll-btn {
  background: linear-gradient(135deg, #4ecdc4, #44a08d);
  color: white;
}

.sidebar-btn:hover {
  transform: translateY(-3px) scale(1.05);
  box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
}

/* 加载状态 */
.loading-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 200px;
  color: white;
}

.loading-spinner {
  width: 40px;
  height: 40px;
  border: 4px solid rgba(255, 255, 255, 0.3);
  border-top: 4px solid white;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 15px;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.loading-text {
  font-size: 16px;
  font-weight: 500;
}

/* 主容器 */
.moment-container {
  display: flex;
  max-width: 1200px;
  margin: 0 auto;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(20px);
  overflow: hidden;
}

/* 左侧分类菜单 */
.category-menu {
  width: 200px;
  background: linear-gradient(180deg, #f8f9fa 0%, #e9ecef 100%);
  padding: 30px 20px;
  border-right: 1px solid rgba(0, 0, 0, 0.1);
}

.category-title {
  font-size: 18px;
  font-weight: 600;
  color: #495057;
  margin-bottom: 25px;
  text-align: center;
}

.category-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.category-item {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  margin-bottom: 8px;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #6c757d;
  font-weight: 500;
}

.category-item:hover {
  background: rgba(102, 126, 234, 0.1);
  color: #667eea;
  transform: translateX(5px);
}

.category-item.active {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.category-icon {
  margin-right: 12px;
  font-size: 16px;
}

/* 右侧朋友圈列表 */
.moment-list {
  flex: 1;
  padding: 30px;
  max-height: 80vh;
  overflow-y: auto;
}

.moment-list::-webkit-scrollbar {
  width: 6px;
}

.moment-list::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 3px;
}

.moment-list::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 3px;
}

.moment-list::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

/* 朋友圈卡片 */
.moment-card {
  background: white;
  border-radius: 16px;
  padding: 24px;
  margin-bottom: 24px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 1px solid rgba(0, 0, 0, 0.05);
}

.moment-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
}

/* 朋友圈头部 */
.moment-header {
  display: flex;
  align-items: center;
  margin-bottom: 16px;
  position: relative;
}

.user-avatar {
  margin-right: 12px;
}

.avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #f8f9fa;
  transition: transform 0.3s ease;
}

.avatar:hover {
  transform: scale(1.1);
}

.user-info {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.username {
  font-weight: 600;
  font-size: 16px;
  color: #212529;
  margin-bottom: 2px;
}

.time {
  font-size: 13px;
  color: #6c757d;
}

.moment-category {
  position: absolute;
  right: 0;
  top: 0;
}

.category-tag {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 500;
}

/* 朋友圈内容 */
.moment-content {
  margin-bottom: 16px;
}

.content-text {
  font-size: 15px;
  line-height: 1.6;
  color: #495057;
  margin: 0;
  word-wrap: break-word;
}

/* 图片展示 */
.moment-images {
  margin-bottom: 16px;
  display: flex;
  gap: 8px;
}

.image-container {
  overflow: hidden;
  border-radius: 12px;
  background: #f8f9fa;
  width: 150px;
  height: 150px;
}

.moment-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.moment-image:hover {
  transform: scale(1.05);
}

/* 图片网格布局 */
.single-image {
  grid-template-columns: 1fr;
}

.two-images {
  grid-template-columns: repeat(2, 1fr);
}

.three-images {
  grid-template-columns: repeat(3, 1fr);
}

.four-images {
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, 1fr);
}

.multiple-images {
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 1fr);
}

/* 互动按钮 */
.moment-actions {
  display: flex;
  gap: 16px;
  margin-bottom: 16px;
  padding-top: 16px;
  border-top: 1px solid #f1f3f4;
}

.action-btn {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  border: none;
  border-radius: 25px;
  background: #f8f9fa;
  color: #6c757d;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  font-weight: 500;
}

.action-btn:hover {
  background: #e9ecef;
  transform: translateY(-1px);
}

.action-btn.liked {
  background: linear-gradient(135deg, #ff6b6b, #ee5a24);
  color: white;
}

.action-icon {
  font-size: 16px;
}

.action-count {
  background: rgba(0, 0, 0, 0.1);
  padding: 2px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: 600;
}

/* 评论区域 */
.comments-section {
  background: #f8f9fa;
  border-radius: 12px;
  padding: 20px;
  margin-top: 16px;
}

.comments-header {
  margin-bottom: 16px;
}

.comments-title {
  font-size: 16px;
  font-weight: 600;
  color: #495057;
  margin: 0;
}

/* 评论列表 */
.comments-list {
  margin-bottom: 20px;
}

.comment-item {
  display: flex;
  gap: 12px;
  margin-bottom: 16px;
  padding: 12px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.comment-avatar {
  flex-shrink: 0;
}

.comment-avatar-text {
  width: 32px;
  height: 32px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  font-size: 14px;
}

.comment-content {
  flex: 1;
}

.comment-header {
  margin-bottom: 4px;
}

.comment-author {
  font-weight: 600;
  font-size: 14px;
  color: #495057;
}

.comment-text {
  font-size: 14px;
  color: #6c757d;
  line-height: 1.5;
  margin: 0;
}

/* 评论输入框 */
.comment-box {
  margin-top: 16px;
}

.comment-input-wrapper {
  display: flex;
  gap: 12px;
  align-items: flex-end;
}

.comment-textarea {
  flex: 1;
  padding: 12px 16px;
  border: 2px solid #e9ecef;
  border-radius: 12px;
  font-size: 14px;
  resize: vertical;
  min-height: 60px;
  transition: all 0.3s ease;
  font-family: inherit;
}

.comment-textarea:focus {
  outline: none;
  border-color: #667eea;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.comment-submit-btn {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 12px 20px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border: none;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.comment-submit-btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.submit-icon {
  font-size: 14px;
}

/* 空状态 */
.empty-state {
  text-align: center;
  padding: 60px 20px;
  color: #6c757d;
}

.empty-icon {
  font-size: 64px;
  margin-bottom: 16px;
  opacity: 0.6;
}

.empty-text {
  font-size: 18px;
  margin-bottom: 24px;
  font-weight: 500;
}

.empty-action-btn {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 25px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.empty-action-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
}

/* 响应式设计 */
@media (max-width: 768px) {
  .moment-container {
    flex-direction: column;
    margin: 10px;
    border-radius: 16px;
  }

  .category-menu {
    width: 100%;
    border-right: none;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    padding: 20px;
  }

  .category-list {
    display: flex;
    gap: 12px;
    overflow-x: auto;
  }

  .category-item {
    flex-shrink: 0;
    margin-bottom: 0;
  }

  .moment-list {
    padding: 20px;
  }

  .sidebar-buttons {
    left: 20px;
    bottom: 20px;
  }

  .sidebar-btn {
    width: 48px;
    height: 48px;
    font-size: 18px;
  }

  .moment-images {
    grid-template-columns: 1fr !important;
  }

  .comment-input-wrapper {
    flex-direction: column;
    align-items: stretch;
  }

  .comment-submit-btn {
    align-self: flex-end;
  }
}

@media (max-width: 480px) {
  .moment-page {
    padding: 10px 0;
  }

  .moment-card {
    padding: 16px;
    margin-bottom: 16px;
  }

  .moment-header {
    flex-wrap: wrap;
  }

  .moment-category {
    position: static;
    margin-top: 8px;
    width: 100%;
  }

  .moment-actions {
    flex-direction: column;
    gap: 8px;
  }

  .action-btn {
    justify-content: center;
  }
}
</style>
