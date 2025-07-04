<template>
  <div class="publish-page">
    <!-- 主要内容区域 -->
    <div class="publish-layout">
      <!-- 左侧编辑区域 -->
      <div class="edit-section">
        <!-- 用户信息卡片 -->
        <div class="user-card">
          <div class="user-avatar">
            <img :src="userAvatar" alt="头像" class="avatar-img" />
          </div>
          <div class="user-info">
            <span class="username">{{ userName }}</span>
            <span class="publish-time">{{ currentTime }}</span>
          </div>
          <div class="user-status">
            <span class="status-dot"></span>
            <span class="status-text">在线</span>
          </div>
        </div>

        <!-- 内容编辑区域 -->
        <div class="content-editor">
          <div class="editor-header">
            <h3 class="editor-title">分享你的想法</h3>
            <div class="char-counter">
              <span class="counter-text">{{ momentForm.content.length }}/500</span>
              <div class="counter-bar">
                <div
                  class="counter-progress"
                  :style="{ width: (momentForm.content.length / 500) * 100 + '%' }"
                ></div>
              </div>
            </div>
          </div>

          <textarea
            v-model="momentForm.content"
            placeholder="这一刻，我想说..."
            class="content-input"
            :maxlength="500"
            ref="contentInput"
          />
        </div>

        <!-- 分类选择 -->
        <div class="category-selector">
          <h3 class="section-title">选择分类</h3>
          <div class="category-list">
            <button
              v-for="category in categories"
              :key="category.value"
              :class="['category-btn', { active: momentForm.category === category.value }]"
              @click="selectCategory(category.value)"
            >
              <span class="category-icon">{{ category.icon }}</span>
              <span class="category-label">{{ category.label }}</span>
            </button>
          </div>
        </div>
      </div>

      <!-- 右侧图片管理区域 -->
      <div class="image-section">
        <!-- 图片管理区域 -->
        <div class="image-manager">
          <div class="manager-header">
            <h3 class="manager-title">图片管理</h3>
            <span class="image-count">{{ momentForm.selectedImages.length }}/9</span>
          </div>

          <!-- 图片上传区域 -->
          <div class="upload-area">
            <input
              type="file"
              multiple
              accept="image/*"
              @change="handleImageUpload"
              :disabled="momentForm.selectedImages.length >= 9"
              ref="fileInput"
              class="file-input"
            />

            <button
              class="upload-trigger"
              @click="$refs.fileInput.click()"
              :disabled="momentForm.selectedImages.length >= 9"
              :class="{ disabled: momentForm.selectedImages.length >= 9 }"
            >
              <div class="upload-content">
                <span class="upload-icon">📷</span>
                <span class="upload-text">添加图片</span>
              </div>
            </button>
          </div>

          <!-- 图片列表 -->
          <div v-if="momentForm.selectedImages.length > 0" class="image-list">
            <div
              v-for="(image, index) in momentForm.selectedImages"
              :key="index"
              class="image-list-item"
            >
              <div class="image-thumbnail">
                <img :src="image.previewUrl" alt="图片" class="thumbnail-img" />
                <div class="image-overlay">
                  <button class="remove-image-btn" @click="removeImage(index)">
                    <span class="remove-icon">×</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 底部操作栏 -->
    <div class="bottom-actions">
      <div class="action-left">
        <button class="action-btn draft-btn">
          <span class="action-icon">💾</span>
          保存草稿
        </button>
        <button class="action-btn clear-btn" @click="clearForm">
          <span class="action-icon">🗑️</span>
          清空
        </button>
      </div>
      <div class="action-right">
        <button
          class="action-btn publish-action-btn"
          @click="publish"
          :disabled="!canPublish"
          :class="{ disabled: !canPublish }"
        >
          <span class="action-icon">📤</span>
          发布朋友圈
        </button>
      </div>
    </div>

    <!-- 加载遮罩 -->
    <div v-if="publishing" class="loading-overlay">
      <div class="loading-content">
        <div class="loading-spinner"></div>
        <p class="loading-text">正在发布...</p>
        <p class="loading-subtext">请稍候，不要关闭页面</p>
      </div>
    </div>
  </div>
