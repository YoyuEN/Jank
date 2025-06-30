<template>
  <div class="comment-box">
    <textarea v-model="newComment" placeholder="写下你的评论..." rows="5"></textarea>
    <button @click="submitComment" class="submit-comment-btn">提交评论</button>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { submitCommentApi } from '@/api/comment/comment.js'
import { useRoute } from 'vue-router'

const route = useRoute()
const postId = route.params.postId

const newComment = ref('')
const replyTo = ref(null) // 回复的目标评论 ID

const checkLogin = () => {
  const token = localStorage.getItem('token')
  const userId = localStorage.getItem('userId')

  console.log('CommentBox - 检查登录状态 - Token:', token)
  console.log('CommentBox - 检查登录状态 - UserId:', userId)

  // 从userStore中获取用户信息
  const userStore = JSON.parse(localStorage.getItem('user') || '{}')
  console.log('CommentBox - 检查登录状态 - UserStore:', userStore)

  // 尝试从多个可能的来源获取userId
  const effectiveUserId = userId || userStore.userId || userStore.id || ''

  console.log('CommentBox - 有效用户ID:', effectiveUserId)

  if (!token || !effectiveUserId) {
    alert('请先登录后再评论')
    return false
  }
  return true
}

const submitComment = async () => {
  if (!checkLogin()) return

  if (newComment.value.trim()) {
    try {
      // 从userStore中获取用户信息
      const userStore = JSON.parse(localStorage.getItem('user') || '{}')

      // 尝试从多个可能的来源获取用户信息
      const effectiveUserId = localStorage.getItem('userId') || userStore.userId || userStore.id || ''
      const effectiveUsername = localStorage.getItem('username') || userStore.username || userStore.name || '匿名用户'
      const effectiveAvatar = localStorage.getItem('avatar') || userStore.avatar || userStore.avatarUrl || 'https://via.placeholder.com/40'

      console.log('CommentBox - 提交评论使用的有效用户ID:', effectiveUserId)
      console.log('CommentBox - 提交评论使用的有效用户名:', effectiveUsername)

      const commentData = {
        postId: postId,
        content: newComment.value,
        userId: effectiveUserId,
        username: effectiveUsername,
        avatar: effectiveAvatar,
      }

      if (replyTo.value) {
        commentData.replyToCommentId = replyTo.value
      }

      const response = await submitCommentApi(commentData)
      if (response.code === 200) {
        newComment.value = ''
        replyTo.value = null
        // 可选：触发刷新评论列表
        emit('comment-submitted')
      } else {
        alert('评论提交失败: ' + response.message)
      }
    } catch (error) {
      console.error('提交评论出错:', error)
      alert('评论提交失败，请稍后再试')
    }
  }
}
</script>

<style scoped>
.comment-box textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  resize: none;
  margin-bottom: 8px;
}

.submit-comment-btn {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 6px 12px;
  cursor: pointer;
}
</style>
