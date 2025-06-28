<template>
  <div class="moment-container">
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
          <button @click="likeMoment(index)">👍 点赞 {{ moment.likeCount }}</button>
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
export default {
  name: 'MomentView',
  data() {
    return {
      categories: ['全部', '好友圈', '我的'],
      selectedCategory: '全部',
      moments: [
        {
          momentId: '1',
          content: '今天天气真好！出去踏青啦～',
          userId: 'u1',
          username: '小明',
          avatarUrl: 'https://via.placeholder.com/50',
          imageUrls: [
            'https://via.placeholder.com/300x200?text=1',
            'https://via.placeholder.com/300x200?text=2',
            'https://via.placeholder.com/300x200?text=3'
          ],
          likeCount: 15,
          comments: [
            { nickname: '小红', content: '好开心的样子！' },
            { nickname: '小刚', content: '我也想去！' }
          ],
          createTime: '2小时前',
          showComments: false
        },
        {
          momentId: '2',
          content: '学习 Vue + Spring Boot 的第一天！',
          userId: 'u2',
          username: '前端开发者',
          avatarUrl: 'https://via.placeholder.com/50',
          imageUrls: [
            'https://via.placeholder.com/300x200?text=4',
            'https://via.placeholder.com/300x200?text=5'
          ],
          likeCount: 8,
          comments: [],
          createTime: '3小时前',
          showComments: false
        }
      ]
    };
  },
  computed: {
    filteredMoments() {
      if (this.selectedCategory === '全部') {
        return this.moments;
      } else if (this.selectedCategory === '好友圈') {
        return this.moments.filter(m => m.userId !== 'u2'); // 示例逻辑
      } else if (this.selectedCategory === '我的') {
        return this.moments.filter(m => m.userId === 'u1'); // 示例逻辑
      }
      return this.moments;
    }
  },
  methods: {
    selectCategory(category) {
      this.selectedCategory = category;
    },
    likeMoment(index) {
      const moment = this.moments[index];
      moment.likeCount += 1;
    },
    toggleComments(index) {
      const moment = this.moments[index];
      moment.showComments = !moment.showComments;
    }
  }
};
</script>

<style scoped>
.moment-container {
  display: flex;
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
