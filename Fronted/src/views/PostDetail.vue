<template>
  <div class="post-detail-container">
    <!-- 左侧浮动按钮 -->
    <div class="sidebar-buttons">
      <button @click="showCommentPanel = true" title="发表评论" class="sidebar-btn">💬</button>
      <button @click="scrollToTop" title="回到顶部" class="sidebar-btn">⬆️</button>
    </div>
    <!-- 弹窗层 -->
    <transition name="slide">
      <div v-show="showCommentPanel" class="comment-panel">
        <div>
          <h3>发表评论</h3>
          <textarea v-model="newComment" placeholder="写下你的评论..." rows="5"></textarea>
        </div>
        <div class="comment-actions">
          <button @click="submitComment" class="submit-comment-btn">提交评论</button>
          <button @click="showCommentPanel = false" class="close-btn">关闭</button>
        </div>
      </div>
    </transition>

    <div v-if="loading" class="loading">加载中...</div>
    <div v-else-if="post" class="post-content">
      <!-- 图片与标题组合 -->
      <div class="post-header">
        <img v-if="post.image" :src="post.image" alt="封面" class="post-image" />
        <div class="title-overlay">
          <h1 class="post-title">{{ post.title }}</h1>
          <div class="post-meta">
            <span>发布时间：{{ post.createTime }}</span>
            <span v-for="id in post.categoryIds" :key="id" class="category-tag">#{{ id }}</span>
          </div>
        </div>
      </div>

      <div class="post-body-wrapper">
        <div class="post-body card" v-html="post.contentHtml"></div>
        <div class="right-panel">
          <!-- AI 摘要卡片 -->
          <div class="ai-summary card">
            <div>
              <h2 class="summary-title">AI 摘要</h2>
<!--              将页面数据传到ai摘要中 -->
              <AIagentSimple
                :postTitle="post.title"
                :postContent="post.contentHtml"
                :postId="postId"
              />
            </div>
            <div class="toc-card card" v-if="tocItems.length > 0">
              <h3 class="toc-title">目录</h3>
              <ul class="toc-list">
                <li v-for="item in tocItems" :key="item.id" :class="`toc-level-${item.level}`">
                  <a :href="`#${item.id}`" @click.prevent="scrollToHeading(item)">
                    {{ item.text }}
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- 评论区域 -->
      <div class="comments-section">
        <h2 class="comments-title">评论区</h2>

        <div v-if="loadingComments" class="loading-comments">
          加载评论中...
        </div>

        <div v-else-if="comments.length === 0" class="no-comments">
          暂无评论，快来发表第一条评论吧！
        </div>

        <div v-else class="comments-list">
          <!-- 评论列表 -->
          <div v-for="comment in comments" :key="comment.id" class="comment-item">
            <div class="comment-content">
              <div class="comment-header">
                <img :src="comment.avatar || 'https://via.placeholder.com/40'" alt="头像" class="comment-avatar">
                <div class="comment-info">
                  <div class="comment-author">{{ comment.username || '匿名用户' }}</div>
                  <div class="comment-time">{{ comment.createTime }}</div>
                </div>
              </div>
              <div class="comment-text">{{ comment.content }}</div>
              <div class="comment-actions">
                <button @click="toggleReplyInput(comment.id)" class="reply-btn">
                  {{ replyTo === comment.id ? '取消回复' : '回复' }}
                </button>
                <button @click="toggleReplies(comment.id)" class="show-replies-btn" v-if="comment.replyCount > 0">
                  {{ comment.showReplies ? '收起回复' : `查看回复(${comment.replyCount})` }}
                </button>
              </div>

              <!-- 回复输入框 -->
              <div v-if="replyTo === comment.id" class="reply-input-container">
                <textarea v-model="replyContent" placeholder="写下你的回复..." rows="3" class="reply-textarea"></textarea>
                <div class="reply-actions">
                  <button @click="submitReply(comment.id)" class="submit-reply-btn">提交回复</button>
                </div>
              </div>

              <!-- 回复列表 -->
              <div v-if="comment.showReplies" class="replies-container">
                <div v-if="comment.loadingReplies" class="loading-replies">
                  加载回复中...
                </div>
                <div v-else-if="comment.replies.length === 0" class="no-replies">
                  暂无回复
                </div>
                <div v-else class="replies-list">
                  <div v-for="reply in comment.replies" :key="reply.id" class="reply-item">
                    <div class="reply-header">
                      <img :src="reply.avatar || 'https://via.placeholder.com/30'" alt="头像" class="reply-avatar">
                      <div class="reply-info">
                        <div class="reply-author">{{ reply.username || '匿名用户' }}</div>
                        <div class="reply-time">{{ reply.createTime }}</div>
                      </div>
                    </div>
                    <div class="reply-text">{{ reply.content }}</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <CommentList/>
    </div>
    <div v-else class="no-data">未找到该岗位信息</div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { getPostDetail } from '@/api/posts/posts.js'
