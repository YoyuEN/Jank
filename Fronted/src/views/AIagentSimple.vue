<template>
  <div class="app-layout">
    <div class="main-content">
      <div class="chat-container">
        <div class="message-list" ref="messaggListRef">
          <div
            v-for="(message, index) in messages"
            :key="index"
            :class="message.isUser ? 'message user-message' : 'message bot-message'"
          >
            <!-- 会话内容 -->
            <span>
              <span v-html="message.content"></span>
              <!-- loading -->
              <span class="loading-dots" v-if="message.isThinking || message.isTyping">
                <span class="dot"></span>
                <span class="dot"></span>
              </span>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch, defineProps } from 'vue'
import axios from 'axios'
import { v4 as uuidv4 } from 'uuid'

// 定义接收的props
const props = defineProps({
  postTitle: {
    type: String,
    default: ''
  },
  postContent: {
    type: String,
    default: ''
  },
  postId: {
    type: [String, Number],
    default: ''
  }
})

const messaggListRef = ref()
const isSending = ref(false)
const uuid = ref()
const inputMessage = ref('')
const messages = ref([])

onMounted(() => {
  initUUID()
  watch(messages, () => scrollToBottom(), { deep: true })
  hello()
})

const scrollToBottom = () => {
  if (messaggListRef.value) {
    messaggListRef.value.scrollTop = messaggListRef.value.scrollHeight
  }
}
// 修改打招呼语，将前页面传过来的数据替换默认的打招呼语。
const hello = () => {
  // 使用文章标题和内容生成初始消息
  if (props.postTitle && props.postContent) {
    // 从HTML内容中提取纯文本
    const tempDiv = document.createElement('div')
    tempDiv.innerHTML = props.postContent
    const textContent = tempDiv.textContent || tempDiv.innerText || ''

    // 限制内容长度，避免请求过大
    const maxLength = 1000
    const truncatedContent = textContent.length > maxLength
      ? textContent.substring(0, maxLength) + '...'
      : textContent

    // 构建请求消息
    const message = `请根据以下文章内容生成一个简短的摘要：\n标题：${props.postTitle}\n内容：${truncatedContent}`
    sendRequest(message)
  } else {
    // 如果没有文章内容，则发送默认消息
    sendRequest('你好，请问有什么可以帮助你的？')
  }
}

const sendMessage = () => {
  if (inputMessage.value.trim()) {
    sendRequest(inputMessage.value.trim())
    inputMessage.value = ''
  }
}

const sendRequest = (message) => {
  isSending.value = true
  const userMsg = {
    isUser: true,
    content: message,
    isTyping: false,
    isThinking: false,
  }
  if (messages.value.length > 0) {
    messages.value.push(userMsg)
  }

  const botMsg = {
    isUser: false,
    content: '',
    isTyping: true,
    isThinking: false,
  }
  messages.value.push(botMsg)
  const lastMsg = messages.value[messages.value.length - 1]
  scrollToBottom()

  axios
    .post(
      '/api/agent/chat',
      { memoryId: uuid.value, message },
      {
        responseType: 'stream',
        onDownloadProgress: (e) => {
          const fullText = e.event.target.responseText
          let newText = fullText.substring(lastMsg.content.length)
          lastMsg.content += newText
          console.log(lastMsg)
          scrollToBottom()
        },
      },
    )
    .then(() => {
      messages.value.at(-1).isTyping = false
      isSending.value = false
    })
    .catch((error) => {
      console.error('流式错误:', error)
      messages.value.at(-1).content = '请求失败，请重试'
      messages.value.at(-1).isTyping = false
      isSending.value = false
    })
}

const initUUID = () => {
  let storedUUID = localStorage.getItem('user_uuid')
  if (!storedUUID) {
    storedUUID = uuidToNumber(uuidv4())
    localStorage.setItem('user_uuid', storedUUID)
  }
  uuid.value = storedUUID
}

const uuidToNumber = (uuid) => {
  let number = 0
  for (let i = 0; i < uuid.length && i < 6; i++) {
    const hexValue = uuid[i]
    number = number * 16 + (parseInt(hexValue, 16) || 0)
  }
  return number % 1000000
}

