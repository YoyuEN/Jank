<template>
  <div class="message-container">
    <!-- 弹幕区域 -->
    <div class="danmu-area" ref="danmuArea">
      <div
        v-for="message in displayMessages"
        :key="message.id"
        class="danmu-item"
        :style="{
          top: message.top + '%',
          animationDuration: message.duration + 's',
          animationDelay: message.delay + 's',
          color: message.color,
        }"
        @animationend="handleAnimationEnd(message, $event.target)"
      >
        {{ message.message }}
      </div>
    </div>

    <!-- 输入区域 -->
    <div class="input-area">
      <input
        v-model="newMessage"
        type="text"
        placeholder="请输入消息"
        @keyup.enter="sendMessage"
        :disabled="sending"
      />
      <button @click="sendMessage" :disabled="sending">
        {{ sending ? '发送中...' : '发送' }}
      </button>
    </div>

    <!-- 提示消息 -->
    <div class="message-tip" v-if="showTip" :class="{ show: showTip }">
      {{ tipMessage }}
    </div>
  </div>
</template>

<script>
import { getPerMessage, postPerMessage } from '@/api/permessage/permessage'
import { ref, watchEffect } from 'vue'
import { useUserStore } from '@/store/userStore.js'
// 用户基本信息
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(
  userStore.user || {
    avatar: '/img1.png',
    username: '游客',
    userId: '',
  },
)
// 监听 store 的变化（响应式更新头像）
watchEffect(() => {
  if (userStore.user) {
    user.value = userStore.user
  }
})
export default {
  name: 'MessageS',
  data() {
    return {
      messages: [],
      displayMessages: [],
      newMessage: '',
      nextId: 6,
      sending: false,
      showTip: false,
      tipMessage: '',
      colors: [
        '#FF5252',
        '#FF4081',
        '#E040FB',
        '#7C4DFF',
        '#536DFE',
        '#448AFF',
        '#40C4FF',
        '#18FFFF',
      ],
      cleanupInterval: null,
      animationEndTimeout: null,
      isLooping: false,
    }
  },
  created() {
    this.fetchMessages()
  },
  mounted() {
    this.initDanmu()
    this.cleanupInterval = setInterval(this.cleanupMessages, 5000)
    window.addEventListener('resize', this.handleResize)
  },
  beforeUnmount() {
    if (this.cleanupInterval) clearInterval(this.cleanupInterval)
    if (this.animationEndTimeout) clearTimeout(this.animationEndTimeout)
    window.removeEventListener('resize', this.handleResize)
  },
  methods: {
    async fetchMessages() {
      //从服务器获取消息
      try {
        const response = await getPerMessage()
        if (response && response.data) {
          // 假设后端返回的数据格式是 { id: number, content: string }[]
          this.messages = response.data
          this.nextId = Math.max(...this.messages.map((m) => m.id)) + 1
          this.processMessages()
        }
      } catch (error) {
        console.error('获取消息失败:', error)
        // 如果获取失败，使用默认消息
        this.processMessages()
      }
    },

    processMessages() {
      //处理消息数据，添加动画属性
      this.displayMessages = this.messages.map((msg) => ({
        ...msg,
        top: this.getRandomPosition(5, 80),
        duration: this.getRandomDuration(8, 15),
        delay: this.getRandomDelay(0, 2),
        color: this.getRandomColor(),
        isPlaying: true,
      }))
    },

    initDanmu() {
      //初始化弹幕
      // 初始化弹幕
    },

    async sendMessage() {
      //发送新消息
      if (!this.newMessage.trim() || this.sending) return

      this.sending = true

      try {
        // 准备发送到后端的数据
        const messageData = {
          userId: userStore.user.userId,
          message: this.newMessage,
        }

        // 调用API发送消息
        const response = await postPerMessage(messageData)

        if (response && response.data) {
          // 创建新消息对象
          const newMsg = {
            id: response.data.id || this.nextId++, // 优先使用后端返回的ID
            message: this.newMessage,
            top: this.getRandomPosition(5, 80),
            duration: this.getRandomDuration(8, 15),
            delay: 0,
            color: this.getRandomColor(),
            isPlaying: true,
          }

          // 更新消息列表
          this.messages.push({
            id: newMsg.id,
            message: newMsg.message,
          })

          // 更新显示的消息
          this.displayMessages.push(newMsg)

          // 清空输入框并显示成功提示
          this.newMessage = ''
          this.showTipMessage('发送成功！')
        } else {
          this.showTipMessage('发送失败，请重试！')
        }
      } catch (error) {
        console.error('发送消息失败:', error)
        this.showTipMessage('发送失败，请重试！')
      } finally {
        this.sending = false
      }
    },

    showTipMessage(message) {
      //显示提示信息
      this.tipMessage = message
      this.showTip = true
      setTimeout(() => {
        this.showTip = false
      }, 3000)
    },

    handleAnimationEnd(message) {
      //处理动画结束事件
      message.isPlaying = false

      if (this.animationEndTimeout) {
        clearTimeout(this.animationEndTimeout)
      }

      const allPlayed = this.displayMessages.every((msg) => !msg.isPlaying)
      if (allPlayed && !this.isLooping) {
        this.isLooping = true
        this.animationEndTimeout = setTimeout(() => {
          this.replayDanmaku()
        }, 1000)
      }
    },

    replayDanmaku() {
      //重新播放弹幕
      // 获取弹幕容器
      const container = this.$refs.danmuArea
      if (!container) return

      // 保存当前弹幕配置
      const currentMessages = [...this.displayMessages]

      // 清空容器
      this.displayMessages = []

      // 强制DOM更新
      this.$nextTick(() => {
        // 创建新的弹幕实例，保持原有的配置但重置状态
        this.displayMessages = currentMessages.map((msg) => ({
          ...msg,
          top: this.getRandomPosition(5, 80), // 重新随机位置增加趣味性
          isPlaying: true,
        }))

        this.isLooping = false
      })
    },

    cleanupMessages() {
      //清理消息
      // 不再需要定期清理，由animationEnd事件处理
    },

    handleResize() {
      //处理窗口大小变化
      // 响应式调整逻辑
    },

    getRandomPosition(min, max) {
      //生成随机位置
      return Math.floor(Math.random() * (max - min + 1)) + min
    },

    getRandomDuration(min, max) {
      //生成随机动画持续时间
      return Math.floor(Math.random() * (max - min + 1)) + min
    },

    getRandomDelay(min, max) {
      //生成随机动画延迟
      return Math.random() * (max - min) + min
    },

    getRandomColor() {
      //随机颜色
      return this.colors[Math.floor(Math.random() * this.colors.length)]
    },
  },
}
</script>

