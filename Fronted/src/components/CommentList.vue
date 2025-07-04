<template>
  <!-- 左侧浮动按钮 -->
  <div class="sidebar-buttons">
    <button @click="scrollToTop" title="回到顶部" class="sidebar-btn">⬆️</button>
  </div>
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

    <el-row>
      <div class="block">
        <span class="demonstration">五星好评</span>
        <el-rate v-model="ratingValue" :colors="colors"> </el-rate>
      </div>
      <div class="comment-actions" style="margin-left: 600px">
        <button @click="submitComment" class="submit-comment-btn">
          <span>提交评论</span>
        </button>
      </div>
    </el-row>
  </div>
  <div class="comments-section">
    <h2>评论区</h2>

    <div v-if="loadingComments" class="loading-comments">加载评论中...</div>

    <div v-else-if="comments.length === 0" class="no-comments">
      暂无评论，快来发表第一条评论吧！
    </div>

    <div v-else class="comments-list">
      <!-- 评论列表 -->
      <div
        v-for="comment in displayedComments"
        :key="comment.id"
        class="comment-item"
        :data-comment-id="comment.id"
      >
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
          <div class="block">
            <el-rate v-model="comment.goodorbad" disabled text-color="#ff9900"> </el-rate>
          </div>
        </div>
      </div>

      <!-- 加载更多按钮 -->
      <div v-if="displayCount < comments.length" class="load-more-container">
        <button @click="loadMore" class="load-more-btn">加载更多评论</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['comments'],
  data() {
    return {
      ratingValue: null,
      colors: ['#99A9BF', '#F7BA2A', '#FF9900'],
    }
  },
}
</script>
<script setup>
import { getNestedCommentList, submitComment as submitCommentApi } from '@/api/comment/comment.js'
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { ElRate } from 'element-plus'

// 确保初始显示数量是非负的
const comments = ref([])
const loadingComments = ref(false)
const displayCount = ref(Math.max(3, 0)) // 初始显示3条评论

// 计算要显示的评论 - 增加安全检查
const displayedComments = computed(() => {
  // 确保 comments.value 是一个数组
  if (!Array.isArray(comments.value)) {
    return []
  }

  const safeDisplayCount = Math.max(displayCount.value, 0)
  return comments.value.slice(0, safeDisplayCount)
})

// 加载更多评论 - 增加安全检查
const loadMore = () => {
  const newDisplayCount = displayCount.value + 5 // 每次增加5条评论
  displayCount.value = Math.max(newDisplayCount, 0)
}

// 用于跟踪当前正在回复的评论ID
const route = useRoute()
const postId = route.params.postId
// const post = ref(null)
// const loading = ref(true)
const showCommentPanel = ref(false)
const newComment = ref('')
const ratingValue = ref(null) // 新增：评分值
const colors = ['#99A9BF', '#F7BA2A', '#FF9900']

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
  const effectiveAvatar =
    avatar || userStore.avatar || userStore.avatarUrl || 'https://via.placeholder.com/40'

  console.log('提交评论使用的有效用户ID:', effectiveUserId)
  console.log('提交评论使用的有效用户名:', effectiveUsername)

  // 检查评论内容是否为空
  if (!newComment.value.trim()) {
    alert('评论内容不能为空')
    return
  }
  // 检查评分是否已选择
  if (ratingValue.value === null) {
    alert('请选择评分')
    return
  }

  const response = await submitCommentApi({
    postId: postId,
    content: newComment.value,
    userId: effectiveUserId, // 使用有效的用户ID
    username: effectiveUsername, // 添加用户名
    avatar: effectiveAvatar, // 添加头像
    // createTime: new Date().toISOString(),// 添加创建时间，虽然后端会覆盖，但为了前端显示可以先设置
    goodorbad: ratingValue.value, // 新增：提交评分信息
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

        // 保存原始时间用于排序
        if (comment.createTime) {
          comment.originalTime = new Date(comment.createTime).getTime()
          // 格式化时间用于显示
          comment.createTime = new Date(comment.createTime).toLocaleString()
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

      comments.value = response.data
        .map((comment) => addUIProperties(comment))
        .sort((a, b) => b.originalTime - a.originalTime)
    }
  } catch (error) {
    console.error('获取评论列表失败:', error)
  } finally {
    loadingComments.value = false
  }
}