const convertMarkdownToHtml = (text) => {
  if (!text) return ''

  return text
    // 处理标题 (# Header)
    .replace(/^# (.*$)/gm, '<h1>$1</h1>')
    .replace(/^## (.*$)/gm, '<h2>$1</h2>')
    .replace(/^### (.*$)/gm, '<h3>$1</h3>')
    // 处理加粗 (**text**)
    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
    // 处理斜体 (*text*)
    .replace(/\*(.*?)\*/g, '<em>$1</em>')
    // 处理代码块 (```code```)
    .replace(/```([\s\S]*?)```/g, '<pre><code>$1</code></pre>')
    // 处理行内代码 (`code`)
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    // 处理无序列表 (- item)
    .replace(/^- (.*$)/gm, '<li>$1</li>')
    // 处理有序列表 (1. item)
    .replace(/^\d+\. (.*$)/gm, '<li>$1</li>')
    // 处理换行
    .replace(/\n/g, '<br>')
    // 处理制表符
    .replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;')
}

const newChat = () => {
  console.log('开始新会话')
  localStorage.removeItem('user_uuid')
  window.location.reload()
}
</script>

<style scoped>
.app-layout {
  display: flex;
  height: 100vh; /* 缩小为原来的四分之一 */
  max-height: 500px; /* 缩小为原来的四分之一 */
  margin: 10px auto;
  width: 90%; /* 增加宽度为原来的四倍 */
  max-width: 300px; /* 增加最大宽度为原来的四倍 */
}

.main-content {
  flex: 1;
  padding: 8px;
  overflow-y: auto;
}

.chat-container {
  display: flex;
  flex-direction: column;
  height: 100%;
  background: linear-gradient(to right, #e6f7ff, #f9f0ff);
  border-radius: 6px;
  box-shadow: 0 1px 6px 0 rgba(0, 0, 0, 0.1);
}

.message-list {
  flex: 1;
  overflow-y: auto;
  padding: 4px;
  border: 1px solid #e0e0e0;
  border-radius: 3px;
  background-color: #fff;
  margin-bottom: 4px;
  display: flex;
  flex-direction: column;
}

.message {
  margin-bottom: 4px;
  padding: 4px;
  border-radius: 3px;
  display: flex;
  font-size: 14px;
}

.user-message {
  max-width: 70%;
  background: linear-gradient(to right, #d4edff, #e6f7ff);
  align-self: flex-end;
  flex-direction: row-reverse;
}

.bot-message {
  max-width: 100%;
  background: linear-gradient(to right, #e6f7ff, #f0e6ff);
  align-self: flex-start;
}

.message-icon {
  margin: 0 4px;
  font-size: 0.8em;
}

.loading-dots {
  padding-left: 2px;
}

.dot {
  display: inline-block;
  margin-left: 2px;
  width: 4px;
  height: 4px;
  background-color: #000000;
  border-radius: 50%;
  animation: pulse 1.2s infinite ease-in-out both;
}

.dot:nth-child(2) {
  animation-delay: -0.6s;
}

@keyframes pulse {
  0%,
  100% {
    transform: scale(0.6);
    opacity: 0.4;
  }
  50% {
    transform: scale(1);
    opacity: 1;
  }
}
:deep(.el-button--primary) {
  background: linear-gradient(to right, #a0cfff, #c9a8ff);
  border-color: #a0cfff;
}
.input-container {
  display: flex;
  padding: 4px;
}

.input-container .el-input {
  flex: 1;
  margin-right: 4px;
}

/* 响应式布局调整 */
@media (max-width: 768px) {
  .app-layout {
    width: 90%; /* 增加小屏幕宽度为原来的四倍左右 */
    height: 25vh; /* 保持高度不变 */
    margin: 5px auto;
  }

  .main-content {
    padding: 4px;
  }

  .message {
    font-size: 11px;
  }
}

@media (min-width: 769px) {
  .main-content {
    padding: 0 0 4px 4px;
  }
}
</style>
