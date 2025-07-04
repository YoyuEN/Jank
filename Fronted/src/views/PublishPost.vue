<template>
  <div class="publish-bg">
    <div class="publish-container split-layout">
      <div class="split-left">
        <div class="publish-form">
          <div class="form-group">
            <label for="title">标题</label>
            <input
              type="text"
              id="title"
              v-model="postForm.title"
              placeholder="请输入帖子标题"
              class="form-input"
            />
            <span class="error-text" v-if="errors.title">{{ errors.title }}</span>
          </div>
          <div class="form-group">
            <label for="imageUpload">图片上传</label>
            <input
              type="file"
              id="imageUpload"
              accept="image/*"
              @change="handleImageUpload"
              class="form-input"
            />
            <div class="el-upload__tip">只能上传jpg/png文件，且不超过1mb</div>
            <span v-if="errors.image" class="error-text">{{ errors.image }}</span>
          </div>
          <div class="form-group">
            <label for="category">分类</label>
            <select
              id="category"
              v-model="postForm.categoryNames"
              @focus="getCategoryList"
              class="form-select"
            >
              <option value="">请选择分类</option>
              <option v-for="item in categoryList" :key="item.categoryId" :value="item.name">
                {{ item.name }}
              </option>
            </select>
            <span class="error-text" v-if="errors.categoryNames">{{ errors.categoryNames }}</span>
          </div>
          <div class="form-group">
            <label for="content">内容</label>
            <textarea
              id="content"
              v-model="postForm.contentHtml"
              placeholder="请输入帖子内容（支持Markdown语法）"
              class="form-textarea markdown-textarea"
              rows="12"
            ></textarea>
            <span class="error-text" v-if="errors.contentHtml">{{ errors.contentHtml }}</span>
          </div>
        </div>
        <div class="form-actions">
          <button class="btn-cancel" @click="handleCancel">取消</button>
          <button class="btn-publish" @click="handlePublish" :disabled="publishing">
            {{ publishing ? '发布中...' : '发布帖子' }}
          </button>
        </div>
      </div>
      <div class="split-right">
        <div class="preview-header">实时预览</div>
        <div class="markdown-preview" v-html="markedContent"></div>
      </div>
    </div>
  </div>
</template>

<script>
import * as marked from 'marked'
import DOMPurify from 'dompurify'
import { addPostDetail } from '@/api/posts/posts.js'
import { getCategoryList } from '@/api/posts/category/category'
import { ElMessage } from 'element-plus'

export default {
  name: 'PublishPost',
  data() {
    return {
      postForm: {
        title: '',
        image: '',
        contentHtml: '',
        categoryNames: '',
      },
      errors: {
        title: '',
        contentHtml: '',
        categoryNames: '',
      },
      categoryList: [],
      publishing: false,
    }
  },
  computed: {
    markedContent() {
      const sanitize = (html) => {
        return DOMPurify.sanitize(html)
      }

      return marked.parse(this.postForm.contentHtml || '', {
        renderer: new marked.Renderer(),
        sanitize: true,
        sanitizer: sanitize,
      })
    },
  },
  created() {
    this.getCategoryList
  },
  methods: {
    getCategoryList() {
      getCategoryList().then((response) => {
        this.categoryList = response.data
      })
    },
    handleImageUpload(event) {
      const file = event.target.files[0]
      if (file) {
        // 校验文件类型
        if (!['image/jpeg', 'image/png'].includes(file.type)) {
          this.errors.image = '只能上传 jpg/png 格式的图片'
          event.target.value = '' // 清空选择的文件
          return
        }

        // 校验文件大小（不超过 500KB）
        if (file.size > 1024 * 1024) {
          this.errors.image = '图片大小不能超过 500KB'
          event.target.value = '' // 清空选择的文件
          return
        }

        // 清除错误信息并保存选中的文件
        this.errors.image = ''
        this.postForm.image = file
      }
    },
    validateForm() {
      let isValid = true
      this.errors = {
        title: '',
        contentHtml: '',
        categoryNames: '',
      }

      if (!this.postForm.title || !this.postForm.title.trim()) {
        this.errors.title = '请输入帖子标题'
        isValid = false
      } else if (this.postForm.title.length > 100) {
        this.errors.title = '标题不能超过100个字符'
        isValid = false
      }

      if (!this.postForm.contentHtml || !this.postForm.contentHtml.trim()) {
        this.errors.contentHtml = '请输入帖子内容'
        isValid = false
      }

      if (!this.postForm.categoryNames) {
        this.errors.categoryNames = '请选择帖子分类'
        isValid = false
      }
      return isValid
    },

    async handlePublish() {
      if (!this.validateForm()) {
        return
      }

      this.publishing = true

      try {
        const formData = new FormData()
        formData.append('title', this.postForm.title)
        formData.append('contentHtml', this.postForm.contentHtml)
        formData.append('categoryNames', this.postForm.categoryNames)

        // 如果有图片，则追加到 formData 中
        if (this.postForm.image) {
          formData.append('image', this.postForm.image) // 确保字段名与后端接口一致（如 MultipartFile image）
        }

        const response = await addPostDetail(formData)

        if (response.code === 200) {
          ElMessage.success('帖子发布成功！')
          this.$router.push('/posts')
        } else {
          ElMessage.error(response.message || '发布失败，请重试')
        }
      } catch (error) {
        console.error('发布帖子失败:', error)
        ElMessage.error('服务器错误，请稍后重试')
      } finally {
        this.publishing = false
      }
    },

    handleCancel() {
      // 提示用户是否确认放弃编辑
      this.$confirm('确定要放弃编辑吗？未保存的内容将会丢失', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      })
        .then(() => {
          this.$router.back()
        })
        .catch(() => {})
    },
  },
}
</script>

