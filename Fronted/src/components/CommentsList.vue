<template>
  <!-- 左侧浮动按钮 -->
  <div class="sidebar-buttons">
<!--    <button @click="showCommentPanel = true" title="发表评论" class="sidebar-btn">💬</button>-->
    <button @click="scrollToTop" title="回到顶部" class="sidebar-btn">⬆️</button>
  </div>
  <!-- 弹窗层 -->
<!--  <transition name="slide">-->
<!--    <div v-show="showCommentPanel" class="comment-panel">-->
<!--      <div>-->
<!--        <h3>发表评论</h3>-->
<!--        <textarea v-model="newComment" placeholder="写下你的评论..." rows="5"></textarea>-->
<!--      </div>-->
<!--      <div class="comment-actions">-->
<!--        <button @click="submitComment" class="submit-comment-btn">提交评论</button>-->
<!--        <button @click="showCommentPanel = false" class="close-btn">关闭</button>-->
<!--      </div>-->
<!--    </div>-->
<!--  </transition>-->
  <!-- 评论输入区域 - 移动到评论列表上方 -->
  <div class="comment-input-area">

        <div class="comment-header">
          <h3>发表评论</h3>
          <button @click="showCommentPanel = false" class="close-btn">×</button>
        </div>
        <textarea
          v-model="newComment"
          placeholder="写下你的评论..."
          rows="5"
          class="comment-textarea"
        ></textarea>
        <div class="comment-actions">
          <button @click="submitComment" class="submit-comment-btn">
            <span>提交评论</span>
          </button>
        </div>

  </div>
  <div class="comments-section">
    <h2>评论区</h2>

    <div v-if="loadingComments" class="loading-comments">加载评论中...</div>

    <div v-else-if="comments.length === 0" class="no-comments">
      暂无评论，快来发表第一条评论吧！
    </div>

    <div v-else class="comments-list">
      <!-- 评论列表 -->
      <div v-for="comment in comments" :key="comment.id" class="comment-item" :data-comment-id="comment.id">
        <div class="comment-content">
          <div class="comment-header">
            <img
              :src="comment.avatar || 'https://via.placeholder.com/40'"
              alt="头像"
              class="comment-avatar"
            />
            <div class="comment-info">
              <div class="comment-author">{{ comment.username || '匿名用户' }}</div>
              <div class="comment-time">{{ comment.createTime }}</div>
            </div>
          </div>
          <div class="comment-text">{{ comment.content }}</div>
<!--          <div class="comment-actions">-->
<!--            <button @click="toggleReplyInput(comment.id)" class="reply-btn">-->
<!--              {{ replyTo === comment.id ? '取消回复' : '回复' }}-->
<!--            </button>-->
<!--            <button-->
<!--              @click="toggleReplies(comment.id)"-->
<!--              class="show-replies-btn"-->
<!--              v-if="comment.replyCount > 0"-->
<!--            >-->
<!--              {{ comment.showReplies ? '收起回复' : `查看回复(${comment.replyCount})` }}-->
<!--            </button>-->
<!--          </div>-->

<!--          &lt;!&ndash; 回复输入框 &ndash;&gt;-->
<!--          <div v-if="replyTo === comment.id" class="reply-input-container">-->
<!--            <textarea-->
<!--              v-model="replyContent"-->
<!--              placeholder="写下你的回复..."-->
<!--              rows="3"-->
<!--              class="reply-textarea"-->
<!--            ></textarea>-->
<!--            <div class="reply-actions">-->
<!--              <button @click="submitReply(comment.id)" class="submit-reply-btn">提交回复</button>-->
<!--            </div>-->
<!--          </div>-->

          <!-- 回复列表 -->
<!--          <div v-if="comment.showReplies" class="replies-container">-->
<!--            <div v-if="comment.loadingReplies" class="loading-replies">加载回复中...</div>-->
<!--            <div v-else-if="comment.replies.length === 0" class="no-replies">暂无回复</div>-->
<!--            <div v-else class="replies-list">-->
<!--              <div v-for="reply in comment.replies" :key="reply.id" class="reply-item">-->
<!--                <div class="reply-header">-->
<!--                  <img-->
<!--                    :src="reply.avatar || 'https://via.placeholder.com/30'"-->
<!--                    alt="头像"-->
<!--                    class="reply-avatar"-->
<!--                  />-->
<!--                  <div class="reply-info">-->
<!--                    <div class="reply-author">{{ reply.username || '匿名用户' }}</div>-->
<!--                    <div class="reply-time">{{ reply.createTime }}</div>-->
<!--                  </div>-->
<!--                </div>-->
<!--                <div class="reply-text">{{ reply.content }}</div>-->
<!--              </div>-->
<!--            </div>-->
<!--          </div>-->
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  getNestedCommentList,
  submitComment as submitCommentApi
} from '@/api/comment/comment.js'
import { ref, onMounted} from 'vue'
import { useRoute } from 'vue-router'
// import { getPostDetail } from '@/api/posts/posts.js'
// import { marked } from 'marked'