import { getNestedCommentList, submitComment as submitCommentApi } from '@/api/comment/comment.js'
// getCommentList
import { marked } from 'marked'
import CommentList from '@/components/CommentList.vue'
import AIagentSimple from '@/views/AIagentSimple.vue'

const route = useRoute()
const postId = route.params.postId
const tocItems = ref([])
const post = ref(null)
const loading = ref(true)
const comments = ref([])
const loadingComments = ref(false)

const activeTocItem = ref(null)
const showCommentPanel = ref(false)
const newComment = ref('')
const replyTo = ref(null) // 当前回复的评论ID
const replyContent = ref('') // 回复内容

// 检查用户是否登录
const checkLogin = () => {
  const userId = localStorage.getItem('userId')
  if (!userId) {
    alert('请先登录后再评论')
    return false
  }
  return true
}

// 提交评论
const submitComment = async () => {
  if (!checkLogin()) return

  if (newComment.value.trim()) {
    try {
      const commentData = {
        postId: postId,
        content: newComment.value,
        userId: localStorage.getItem('userId'),
        username: localStorage.getItem('username'),
        avatar: localStorage.getItem('avatar')
      }

      // 如果是回复其他评论，添加父评论ID
      if (replyTo.value) {
        commentData.parentId = replyTo.value
      }

      const response = await submitCommentApi(commentData)

      if (response.code === 200) {
        // 提交成功后刷新评论列表
        fetchComments()
        newComment.value = ''
        showCommentPanel.value = false
        replyTo.value = null
      } else {
        alert('评论提交失败: ' + response.message)
      }
    } catch (error) {
      console.error('提交评论出错:', error)
      alert('评论提交失败，请稍后再试')
    }
  }
}

// 提交回复
const submitReply = async (commentId) => {
  if (!checkLogin()) return

  if (replyContent.value.trim()) {
    try {
      const response = await submitCommentApi({
        postId: postId,
        content: replyContent.value,
        parentId: commentId,
        userId: localStorage.getItem('userId'),
        username: localStorage.getItem('username'),
        avatar: localStorage.getItem('avatar')
      })

      if (response.code === 200) {
        // 提交成功后刷新评论列表
        fetchComments()
        replyContent.value = ''
        replyTo.value = null
      } else {
        alert('回复提交失败: ' + response.message)
      }
    } catch (error) {
      console.error('提交回复出错:', error)
      alert('回复提交失败，请稍后再试')
    }
  }
}

// 获取评论列表
const fetchComments = async () => {
  loadingComments.value = true
  try {
    // 使用嵌套结构的评论列表API
    const response = await getNestedCommentList(postId)
    if (response.code === 200) {
      // 为每个评论添加UI状态属性
      const addUIProperties = (comment) => {
        comment.showReplies = false
        comment.replyCount = comment.replies?.length || 0

        // 递归处理子评论
        if (comment.replies && comment.replies.length > 0) {
          comment.replies.forEach(reply => addUIProperties(reply))
        }
        return comment
      }

      // 处理所有评论
      comments.value = response.data.map(comment => addUIProperties(comment))
    }
  } catch (error) {
    console.error('获取评论列表失败:', error)
  } finally {
    loadingComments.value = false
  }
}

// 切换回复输入框
const toggleReplyInput = (commentId) => {
  if (replyTo.value === commentId) {
    replyTo.value = null
  } else {
    replyTo.value = commentId
    replyContent.value = ''
  }
}

// 切换显示回复列表
const toggleReplies = (commentId) => {
  const comment = comments.value.find(c => c.id === commentId)
  if (!comment) return

  comment.showReplies = !comment.showReplies
}

