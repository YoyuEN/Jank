<template>
  <div class="publish-moment-container">
        <!-- 内容输入框 -->
    <textarea
      v-model="momentForm.content"
      placeholder="这一刻的想法……"
      class="content-input"
    />

    <!-- 图片上传区域 -->
    <div class="image-upload">
      <input
        type="file"
        multiple
        accept="image/*"
        @change="handleImageUpload"
        :disabled="momentForm.selectedImages.length >= 9"
        ref="fileInput"
        style="display: none"
      />
      <button
        class="upload-btn"
        @click="$refs.fileInput.click()"
        :disabled="momentForm.selectedImages.length >= 9"
      >
        {{ momentForm.selectedImages.length >= 9 ? "已达上限" : "添加图片" }}
      </button>
    </div>

    <!-- 图片预览区域 -->
    <div v-if="momentForm.selectedImages.length > 0" class="image-preview">
      <div
        v-for="(image, index) in momentForm.selectedImages"
        :key="index"
        class="image-item"
      >
        <img :src="image.previewUrl" alt="预览图" class="preview-img" />
        <button class="remove-btn" @click="removeImage(index)">×</button>
      </div>
    </div>

    <!-- 发布按钮 -->
    <button class="publish-btn" @click="publish">发布</button>
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
        category: "全部"
      },
    };
  },
  methods: {
    handleImageUpload(event) {
      const files = Array.from(event.target.files);
      const remainingSlots = 9 - this.momentForm.selectedImages.length;

      if (files.length > remainingSlots) {
        alert(`最多只能上传 ${remainingSlots} 张图片`);
        return;
      }

      files.forEach(file => {
        const reader = new FileReader();
        reader.onload = e => {
          this.momentForm.selectedImages.push({
            file,
            previewUrl: e.target.result
          });
        };
        reader.readAsDataURL(file);
      });
    },

    // 移除图片
    removeImage(index) {
      this.momentForm.selectedImages.splice(index, 1);
    },

    async publish() {
      const userStore = useUserStore()
      if (userStore === null || !userStore.user) {
        alert('请先登录');
        return;
      }

      if (!this.momentForm.content.trim() && this.momentForm.selectedImages.length === 0) {
        alert('请输入内容或添加图片');
        return;
      }

      const formData = new FormData();
      formData.append('content', this.momentForm.content.trim());
      formData.append('category', this.momentForm.category);
      formData.append('userId', userStore.user.userId);

      // 正确添加文件列表
      this.momentForm.selectedImages.forEach((img) => {
        formData.append('imageUrls', img.file); // 每个都是 File 对象
      });

      try {
        const response = await addMoment(formData);
        if (response.code === 200) {
          ElMessage.success('发布成功');
          this.$router.push('/moments');

          // 提交成功后重置表单
          this.momentForm.content = '';
          this.momentForm.selectedImages = [];
          this.$refs.fileInput.value = ''; // 清空文件输入框
        } else {
          ElMessage.error('发布失败');
        }
      } catch (error) {
        console.error('发布失败:', error);
        ElMessage.error('网络异常，请稍后再试');
      }
    }
  }
};
</script>

<style scoped>
.publish-moment-container {
  max-width: 600px;
  margin: 40px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

.content-input {
  width: 100%;
  height: 100px;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 8px;
  resize: none;
  margin-bottom: 20px;
}

.upload-btn {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
}

.upload-btn:disabled {
  background-color: #aaa;
  cursor: not-allowed;
}

.image-preview {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  gap: 10px;
  margin-top: 20px;
}

.image-item {
  position: relative;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
}

.preview-img {
  width: 100%;
  height: 100px;
  object-fit: cover;
}

.remove-btn {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: rgba(255, 255, 255, 0.8);
  border: none;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
  padding: 0 6px;
  border-radius: 50%;
}

.publish-btn {
  margin-top: 20px;
  padding: 12px;
  width: 100%;
  background-color: #28a745;
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
</style>