const comments = ref([])
const loadingComments = ref(false)

// 用于跟踪当前正在回复的评论ID
const replyTo = ref(null)
const replyContent = ref('')
const route = useRoute()
const postId = route.params.postId
// const post = ref(null)
// const loading = ref(true)
const showCommentPanel = ref(false)
const newComment = ref('')

// const submitComment = () => {
//   if (newComment.value.trim()) {
//     alert('模拟提交评论: ' + newComment.value)
//     // TODO: 调用 API 提交评论
//     newComment.value = ''
//     showCommentPanel.value = false
//   }
// }
const submitComment = async () => {
  // 检查用户是否登录
  const token = localStorage.getItem('token')
  const userId = localStorage.getItem('userId')
  const username = localStorage.getItem('username')
  const avatar = localStorage.getItem('avatar')

  console.log('提交评论前检查 - Token:', token)
  console.log('提交评论前检查 - UserId:', userId)
  console.log('提交评论前检查 - Username:', username)
  console.log('提交评论前检查 - Avatar:', avatar)

  // 从userStore中获取用户信息
  const userStore = JSON.parse(localStorage.getItem('user') || '{}')
  console.log('提交评论前检查 - UserStore:', userStore)

  // 尝试从多个可能的来源获取userId
  const effectiveUserId = userId || userStore.userId || userStore.id || ''
  const effectiveUsername = username || userStore.username || userStore.name || '匿名用户'
  const effectiveAvatar = avatar || userStore.avatar || userStore.avatarUrl || 'https://via.placeholder.com/40'

  console.log('提交评论使用的有效用户ID:', effectiveUserId)
  console.log('提交评论使用的有效用户名:', effectiveUsername)

  // 检查评论内容是否为空
  if (!newComment.value.trim()) {
    alert('评论内容不能为空')
    return
  }

    const response = await submitCommentApi({
      postId: postId,
      content: newComment.value,
      userId: effectiveUserId, // 使用有效的用户ID
      username: effectiveUsername, // 添加用户名
      avatar: effectiveAvatar, // 添加头像
      createTime: new Date().toISOString() // 添加创建时间，虽然后端会覆盖，但为了前端显示可以先设置
    })

    if (response.code === 200) {
      // 提交成功后刷新评论列表
      await fetchComments()
      newComment.value = ''
      showCommentPanel.value = false
    } else {
      alert('评论提交失败: ' + response.message)
    }
}
const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}
// 获取评论列表
const fetchComments = async () => {
  loadingComments.value = true
  try {
    const response = await getNestedCommentList(postId)
    if (response.code === 200) {
      // 为每个评论添加UI状态属性
      const addUIProperties = (comment) => {
        comment.showReplies = false
        comment.replyCount = comment.replies?.length || 0

        // 设置默认头像
        if (!comment.avatar) {
          comment.avatar = 'https://via.placeholder.com/40'
        }

        // 设置默认用户名
        if (!comment.username) {
          comment.username = '匿名用户'
        }

        // 格式化时间
        if (comment.createTime) {
          const date = new Date(comment.createTime)
          comment.createTime = date.toLocaleString()
        }

        // 递归处理子评论
        if (comment.replies && comment.replies.length > 0) {
          comment.replies.forEach((reply) => {
            // 为回复也添加默认值
            if (!reply.avatar) {
              reply.avatar = 'https://via.placeholder.com/30'
            }
            if (!reply.username) {
              reply.username = '匿名用户'
            }
            if (reply.createTime) {
              const date = new Date(reply.createTime)
              reply.createTime = date.toLocaleString()
            }
            addUIProperties(reply)
          })
        }
        return comment
      }

      comments.value = response.data.map((comment) => addUIProperties(comment))
    }
  } catch (error) {
    console.error('获取评论列表失败:', error)
  } finally {
    loadingComments.value = false
  }
}

onMounted(fetchComments)

// // 切换回复输入框
// const toggleReplyInput = (commentId) => {
//   if (replyTo.value === commentId) {
//     replyTo.value = null
//   } else {
//     replyTo.value = commentId
//     replyContent.value = ''
//   }
// }


</script>
<style scoped>
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
  background-color: #007bff;
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
.comment-actions {
  display: flex;
  justify-content: space-between;
}

.sidebar-btn:hover {
  transform: scale(1.1);
}

.comment-panel {
  position: fixed;
  right: 0;
  top: 50px;
  height: auto;
  width: 20%;
  background: white;
  padding: 24px;
  box-shadow: -4px 0 12px rgba(0, 0, 0, 0.1);
  z-index: 999;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: transform 0.3s ease;
}
/* 评论区样式 */
.comments-section {
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid #e1e1e1;
}

.comments-title {
  font-size: 1.8em;
  margin-bottom: 20px;
  color: #333;
}

.loading-comments,
.no-comments {
  text-align: center;
  padding: 20px;
  color: #666;
  font-style: italic;
}

.comments-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.comment-item {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.comment-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 12px;
  object-fit: cover;
}

