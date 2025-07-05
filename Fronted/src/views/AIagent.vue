<template>
  <div class="aiagent-bg">
    <div class="chat-container">
      <div class="message-list" ref="messageListRef">
        <div
          v-for="(message, index) in messages"
          :key="index"
          :class="message.isUser ? 'message user-message' : 'message bot-message'"
        >
          <div class="bubble-wrap">
            <i
              :class="
                message.isUser
                  ? 'fa-solid fa-user message-icon user-icon'
                  : 'fa-solid fa-robot message-icon bot-icon'
              "
            ></i>
            <span class="bubble" :class="message.isUser ? 'bubble-user' : 'bubble-bot'">
              <span v-html="message.content"></span>
              <span class="loading-dots" v-if="message.isThinking || message.isTyping">
                <span class="dot"></span>
                <span class="dot"></span>
              </span>
            </span>
          </div>
        </div>
      </div>
      <div class="input-container">
        <el-button class="new-chat-button" @click="newChat" type="primary">
          <i class="fa-solid fa-plus"></i>
          &nbsp;新会话
        </el-button>
        <el-input
          v-model="inputMessage"
          placeholder="请输入您的问题"
          @keyup.enter="sendMessage"
          class="ai-input"
        ></el-input>
        <el-button @click="sendMessage" :disabled="isSending" type="primary" class="send-btn"
        >发送</el-button
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue'
import axios from 'axios'
import { v4 as uuidv4 } from 'uuid'

const messageListRef = ref()
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
  if (messageListRef.value) {
    messageListRef.value.scrollTop = messageListRef.value.scrollHeight
  }
}

const hello = () => {
  sendRequest('你好')
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

const newChat = () => {
  console.log('开始新会话')
  localStorage.removeItem('user_uuid')
  window.location.reload()
}
</script>

<style scoped>
.aiagent-bg {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 90px;
  width: 100%;
}

.chat-container {
  width: 90%;
  height: 500px;
  margin: 20px auto;
  display: flex;
  flex-direction: column;
  border-radius: 24px;
  background: rgba(255, 255, 255, 0.7);
  box-shadow:
    0 8px 32px rgba(102, 126, 234, 0.1),
    0 1.5px 6px rgba(102, 126, 234, 0.08);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border: 1.5px solid rgba(102, 126, 234, 0.1);
  padding: 32px 18px 18px 18px;
}

.message-list {
  flex: 1;
  overflow-y: auto;
  padding: 18px 8px 8px 8px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  scrollbar-width: thin;
  scrollbar-color: #c7d2fe #f1f5f9;
}
.message-list::-webkit-scrollbar {
  width: 6px;
}
.message-list::-webkit-scrollbar-thumb {
  background: #c7d2fe;
  border-radius: 6px;
}

.bubble-wrap {
  display: flex;
  align-items: flex-end;
  gap: 8px;
}

.message {
  display: flex;
  align-items: flex-end;
  font-size: 15px;
}
.user-message {
  justify-content: flex-end;
}
.bot-message {
  justify-content: flex-start;
}

.message-icon {
  font-size: 1.3em;
  opacity: 0.85;
  margin-bottom: 2px;
}
.user-icon {
  color: #667eea;
}
.bot-icon {
  color: #059669;
}

.bubble {
  max-width: 340px;
  padding: 12px 18px;
  border-radius: 18px;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.06);
  word-break: break-word;
  font-size: 15px;
  line-height: 1.7;
  position: relative;
  min-height: 28px;
  display: inline-block;
}
.bubble-user {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: #fff;
  border-bottom-right-radius: 6px;
}
.bubble-bot {
  background: linear-gradient(135deg, #e0f2fe 0%, #f0fdf4 100%);
  color: #334155;
  border-bottom-left-radius: 6px;
}

.loading-dots {
  padding-left: 2px;
}
.dot {
  display: inline-block;
  margin-left: 2px;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background: #64748b;
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

.input-container {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 8px 0 8px;
  background: rgba(255, 255, 255, 0.7);
  border-radius: 0 0 18px 18px;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.04);
  margin-top: 8px;
}

.ai-input {
  flex: 1;
  border-radius: 12px;
  background: rgba(236, 239, 255, 0.5);
  border: 1.5px solid #c7d2fe;
  font-size: 15px;
  padding: 8px 12px;
}

.send-btn {
  background: linear-gradient(135deg, #667eea 0%, #059669 100%);
  border-radius: 12px;
  font-weight: 600;
  border: none;
  color: #fff;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.08);
  transition: all 0.2s;
}
.send-btn:active {
  background: linear-gradient(135deg, #667eea 0%, #059669 80%);
}

.new-chat-button {
  background: linear-gradient(135deg, #fbbf24 0%, #f472b6 100%);
  border-radius: 12px;
  font-weight: 600;
  border: none;
  color: #fff;
  margin-right: 6px;
  box-shadow: 0 2px 8px rgba(251, 191, 36, 0.08);
  transition: all 0.2s;
}
.new-chat-button:active {
  background: linear-gradient(135deg, #fbbf24 0%, #f472b6 80%);
}

@media (max-width: 768px) {
  .chat-container {
    max-width: 98vw;
    margin: 10px auto;
    border-radius: 12px;
    padding: 16px 4px 4px 4px;
    min-height: 350px;
  }
  .bubble {
    max-width: 90vw;
    font-size: 13px;
    padding: 8px 10px;
  }
  .input-container {
    padding: 8px 2px 0 2px;
    border-radius: 0 0 12px 12px;
  }
}
</style>