onMounted(fetchComments)
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
  background: #3477fa;
  color: #fff;
  border: none;
  width: 44px;
  height: 44px;
  font-size: 22px;
  border-radius: 50%;
  cursor: pointer;
  box-shadow: 0 2px 8px rgba(52, 119, 250, 0.08);
  transition:
    background 0.2s,
    transform 0.2s;
}
.sidebar-btn:hover {
  background: #1558d6;
  transform: scale(1.08);
}

.comment-input-area {
  margin-top: 20px;
  margin-bottom: 30px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(52, 119, 250, 0.06);
  padding: 24px 20px 18px 20px;
  border: 1.5px solid #f0f0f0;
  background: #fff;
}
.comment-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}
.comment-header h3 {
  margin: 0;
  font-size: 1.1rem;
  color: #222;
  font-weight: 600;
}
.close-btn {
  background: none;
  border: none;
  font-size: 1.5rem;
  color: #bbb;
  cursor: pointer;
  padding: 0 4px;
  border-radius: 50%;
  transition:
    background 0.2s,
    color 0.2s;
}
.close-btn:hover {
  color: #fff;
  background: #e74c3c;
}

.comment-textarea {
  width: 95%;
  padding: 14px 16px;
  border: 1.5px solid #e0e0e0;
  border-radius: 12px;
  resize: none;
  font-size: 15px;
  margin-bottom: 15px;
  transition:
    border-color 0.2s,
    box-shadow 0.2s;
  background: none;
  box-shadow: none;
}
.comment-textarea:focus {
  outline: none;
  border-color: #3477fa;
  box-shadow: 0 0 0 2px rgba(52, 119, 250, 0.08);
}

.block {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 14px;
  color: #888;
  margin-top: 6px;
}
.el-rate {
  --el-rate-icon-size: 22px;
  --el-rate-icon-color: #ff9900;
}

.comment-actions {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  gap: 10px;
  margin-left: 0 !important;
}
.submit-comment-btn {
  background: #3477fa;
  color: #fff;
  border: none;
  border-radius: 22px;
  padding: 10px 28px;
  font-size: 15px;
  font-weight: 500;
  box-shadow: 0 2px 8px rgba(52, 119, 250, 0.08);
  cursor: pointer;
  transition:
    background 0.2s,
    transform 0.2s;
  display: flex;
  align-items: center;
}
.submit-comment-btn:hover {
  background: #1558d6;
  transform: translateY(-2px) scale(1.03);
}
.submit-comment-btn:active {
  background: #1558d6;
  transform: scale(0.98);
}

.comments-section h2 {
  font-size: 1.3em;
  color: #222;
  font-weight: 600;
  margin-bottom: 18px;
}

.comment-item {
  background: #fff;
  border-radius: 16px;
  padding: 20px 20px 14px 20px;
  box-shadow: 0 2px 12px rgba(52, 119, 250, 0.06);
  border: 1.5px solid #f0f0f0;
  margin-bottom: 14px;
  transition:
    box-shadow 0.2s,
    border-color 0.2s;
}
.comment-item:hover {
  box-shadow: 0 6px 24px rgba(52, 119, 250, 0.13);
  border-color: #b3cfff;
}
.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}
.comment-avatar {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  margin-right: 12px;
  object-fit: cover;
  border: 1.5px solid #e0e0e0;
}
.comment-info {
  display: flex;
  flex-direction: column;
}
.comment-author {
  font-weight: 600;
  color: #3477fa;
  font-size: 15px;
}
.comment-time {
  font-size: 12px;
  color: #aaa;
}
.comment-text {
  margin-bottom: 8px;
  line-height: 1.6;
  font-size: 15px;
  color: #222;
}

.load-more-btn {
  background: #f5f6fa;
  color: #3477fa;
  border: 1.5px solid #e0e0e0;
  border-radius: 22px;
  padding: 8px 28px;
  font-size: 15px;
  font-weight: 500;
  cursor: pointer;
  margin: 18px auto 0 auto;
  display: block;
  transition:
    background 0.2s,
    color 0.2s,
    border-color 0.2s;
}
.load-more-btn:hover {
  background: #eaf1ff;
  color: #1558d6;
  border-color: #3477fa;
}

@media (max-width: 768px) {
  .comment-input-area {
    padding: 14px 6px 10px 6px;
  }
  .comment-item {
    padding: 12px 8px 8px 8px;
  }
}
@media (max-width: 480px) {
  .comment-input-area {
    padding: 8px 2px 6px 2px;
  }
  .comment-item {
    padding: 8px 2px 6px 2px;
  }
}
</style>
