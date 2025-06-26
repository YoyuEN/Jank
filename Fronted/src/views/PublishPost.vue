<template>
  <div class="publish-container">
    <div class="publish-header">
      <h1>发布新帖子</h1>
      <p>分享你的想法和故事</p>
    </div>

    <div class="publish-form">
      <div class="form-group">
        <label for="title">标题</label>
        <input
          type="text"
          id="title"
          v-model="postForm.title"
          placeholder="请输入帖子标题"
          class="form-input"
        >
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
        >
        <div class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
        <span v-if="errors.image">{{ errors.image }}</span>
      </div>
      <div class="form-group">
        <label for="content">内容</label>
        <textarea
          id="content"
          v-model="postForm.content"
          placeholder="请输入帖子内容"
          class="form-textarea"
          rows="10"
        ></textarea>
        <span class="error-text" v-if="errors.content">{{ errors.content }}</span>
      </div>

      <div class="form-group">
        <label for="category">分类</label>
        <select id="category" v-model="postForm.category" class="form-select">
          <option value="">请选择分类</option>
          <option value="technology">技术</option>
          <option value="life">生活</option>
          <option value="discussion">讨论</option>
          <option value="question">问答</option>
        </select>
        <span class="error-text" v-if="errors.category">{{ errors.category }}</span>
      </div>

      <div class="form-actions">
        <button class="btn-cancel" @click="handleCancel">取消</button>
        <button class="btn-publish" @click="handlePublish" :disabled="publishing">
          {{ publishing ? '发布中...' : '发布帖子' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PublishPost',
  data() {
    return {
      postForm: {
        title: '',
        content: '',
        category: '',
        image:null
      },
      errors: {
        title: '',
        content: '',
        category: ''
      },
      publishing: false
    }
  },
  methods: {
    handleImageUpload(event) {
      const file = event.target.files[0];
      if (file) {
        // 校验文件类型
        if (!['image/jpeg', 'image/png'].includes(file.type)) {
          this.errors.image = '只能上传 jpg/png 格式的图片';
          event.target.value = ''; // 清空选择的文件
          return;
        }

        // 校验文件大小（不超过 500KB）
        if (file.size > 500 * 1024) {
          this.errors.image = '图片大小不能超过 500KB';
          event.target.value = ''; // 清空选择的文件
          return;
        }

        // 清除错误信息并保存选中的文件
        this.errors.image = '';
        this.postForm.image = file;
      }
    },
    validateForm() {
      let isValid = true
      this.errors = {
        title: '',
        content: '',
        category: ''
      }

      if (!this.postForm.title.trim()) {
        this.errors.title = '请输入帖子标题'
        isValid = false
      } else if (this.postForm.title.length > 100) {
        this.errors.title = '标题不能超过100个字符'
        isValid = false
      }

      if (!this.postForm.content.trim()) {
        this.errors.content = '请输入帖子内容'
        isValid = false
      }

      if (!this.postForm.category) {
        this.errors.category = '请选择帖子分类'
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
        // 发送请求发布帖子
        const response = await this.$axios.post('/api/posts', this.postForm)

        if (response.data.code === 200) {
          // 发布成功
          this.$message.success('帖子发布成功！')
          // 跳转到帖子列表或帖子详情页
          this.$router.push({
            name: 'PostDetail',
            params: { id: response.data.data.id }
          })
        } else {
          this.$message.error(response.data.message || '发布失败，请重试')
        }
      } catch (error) {
        console.error('发布帖子失败:', error)
        this.$message.error('服务器错误，请稍后重试')
      } finally {
        this.publishing = false
      }
    },

    handleCancel() {
      // 提示用户是否确认放弃编辑
      this.$confirm('确定要放弃编辑吗？未保存的内容将会丢失', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$router.back()
      }).catch(() => {})
    }
  }
}
</script>

<style scoped>
.publish-container {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.publish-header {
  text-align: center;
  margin-bottom: 30px;
}

.publish-header h1 {
  font-size: 24px;
  color: #333;
  margin-bottom: 8px;
}

.publish-header p {
  font-size: 14px;
  color: #666;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  color: #333;
}

.form-input,
.form-textarea{
  width: 97%;
  padding: 10px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  font-size: 14px;
  transition: border-color 0.2s;
}
.form-select {
  width: 100%;
  padding: 10px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  font-size: 14px;
  transition: border-color 0.2s;
}

.form-input:focus,
.form-textarea:focus,
.form-select:focus {
  outline: none;
  border-color: #409eff;
}

.form-textarea {
  resize: vertical;
  min-height: 150px;
}

.error-text {
  display: block;
  margin-top: 5px;
  font-size: 12px;
  color: #f56c6c;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  margin-top: 30px;
}

.btn-cancel,
.btn-publish {
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s;
}

.btn-cancel {
  background: #fff;
  border: 1px solid #dcdfe6;
  color: #606266;
}

.btn-cancel:hover {
  color: #409eff;
  border-color: #c6e2ff;
  background-color: #ecf5ff;
}

.btn-publish {
  background: #409eff;
  border: none;
  color: #fff;
}

.btn-publish:hover {
  background: #66b1ff;
}

.btn-publish:disabled {
  background: #a0cfff;
  cursor: not-allowed;
}
</style>