<style scoped>
/* 样式部分保持不变 */
.message-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  font-family: 'Helvetica Neue', Arial, sans-serif;
  background-color: #ffffff;
  position: relative;
  overflow: hidden;
}

.message-container::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: linear-gradient(to bottom, rgba(250, 250, 250, 0.8), rgba(250, 250, 250, 0));
  z-index: 1;
  pointer-events: none;
}

.danmu-area {
  flex: 1;
  position: relative;
  background-color: #ffffff;
  background-image:
    radial-gradient(circle at 25% 25%, rgba(240, 240, 240, 0.2) 1%, transparent 1%),
    radial-gradient(circle at 75% 75%, rgba(240, 240, 240, 0.2) 1%, transparent 1%);
  background-size: 60px 60px;
  overflow: hidden;
  border-bottom: 1px solid #f0f0f0;
  transition: background-color 0.5s ease;
}

.danmu-area::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 80px;
  background: linear-gradient(to top, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
  pointer-events: none;
  z-index: 2;
}

.danmu-item {
  position: absolute;
  left: -50%;
  padding: 8px 16px;
  border: none;
  border-radius: 20px;
  background-color: rgba(255, 255, 255, 0.92);
  box-shadow:
    0 2px 8px rgba(0, 0, 0, 0.04),
    0 0 2px rgba(0, 0, 0, 0.02);
  white-space: nowrap;
  font-size: 14px;
  color: #666;
  animation: moveRight linear forwards;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  backdrop-filter: blur(8px);
  letter-spacing: 0.2px;
  will-change: transform, opacity;
  transform-origin: center center;
}

.danmu-item:hover {
  transform: scale(1.03) translateY(-1px);
  z-index: 10;
  background-color: rgba(255, 255, 255, 0.98);
  box-shadow:
    0 6px 16px rgba(0, 0, 0, 0.06),
    0 2px 4px rgba(0, 0, 0, 0.03);
  color: #333;
  letter-spacing: 0.3px;
}

