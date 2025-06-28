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
          <img :src="moment.avatarUrl" alt="头像" class="avatar" />
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
          <img v-for="(img, idx) in moment.imageUrls.slice(0, 9)" :key="idx" :src="img" alt="图片" class="moment-image" />
        </div>

        <!-- 点赞和评论 -->
        <div class="moment-actions">
          <button @click="handleLike(moment.momentId)">
            {{ moment.likedByUser ? '💔 取消点赞' : '👍 点赞' }} {{ moment.likeCount }}
          </button>

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
import { addMoment, cancelLike, getMomentList, likeMoment } from '@/api/moments/moments.js'

export default {
  name: 'MomentView',
  data() {
    return {
      categories: ['全部', '生活', '趣事'],
      selectedCategory: '全部',
      moments: [],
      loading: false
    };
  },
  computed: {
    filteredMoments() {
      if (this.selectedCategory === '全部') {
        return this.moments;
      } else if (this.selectedCategory === '生活') {
        return this.moments.filter(m => m.category === '生活'); // 示例逻辑
      } else if (this.selectedCategory === '趣事') {
        return this.moments.filter(m => m.category === '趣事'); // 示例逻辑
      }
      return this.moments;
    }
  },


  async mounted() {
    console.log('mounted 被调用了');
    this.loading = true;
    try {
      const response = await getMomentList();
      console.log('原始响应:', response); // 打印整个响应
      console.log('映射前的 data:', response.data); // 打印原始数据

      if (response.code === 200 && Array.isArray(response.data)) {
        this.moments = response.data.map(moment => ({
          momentId: moment.momentId,
          content: moment.content,
          userId: moment.userId,
          username: moment.username,
          category: moment.category,
          avatarUrl: moment.avatarUrl,
          imageUrls: moment.imageUrls || [],
          likeCount: moment.likeCount || 0,
          likedByUser: !!moment.likedByUser,
          comments: moment.comments || [],
          createTime: moment.createTime,
          showComments: false
        }));
        // 打印第一条朋友圈查看是否包含 momentId
        console.log('第一条朋友圈:', this.moments[0]);

      } else {
        this.moments = [];
        this.$message.error('获取朋友圈失败');
      }
    } catch (error) {
      console.error('获取朋友圈出错:', error);
      this.$message.error('网络异常，请稍后再试');
      this.moments = [];
    } finally {
      this.loading = false;
    }
  },

  methods: {
    selectCategory(category) {
      this.selectedCategory = category;
    },
    toggleComments(index) {
      this.moments = this.moments.map((m, i) =>
        i === index ? { ...m, showComments: !m.showComments } : m
      );
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

    async handleLike(momentId) {
      const moment = this.moments.find(m => m.momentId === momentId);
      if (!moment) {
        console.error('找不到对应的朋友圈:', momentId);
        return;
      }
      const isLiked = !moment.likedByUser;

      try {
        if (isLiked) {
          // 点赞
          await likeMoment(moment.momentId); // 调用点赞接口
          console.log(momentId)
          console.log(moment.momentId)
          moment.likeCount += 1;
        } else {
          // 取消点赞
          await cancelLike(moment.momentId); // 调用取消点赞接口
          moment.likeCount -= 1;
        }
        moment.likedByUser = isLiked;
      } catch (error) {
        console.error('点赞失败:', error);
        this.$message.error('操作失败，请重试');
      }
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
  font-size: 12px;
}

.moment-content {
  margin-bottom: 10px;
}

.moment-images {
  display: grid;
  grid-template-columns: repeat(auto-fill, 300px); /* 固定每张图宽度为 300px */
  gap: 15px; /* 图片之间的水平和垂直间距 */
  justify-content: flex-start; /* 左对齐，避免拉伸 */
}

.moment-image {
  width: 300px;
  height: 300px;
  object-fit: cover;
  border-radius: 4px;
}

.moment-image:hover {
  transform: scale(1.05); /* 可选：鼠标悬停放大效果 */
}

.moment-actions button {
  margin-right: 10px;
  margin-top: 10px;
  background: none;
  border: none;
  cursor: pointer;
  color: #666;
}

.comments-section {
  margin-top: 10px;
  padding: 10px;
  border-radius: 4px;
}
</style>