</template>

<script>
import { addMoment } from '@/api/moments/moments.js'
import { useUserStore } from '@/store/userStore.js'
import { ElMessage } from 'element-plus'

export default {
  name: 'PublishMoment',
  data() {
    return {
      momentForm: {
        content: '',
        selectedImages: [],
        userId: 0,
        category: '全部',
      },
      categories: [
        { value: '全部', label: '全部', icon: '📱' },
        { value: '生活', label: '生活', icon: '🏠' },
        { value: '趣事', label: '趣事', icon: '🎉' },
      ],
      publishing: false,
      currentTime: '',
    }
  },
  computed: {
    userAvatar() {
      const userStore = useUserStore()
      return userStore?.user?.avatar || '/default-avatar.png'
    },
    userName() {
      const userStore = useUserStore()
      return userStore?.user?.username || '用户'
    },
    canPublish() {
      return this.momentForm.content.trim() || this.momentForm.selectedImages.length > 0
    },
  },
  mounted() {
    this.updateTime()
    setInterval(this.updateTime, 1000)
    this.$refs.contentInput?.focus()
  },
  methods: {
    updateTime() {
      const now = new Date()
      this.currentTime = now.toLocaleString('zh-CN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
      })
    },

    selectCategory(category) {
      this.momentForm.category = category
    },

    handleImageUpload(event) {
      const files = Array.from(event.target.files)
      const remainingSlots = 9 - this.momentForm.selectedImages.length

      if (files.length > remainingSlots) {
        ElMessage.warning(`最多只能上传 ${remainingSlots} 张图片`)
        return
      }

      files.forEach((file) => {
        // 检查文件大小 (限制为5MB)
        if (file.size > 5 * 1024 * 1024) {
          ElMessage.error(`图片 ${file.name} 太大，请选择小于5MB的图片`)
          return
        }

        const reader = new FileReader()
        reader.onload = (e) => {
          this.momentForm.selectedImages.push({
            file,
            previewUrl: e.target.result,
          })
        }
        reader.readAsDataURL(file)
      })
    },

    removeImage(index) {
      this.momentForm.selectedImages.splice(index, 1)
    },

    formatFileSize(bytes) {
      if (bytes === 0) return '0 B'
      const k = 1024
      const sizes = ['B', 'KB', 'MB', 'GB']
      const i = Math.floor(Math.log(bytes) / Math.log(k))
      return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i]
    },

    clearForm() {
      this.momentForm.content = ''
      this.momentForm.selectedImages = []
      this.momentForm.category = '全部'
      this.$refs.fileInput.value = ''
      ElMessage.info('已清空表单')
    },

    async publish() {
      const userStore = useUserStore()
      if (!userStore?.user) {
        ElMessage.error('请先登录')
        return
      }

      if (!this.canPublish) {
        ElMessage.warning('请输入内容或添加图片')
        return
      }

      this.publishing = true

      try {
        const formData = new FormData()
        formData.append('content', this.momentForm.content.trim())
        formData.append('category', this.momentForm.category)
        formData.append('userId', userStore.user.userId)

        this.momentForm.selectedImages.forEach((img) => {
          formData.append('imageUrls', img.file)
        })

        const response = await addMoment(formData)

        if (response.code === 200) {
          ElMessage.success('发布成功！')

          // 重置表单
          this.momentForm.content = ''
          this.momentForm.selectedImages = []
          this.momentForm.category = '全部'
          this.$refs.fileInput.value = ''

          // 跳转到朋友圈列表
          setTimeout(() => {
            this.$router.push('/moments')
          }, 1000)
        } else {
          ElMessage.error(response.message || '发布失败')
        }
      } catch (error) {
        console.error('发布失败:', error)
        ElMessage.error('网络异常，请稍后再试')
      } finally {
        this.publishing = false
      }
    },
  },
}
</script>

