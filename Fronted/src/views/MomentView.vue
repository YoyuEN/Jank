<template>
  <div v-if="loading" class="loading">正在加载朋友圈...</div>
  <div class="moment-container">
<!--    <button @click="fetchMoments">🔄 刷新</button>-->
    <!-- 左侧目录 -->
    <div class="category-menu">
      <ul>
        <li v-for="(category, index) in categories" :key="index" :class="{ active: selectedCategory === category }" @click="selectCategory(category)">
          {{ category }}
        </li>
      </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="moment-list">
      <div v-for="(moment, index) in filteredMoments" :key="index" class="moment-card">
        <div class="moment-header">
<!--          <img :src="moment.avatarUrl" alt="头像" class="avatar" />-->
          <img src="@/assets/YoyuEN.png" alt="头像" class="avatar" />
          <div class="user-info">
            <span class="username">{{ moment.username }}</span>
            <span class="time">{{ moment.createTime }}</span>
          </div>
        </div>

        <!-- 文字内容 -->
        <div class="moment-content">
          {{ moment.content }}
        </div>

        <!-- 图片展示 -->
        <div v-if="moment.imageUrls && moment.imageUrls.length > 0" class="moment-images">
<!--          <img v-for="(img, idx) in moment.imageUrls.slice(0, 9)" :key="idx" :src="img" alt="图片" class="moment-image" />-->
          <img v-for="(img, idx) in moment.imageUrls.slice(0, 9)" :key="idx" src="@/assets/YoyuEN.png" alt="图片" class="moment-image" />
        </div>

        <!-- 点赞和评论 -->
        <div class="moment-actions">
          <button @click="handleLike(index)">👍 点赞 {{ moment.likeCount }}</button>
          <button @click="toggleComments(index)">💬 评论 {{ moment.comments.length }}</button>
        </div>

        <!-- 子评论展开 -->
        <div v-if="moment.showComments && moment.comments.length > 0" class="comments-section">
          <div v-for="(comment, cIndex) in moment.comments" :key="cIndex" class="comment-item">
            <strong>{{ comment.nickname }}</strong>: {{ comment.content }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { addMoment, getMomentList, likeMoment } from '@/api/moments/moments.js'

export default {
  name: 'MomentView',
  data() {
    return {
      categories: ['全部', '好友圈', '我的'],
      selectedCategory: '全部',
      moments: [],
      loading: false
    };
  },
  computed: {
    filteredMoments() {
      if (this.selectedCategory === '全部') {
        return this.moments;
      } else if (this.selectedCategory === '好友圈') {
        return this.moments.filter(m => m.category !== '生活'); // 示例逻辑
      } else if (this.selectedCategory === '我的') {
        return this.moments.filter(m => m.category === '趣事'); // 示例逻辑
      }
      return this.moments;
    }
  },
  // 获取朋友圈列表
  async mounted() {
    console.log('mounted 被调用了');
    this.loading = true;
    try {
      const response = await getMomentList();
      if (response.code === 200) {
        this.moments = response.data.map(moment => ({
          ...moment,
          showComments: false,
          likeCount: moment.likeCount || 0,
          comments: moment.comments || []
        }));
      } else {
        this.$message.error('获取朋友圈失败');
      }
    } catch (error) {
      console.error('获取朋友圈出错:', error);
      this.$message.error('网络异常，请稍后再试');
    } finally {
      this.loading = false;
    }
  },
  methods: {
    selectCategory(category) {
      this.selectedCategory = category;
    },
    toggleComments(index) {
      const moment = this.moments[index];
      moment.showComments = !moment.showComments;
    },

    // 发布新朋友圈
    async publishMoment() {
      const newMoment = {
        content: this.content,
        userId: 'currentUserId',
        username: '当前用户',
        avatarUrl: 'https://example.com/avatar.jpg',
        imageUrls: this.selectedImages
      };
      await addMoment(newMoment);
      this.$message.success('发布成功');
      await this.fetchMoments(); // 刷新列表
    },

    async fetchMoments() {
      this.loading = true;
      try {
        const res = await getMomentList();
        if (res.code === 200) {
          this.moments = res.data.map(moment => ({
            ...moment,
            showComments: false,
            likeCount: moment.likeCount || 0,
            comments: moment.comments || []
          }));
        } else {
          this.$message.error('获取朋友圈失败');
        }
      } catch (error) {
        console.error('获取朋友圈出错:', error);
        this.$message.error('网络异常，请稍后再试');
      } finally {
        this.loading = false;
      }
    },
    // 点赞朋友圈
    async handleLike(index) {
      const moment = this.moments[index];
      await likeMoment(moment.momentId);
      moment.likeCount += 1;
    }
  }
};
</script>

<style scoped>
.loading {
  text-align: center;
  padding: 20px;
  color: #888;
}

.moment-container {
  display: flex;
  padding: 24px;
  margin: 40px auto 0;
}

.category-menu {
  width: 200px;
  border-right: 1px solid #ddd;
  padding: 20px;
}

.category-menu ul {
  list-style: none;
  padding-left: 0;
}

.category-menu li {
  margin-bottom: 10px;
  cursor: pointer;
}

.category-menu .active {
  font-weight: bold;
  color: #42b983;
}

.moment-list {
  flex: 1;
  padding: 20px;
}

.moment-card {
  border: 1px solid #eee;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 20px;
  background-color: #fff;
}

.moment-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 10px;
}

.user-info {
  display: flex;
  flex-direction: column;
}

.username {
  font-weight: bold;
}

.time {
  color: #888;
  font-size: 12px;
}

.moment-content {
  margin-bottom: 10px;
}

.moment-images {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  gap: 10px;
  margin-bottom: 10px;
}

.moment-image {
  width: 100%;
  height: auto;
  object-fit: cover;
  border-radius: 4px;
}

.moment-actions button {
  margin-right: 10px;
  background: none;
  border: none;
  cursor: pointer;
  color: #666;
}

.comments-section {
  margin-top: 10px;
  padding: 10px;
  background-color: #f9f9f9;
  border-radius: 4px;
}
</style>