const generateTOC = (htmlContent) => {
  const parser = new DOMParser()
  const doc = parser.parseFromString(htmlContent, 'text/html')
  const headings = Array.from(doc.querySelectorAll('h1, h2, h3, h4'))

  const toc = headings.map((heading, index) => {
    // 生成唯一 id，如果没有则添加
    const id = heading.id || `toc-${index}`
    heading.id = id // 修改原始 DOM
    return {
      id,
      text: heading.textContent.trim(),
      level: parseInt(heading.tagName[1], 10),
    }
  })

  // 替换 post.contentHtml 中的 heading（带上 id）
  post.value.contentHtml = doc.body.innerHTML

  return toc
}

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

// 使用 marked 将 Markdown 转换为 HTML
const renderMarkdown = (markdown) => {
  return marked.parse(markdown || '')
}

const scrollToHeading = (item) => {
  const targetElement = document.getElementById(item.id)
  if (targetElement) {
    window.scrollTo({
      top: targetElement.offsetTop - 80,
      behavior: 'smooth',
    })
  }
}

onMounted(async () => {
  try {
    const response = await getPostDetail(postId)
    if (response.code === 200) {
      post.value = response.data
      // 假设接口返回的是 Markdown 格式的 content 字段
      post.value.contentHtml = renderMarkdown(post.value.contentHtml)
      tocItems.value = generateTOC(post.value.contentHtml)
    }
  } catch (error) {
    console.error('获取岗位详情失败:', error)
  } finally {
    loading.value = false
  }

  // 加载评论列表
  fetchComments()
})
onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

const handleScroll = () => {
  const scrollPosition = window.scrollY + 100 // 加上 offset 值
  for (const item of tocItems.value) {
    const element = document.getElementById(item.id)
    if (element && element.offsetTop <= scrollPosition + 20) {
      activeTocItem.value = item.id
    }
  }
}
</script>

<style>
.sidebar-buttons {
  position: fixed;
  left: 20px;
  bottom: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  z-index: 999;
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

.comment-panel textarea {
  width: 100%;
  resize: none;
  margin-bottom: 16px;
}

.comment-actions {
  display: flex;
  justify-content: space-between;
}
.comment-panel h3 {
  margin-top: 0;
  font-size: 1.2em;
  color: #333;
}

.submit-comment-btn {
  margin-top: 10px;
  padding: 8px 16px;
  background-color: #007BFF;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.close-btn {
  margin-left: 10px;
  padding: 8px 12px;
  background-color: #ccc;
  color: #333;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* 动画过渡效果 */
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.3s ease;
}

.slide-enter-from,
.slide-leave-to {
  transform: translateX(100%);
}

.card {
  border: 1px solid #e1e1e1;
  border-radius: 8px;
  padding: 16px;
  transition: all 0.3s ease;
}

.card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
  border-color: #ccc;
}

.title-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0));
  color: white;
  border-radius: 0 0 8px 8px;
}

.post-detail-container {
  padding: 24px;
  margin: 40px auto 0;
}

.post-header {
  position: relative;
  width: 100%;
}

.post-image {
  width: 100%;
  max-height: 400px;
  object-fit: cover;
  border-radius: 8px;
  display: block;
  margin-bottom: 20px;
}

.post-title {
  font-size: 2em;
  margin-bottom: 16px;
}

.post-meta {
  font-size: 0.9em;
  color: #666;
  margin-bottom: 16px;
}

.category-tag {
  margin-left: 6px;
  color: #007acc;
}

.loading,
.no-data {
  text-align: center;
  padding: 40px;
  font-size: 1.2em;
}

.post-body-wrapper {
  display: flex;
  gap: 5%;
  margin-top: 32px;
}
.post-body {
  width: 70%;
}
.author-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 12px;
}

.author-name {
  font-weight: bold;
  margin-top: 8px;
}

.ai-summary {
  padding: 20px;
  width: 20%;
  background-color: #f9f9f9;
  border-left: 4px solid #007bff; /* 高亮边框 */
  flex: none; /* 不要占满剩余高度 */
  position: sticky; /* 固定定位 */
  top: 60px; /* 距离顶部位置 */
  align-self: flex-start; /* 避免 stretch 拉伸 */
}

.summary-title {
  font-size: 1.5em;
  color: #007BFF;
  margin-bottom: 12px;
}

.summary-content p {
  font-size: 1em;
  color: #555;
  line-height: 1.6;
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

.loading-comments, .no-comments {
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

.reply-btn, .show-replies-btn {
  background: none;
  border: none;
  color: #007BFF;
  cursor: pointer;
  font-size: 0.9em;
  padding: 0;
}

.reply-btn:hover, .show-replies-btn:hover {
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
  background-color: #007BFF;
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

.loading-replies, .no-replies {
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

</style>