<style scoped>
/* 页面整体样式 */
.publish-page {
  display: flex;
  flex-direction: column;
  width: 100%;
  margin-top: 70px;
  min-height: 89vh;
}

.back-icon {
  font-size: 18px;
  font-weight: bold;
}

.page-title {
  font-size: 20px;
  font-weight: 600;
  color: #495057;
  margin: 0;
}

.publish-header-btn {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 20px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border: none;
  border-radius: 25px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.publish-header-btn:hover:not(.disabled) {
  transform: translateY(-1px);
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.publish-header-btn.disabled {
  background: #adb5bd;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 主布局 */
.publish-layout {
  display: flex;
  flex: 1;
  gap: 24px;
  padding: 24px;
  width: 90%;
}

/* 左侧编辑区域 */
.edit-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 24px;
  min-width: 0;
}

/* 用户信息卡片 */
.user-card {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 20px;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 16px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  backdrop-filter: blur(20px);
}

.user-avatar {
  flex-shrink: 0;
}

.avatar-img {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #f8f9fa;
}

.user-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.username {
  font-size: 18px;
  font-weight: 600;
  color: #212529;
}

.publish-time {
  font-size: 14px;
  color: #6c757d;
}

.user-status {
  display: flex;
  align-items: center;
  gap: 6px;
}

.status-dot {
  width: 8px;
  height: 8px;
  background: #28a745;
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%,
  100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

.status-text {
  font-size: 12px;
  color: #28a745;
  font-weight: 500;
}

/* 内容编辑器 */
.content-editor {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 16px;
  padding: 24px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  backdrop-filter: blur(20px);
}

.editor-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.editor-title {
  font-size: 18px;
  font-weight: 600;
  color: #495057;
  margin: 0;
}

.char-counter {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 4px;
}

.counter-text {
  font-size: 12px;
  color: #6c757d;
  font-weight: 500;
}

.counter-bar {
  width: 60px;
  height: 4px;
  background: #e9ecef;
  border-radius: 2px;
  overflow: hidden;
}

.counter-progress {
  height: 100%;
  background: linear-gradient(135deg, #667eea, #764ba2);
  border-radius: 2px;
  transition: width 0.3s ease;
}

.content-input {
  width: 90%;
  min-height: 120px;
  padding: 16px;
  font-size: 16px;
  line-height: 1.6;
  border: 2px solid #e9ecef;
  border-radius: 12px;
  resize: vertical;
  font-family: inherit;
  transition: all 0.3s ease;
  background: transparent;
}

.content-input:focus {
  outline: none;
  border-color: #667eea;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.content-input::placeholder {
  color: #adb5bd;
}

/* 分类选择器 */
.category-selector {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  backdrop-filter: blur(20px);
}

.section-title {
  font-size: 14px;
  font-weight: 600;
  color: #495057;
  margin: 0 0 12px 0;
}

.category-list {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.category-btn {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 8px 12px;
  background: #f8f9fa;
  border: 1px solid #e9ecef;
  border-radius: 20px;
  color: #6c757d;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.category-btn:hover {
  background: #e9ecef;
  transform: translateY(-1px);
}

.category-btn.active {
  background: linear-gradient(135deg, #667eea, #764ba2);
  border-color: #667eea;
  color: white;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
}

.category-icon {
  font-size: 14px;
}

.category-label {
  font-size: 13px;
  font-weight: 500;
}

/* 右侧图片管理区域 */
.image-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 24px;
  min-width: 0;
}

/* 图片管理器 */
.image-manager {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 16px;
  padding: 24px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  backdrop-filter: blur(20px);
}

.manager-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.manager-title {
  font-size: 16px;
  font-weight: 600;
  color: #495057;
  margin: 0;
}

.image-count {
  font-size: 14px;
  color: #6c757d;
  font-weight: 500;
}

/* 上传区域 */
.upload-area {
  margin-bottom: 20px;
}

.file-input {
  display: none;
}

.upload-trigger {
  width: 100%;
  padding: 40px 20px;
  background: linear-gradient(135deg, #f8f9fa, #e9ecef);
  border: 2px dashed #dee2e6;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.upload-trigger:hover:not(.disabled) {
  background: linear-gradient(135deg, #e9ecef, #dee2e6);
  border-color: #667eea;
  transform: translateY(-2px);
}

.upload-trigger.disabled {
  background: #f8f9fa;
  border-color: #dee2e6;
  cursor: not-allowed;
}

.upload-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  color: #6c757d;
}

.upload-icon {
  font-size: 32px;
}

.upload-text {
  font-size: 16px;
  font-weight: 500;
}

/* 图片列表 */
.image-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  gap: 12px;
}

.image-list-item {
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.image-list-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
}

.image-thumbnail {
  position: relative;
  aspect-ratio: 1;
  overflow: hidden;
}

.thumbnail-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.image-thumbnail:hover .image-overlay {
  opacity: 1;
}

.remove-image-btn,
.reorder-btn {
  background: rgba(255, 255, 255, 0.9);
  border: none;
  border-radius: 50%;
  width: 28px;
  height: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.remove-image-btn:hover {
  background: #ff6b6b;
  color: white;
  transform: scale(1.1);
}

.reorder-btn:hover {
  background: #667eea;
  color: white;
  transform: scale(1.1);
}

.image-details {
  padding: 8px;
}

.image-name {
  display: block;
  font-size: 11px;
  color: #495057;
  font-weight: 500;
  margin-bottom: 2px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.image-size {
  font-size: 10px;
  color: #6c757d;
}

/* 底部操作栏 */
.bottom-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 24px;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(20px);
  border-top: 1px solid rgba(0, 0, 0, 0.1);
  position: sticky;
  bottom: 0;
  z-index: 100;
  width: auto;
}

.action-left,
.action-right {
  display: flex;
  gap: 12px;
}

.action-btn {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  border: none;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.draft-btn {
  background: #f8f9fa;
  color: #6c757d;
}

.draft-btn:hover {
  background: #e9ecef;
  transform: translateY(-1px);
}

.clear-btn {
  background: #fff5f5;
  color: #dc3545;
}

.clear-btn:hover {
  background: #fed7d7;
  transform: translateY(-1px);
}

.publish-action-btn {
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  padding: 12px 24px;
  font-weight: 600;
}

.publish-action-btn:hover:not(.disabled) {
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.publish-action-btn.disabled {
  background: #adb5bd;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 加载遮罩 */
.loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  backdrop-filter: blur(5px);
}

.loading-content {
  background: white;
  padding: 40px;
  border-radius: 16px;
  text-align: center;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
}

.loading-spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #667eea;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin: 0 auto 16px;
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
  color: #495057;
  margin: 0 0 8px 0;
  font-weight: 600;
}

.loading-subtext {
  font-size: 14px;
  color: #6c757d;
  margin: 0;
}

/* 响应式设计 */
@media (max-width: 1200px) {
  .publish-layout {
    flex-direction: column;
    gap: 16px;
  }

  .edit-section,
  .image-section {
    min-width: 0;
  }
}

@media (max-width: 768px) {
  .publish-header {
    padding: 12px 16px;
  }

  .publish-layout {
    padding: 16px;
    gap: 12px;
  }

  .user-card,
  .content-editor,
  .category-selector,
  .image-manager {
    padding: 16px;
  }

  .category-list {
    justify-content: center;
  }

  .image-list {
    grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  }

  .bottom-actions {
    padding: 12px 16px;
    flex-direction: column;
    gap: 12px;
  }

  .action-left,
  .action-right {
    width: 100%;
    justify-content: center;
  }
}

@media (max-width: 480px) {
  .publish-header {
    padding: 10px 12px;
  }

  .page-title {
    font-size: 18px;
  }

  .publish-layout {
    padding: 12px;
    gap: 8px;
  }

  .user-card,
  .content-editor,
  .category-selector,
  .image-manager {
    padding: 12px;
  }

  .category-list {
    justify-content: center;
  }

  .image-list {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>