@keyframes moveRight {
  0% {
    left: -100%;
    opacity: 0;
    transform: translateY(5px);
  }
  3% {
    opacity: 0;
    transform: translateY(5px);
  }
  8% {
    opacity: 1;
    transform: translateY(0);
  }
  92% {
    opacity: 1;
    transform: translateY(0);
  }
  97% {
    opacity: 0;
    transform: translateY(-5px);
  }
  100% {
    left: 100%;
    opacity: 0;
    transform: translateY(-5px);
  }
}

.input-area {
  padding: 24px 28px;
  background-color: #ffffff;
  border-top: 1px solid #f0f0f0;
  display: flex;
  gap: 14px;
  box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.03);
  position: relative;
  z-index: 5;
}

.input-area::before {
  content: '';
  position: absolute;
  top: -1px;
  left: 15%;
  right: 15%;
  height: 1px;
  background: linear-gradient(to right, transparent, rgba(0, 0, 0, 0.03), transparent);
}

.input-area input {
  flex: 1;
  padding: 14px 22px;
  border: 1px solid #eeeeee;
  border-radius: 24px;
  font-size: 14px;
  color: #555;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  outline: none;
  background-color: #fafafa;
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.01);
}

.input-area input::placeholder {
  color: #aaa;
  font-weight: 300;
}

.input-area input:focus {
  border-color: #d0d0d0;
  background-color: #ffffff;
  box-shadow:
    0 0 0 3px rgba(200, 200, 200, 0.1),
    inset 0 1px 2px rgba(0, 0, 0, 0.01);
}

.input-area input:disabled {
  background-color: #f8f8f8;
  border-color: #eeeeee;
  cursor: not-allowed;
  color: #aaa;
}

.input-area button {
  padding: 14px 30px;
  background-color: #ffffff;
  color: #666;
  border: 1px solid #eeeeee;
  border-radius: 24px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
  position: relative;
  overflow: hidden;
}

.input-area button::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
  opacity: 0;
  transition: opacity 0.3s;
}

.input-area button:hover:not(:disabled) {
  background-color: #fafafa;
  border-color: #d8d8d8;
  color: #444;
  transform: translateY(-1px);
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.04);
}

.input-area button:hover:not(:disabled)::after {
  opacity: 1;
}

.input-area button:active:not(:disabled) {
  transform: translateY(1px);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
}

.input-area button:disabled {
  background-color: #f8f8f8;
  border-color: #eeeeee;
  color: #bbb;
  cursor: not-allowed;
  box-shadow: none;
}

.message-tip {
  position: fixed;
  top: 24px;
  left: 50%;
  transform: translateX(-50%) translateY(-100%);
  background-color: rgba(255, 255, 255, 0.98);
  color: #666;
  padding: 14px 28px;
  border-radius: 16px;
  font-size: 14px;
  font-weight: 400;
  letter-spacing: 0.2px;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  opacity: 0;
  z-index: 1000;
  box-shadow:
    0 6px 16px rgba(0, 0, 0, 0.06),
    0 2px 4px rgba(0, 0, 0, 0.03);
  border: 1px solid rgba(240, 240, 240, 0.8);
  backdrop-filter: blur(8px);
}

.message-tip.show {
  transform: translateX(-50%) translateY(0);
  opacity: 1;
}

@media (max-width: 768px) {
  .danmu-item {
    font-size: 13px;
    padding: 6px 14px;
    border-radius: 16px;
  }

  .input-area {
    padding: 16px 20px;
  }

  .input-area input {
    padding: 12px 16px;
    font-size: 14px;
  }

  .input-area button {
    padding: 12px 20px;
    font-size: 14px;
  }

  .message-tip {
    font-size: 13px;
    padding: 12px 20px;
    width: 80%;
    max-width: 300px;
  }

  .danmu-area::after {
    height: 60px;
  }
}

@media (max-width: 480px) {
  .danmu-item {
    font-size: 12px;
    padding: 5px 12px;
  }

  .input-area {
    padding: 14px 16px;
    gap: 10px;
  }

  .input-area input {
    padding: 10px 14px;
  }

  .input-area button {
    padding: 10px 16px;
    font-size: 13px;
  }

  .message-container::before {
    height: 40px;
  }
}

@media (min-width: 1200px) {
  .danmu-item {
    font-size: 15px;
    padding: 9px 18px;
  }

  .input-area {
    padding: 28px 32px;
  }

  .input-area input {
    padding: 16px 24px;
    font-size: 15px;
  }

  .input-area button {
    padding: 16px 34px;
    font-size: 15px;
  }
}
</style>