<style scoped>
.publish-bg {
  min-height: 50vh;
  background: linear-gradient(135deg, #f8fafc 0%, #e0e7ef 100%);
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding: 60px 0 40px 0;
}

.publish-container {
  width: 100%;
  max-width: 1100px;
  height: 600px;
  background: rgba(255, 255, 255, 0.85);
  border-radius: 24px;
  box-shadow:
    0 8px 32px rgba(102, 126, 234, 0.1),
    0 1.5px 6px rgba(102, 126, 234, 0.08);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  padding: 36px 24px 32px 24px;
  margin: 0 16px;
  display: flex;
  gap: 36px;
}

.split-layout {
  flex-direction: row;
}
.split-left {
  flex: 1.1;
  min-width: 0;
  display: flex;
  flex-direction: column;
}
.split-right {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  background: rgba(236, 239, 255, 0.18);
  border-radius: 16px;
  border: 1.5px solid #e4e4e4;
  padding: 18px 18px 18px 18px;
  box-sizing: border-box;
  max-height: 700px;
  overflow: auto;
}

.preview-header {
  font-size: 1.1rem;
  font-weight: 600;
  color: #667eea;
  margin-bottom: 12px;
  letter-spacing: 1px;
}

.publish-header {
  text-align: left;
  margin-bottom: 24px;
}

.publish-header h1 {
  font-size: 2rem;
  color: #667eea;
  margin-bottom: 8px;
  font-weight: 700;
  letter-spacing: 1px;
}

.publish-header p {
  font-size: 1rem;
  color: #64748b;
}

.publish-form {
  margin-top: 0;
}

.form-group {
  margin-bottom: 22px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #333;
  letter-spacing: 0.5px;
}

.form-input,
.form-textarea {
  width: 100%;
  padding: 12px 14px;
  border: 1.5px solid #dcdfe6;
  border-radius: 10px;
  font-size: 15px;
  transition:
    border-color 0.2s,
    box-shadow 0.2s;
  background: rgba(236, 239, 255, 0.4);
  box-sizing: border-box;
}

.form-input:focus,
.form-textarea:focus,
.form-select:focus {
  outline: none;
  border-color: #667eea;
  box-shadow: 0 0 0 2px #e0e7ef;
}

.form-select {
  width: 100%;
  padding: 12px 14px;
  border: 1.5px solid #dcdfe6;
  border-radius: 10px;
  font-size: 15px;
  background: rgba(236, 239, 255, 0.4);
  transition:
    border-color 0.2s,
    box-shadow 0.2s;
}

.form-textarea {
  resize: vertical;
  min-height: 150px;
}

.error-text {
  display: block;
  margin-top: 5px;
  font-size: 13px;
  color: #f56c6c;
  font-weight: 500;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 18px;
  margin-top: 24px;
}

.markdown-textarea {
  height: 120px;
}

.btn-cancel,
.btn-publish {
  padding: 12px 32px;
  border-radius: 12px;
  font-size: 15px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.3s;
}

.btn-cancel {
  background: #fff;
  border: 1.5px solid #dcdfe6;
  color: #606266;
}

.btn-cancel:hover {
  color: #667eea;
  border-color: #b4cafe;
  background-color: #f4f8ff;
}

.btn-publish {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  color: #fff;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.08);
}

.btn-publish:hover {
  background: linear-gradient(135deg, #667eea 0%, #a5b4fc 100%);
}

.btn-publish:disabled {
  background: #a0cfff;
  cursor: not-allowed;
}

.markdown-preview {
  flex: 1;
  padding: 10px 12px;
  background: rgba(249, 249, 255, 0.7);
  border: none;
  border-radius: 10px;
  min-height: 200px;
  font-size: 15px;
  color: #334155;
  overflow-x: auto;
  box-sizing: border-box;
}

.el-upload__tip {
  font-size: 13px;
  color: #94a3b8;
  margin-top: 4px;
}

@media (max-width: 1100px) {
  .publish-container {
    flex-direction: column;
    gap: 24px;
    padding: 24px 4px 16px 4px;
  }
  .split-left,
  .split-right {
    max-width: 100%;
    border-radius: 10px;
    padding: 0;
  }
  .split-right {
    margin-top: 0;
    min-height: 180px;
  }
}

@media (max-width: 600px) {
  .publish-bg {
    padding: 10px 0 6px 0;
  }
  .publish-container {
    border-radius: 10px;
    padding: 6px 0 4px 0;
  }
  .form-actions {
    flex-direction: column;
    gap: 10px;
    align-items: stretch;
  }
  .btn-cancel,
  .btn-publish {
    width: 100%;
    padding: 12px 0;
    font-size: 16px;
  }
}
</style>