.comment-info {
  display: flex;
  flex-direction: column;
}

.comment-author {
  font-weight: bold;
  color: #333;
}

.comment-time {
  font-size: 0.8em;
  color: #888;
}

.comment-text {
  margin-bottom: 12px;
  line-height: 1.5;
}

.comment-actions {
  display: flex;
  gap: 12px;
}

.reply-btn,
.show-replies-btn {
  background: none;
  border: none;
  color: #007bff;
  cursor: pointer;
  font-size: 0.9em;
  padding: 0;
}

.reply-btn:hover,
.show-replies-btn:hover {
  text-decoration: underline;
}

.reply-input-container {
  margin-top: 12px;
  padding: 12px;
  background-color: #f0f0f0;
  border-radius: 6px;
}

.reply-textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  resize: none;
  margin-bottom: 8px;
}

.reply-actions {
  display: flex;
  justify-content: flex-end;
}

.submit-reply-btn {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 6px 12px;
  cursor: pointer;
}

.replies-container {
  margin-top: 16px;
  padding-left: 20px;
  border-left: 2px solid #e1e1e1;
}

.loading-replies,
.no-replies {
  padding: 10px;
  color: #888;
  font-style: italic;
  font-size: 0.9em;
}

.replies-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.reply-item {
  background-color: #f0f0f0;
  border-radius: 6px;
  padding: 12px;
}

.reply-header {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.reply-avatar {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  margin-right: 10px;
  object-fit: cover;
}

.reply-info {
  display: flex;
  flex-direction: column;
}

.reply-author {
  font-weight: bold;
  font-size: 0.9em;
  color: #333;
}

.reply-time {
  font-size: 0.8em;
  color: #888;
}

.reply-text {
  font-size: 0.95em;
  line-height: 1.4;
}

.comments-section {
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid #e1e1e1;
}

.loading-comments,
.no-comments {
  text-align: center;
  padding: 20px;
  color: #666;
  font-style: italic;
}

.comments-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.comment-item {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.comment-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 12px;
  object-fit: cover;
}

.comment-info {
  display: flex;
  flex-direction: column;
}

.comment-author {
  font-weight: bold;
  color: #333;
}

.comment-time {
  font-size: 0.8em;
  color: #888;
}

.comment-text {
  margin-bottom: 12px;
  line-height: 1.5;
}

.comment-actions {
  display: flex;
  gap: 12px;
}

.reply-btn,
.show-replies-btn {
  background: none;
  border: none;
  color: #007bff;
  cursor: pointer;
  font-size: 0.9em;
  padding: 0;
}

.reply-btn:hover,
.show-replies-btn:hover {
  text-decoration: underline;
}

.reply-input-container {
  margin-top: 12px;
  padding: 12px;
  background-color: #f0f0f0;
  border-radius: 6px;
}

.reply-textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  resize: none;
  margin-bottom: 8px;
}

.reply-actions {
  display: flex;
  justify-content: flex-end;
}

.submit-reply-btn {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 6px 12px;
  cursor: pointer;
}

.replies-container {
  margin-top: 16px;
  padding-left: 20px;
  border-left: 2px solid #e1e1e1;
}

.loading-replies,
.no-replies {
  padding: 10px;
  color: #888;
  font-style: italic;
  font-size: 0.9em;
}

.replies-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.reply-item {
  background-color: #f0f0f0;
  border-radius: 6px;
  padding: 12px;
}

.reply-header {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.reply-avatar {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  margin-right: 10px;
  object-fit: cover;
}

.reply-info {
  display: flex;
  flex-direction: column;
}

.reply-author {
  font-weight: bold;
  font-size: 0.9em;
  color: #333;
}

.reply-time {
  font-size: 0.8em;
  color: #888;
}

.reply-text {
  font-size: 0.95em;
  line-height: 1.4;
}
.comment-input-area {
  margin-bottom: 30px;
}

.comment-panel {
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  padding: 20px;
  transition: all 0.3s ease;
}

.comment-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.comment-header h3 {
  margin: 0;
  font-size: 1.2rem;
  color: #333;
}

.close-btn {
  background: none;
  border: none;
  font-size: 1.5rem;
  color: #999;
  cursor: pointer;
  padding: 0;
  line-height: 1;
}

.close-btn:hover {
  color: #666;
}

.comment-textarea {
  width: 100%;
  padding: 15px;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  resize: none;
  font-size: 0.95rem;
  margin-bottom: 15px;
  transition: border-color 0.3s;
}

.comment-textarea:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.2);
}

.comment-actions {
  display: flex;
  justify-content: flex-end;
}

.submit-comment-btn {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 6px;
  padding: 10px 20px;
  font-size: 0.95rem;
  cursor: pointer;
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
}

.submit-comment-btn:hover {
  background-color: #0069d9;
  transform: translateY(-1px);
}

.submit-comment-btn:active {
  transform: translateY(0);
}

/* 动画效果 */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s, transform 0.3s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* 调整评论区上边距 */
.comments-section {
  margin-top: 20px;
}
</style>
