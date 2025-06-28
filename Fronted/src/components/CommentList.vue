<template>
  <div class="comment-list">
    <!-- 评论总数 -->
    <div class="comment-count">共 {{ totalComments }} 条评论</div>

    <!-- 筛选按钮 -->
    <div class="filter-buttons">
      <button @click="setFilter('hot')" :class="{ active: filterType === 'hot' }">热门</button>
      <button @click="setFilter('latest')" :class="{ active: filterType === 'latest' }">最新</button>
    </div>

    <!-- 评论列表 -->
    <div class="comments">
      <div v-for="(comment, index) in filteredComments" :key="index" class="comment-item">
        <div class="comment-header">
          <img src="@/assets/YoyuEN.png" alt="头像" class="avatar" />
          <div class="user-info">
            <span class="nickname">{{ comment.nickname }}</span>
            <span class="time">{{ comment.time }}</span>
          </div>
        </div>
        <div class="comment-content">{{ comment.content }}</div>
        <div class="comment-actions">
          <button @click="likeComment(index)">
            👍 点赞 {{ comment.likes }}
          </button>
          <button @click="toggleReplies(index)">
            💬 子评论 {{ comment.replies.length }}
          </button>
        </div>

        <!-- 子评论卡片 -->
        <div v-if="comment.showReplies && comment.replies.length > 0" class="replies">
          <div v-for="(reply, rIndex) in comment.replies" :key="rIndex" class="reply-card">
            <p><strong>{{ reply.nickname }}</strong>: {{ reply.content }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      totalComments: 15,
      filterType: "hot",
      comments: [
        {
          avatar: '@/assets/YoyuEN.png',
          nickname: "用户A",
          time: "2小时前",
          content: "这是一个很棒的帖子！",
          likes: 10,
          showReplies: false,
          replies: [
            {
              nickname: "用户B",
              content: "确实不错，支持一下！",
            },
            {
              nickname: "用户C",
              content: "很有启发性的内容。",
            },
          ],
        },
        {
          avatar: "https://via.placeholder.com/50",
          nickname: "用户D",
          time: "3小时前",
          content: "感谢分享，学习了！",
          likes: 5,
          showReplies: false,
          replies: [],
        },
      ],
      // 模拟数据，实际可能从API获取
      hotComments: [
        {
          avatar: "https://via.placeholder.com/50",
          nickname: "用户A",
          time: "2小时前",
          content: "这是一个很棒的帖子！",
          likes: 10,
          showReplies: false,
          replies: [
            {
              nickname: "用户B",
              content: "确实不错，支持一下！",
            },
            {
              nickname: "用户C",
              content: "很有启发性的内容。",
            },
          ],
        },
      ],
      latestComments: [
        {
          avatar: "https://via.placeholder.com/50",
          nickname: "用户D",
          time: "3小时前",
          content: "感谢分享，学习了！",
          likes: 5,
          showReplies: false,
          replies: [
            {
              nickname: "用户B",
              content: "确实不错，支持一下！",
            },
            {
              nickname: "用户C",
              content: "很有启发性的内容。",
            },
          ],
        },
      ],
    };
  },
  computed: {
    filteredComments() {
      if (this.filterType === "hot") {
        return this.hotComments;
      } else {
        return this.latestComments;
      }
    },
  },
  methods: {
    setFilter(type) {
      this.filterType = type;
    },
    likeComment(index) {
      const comment = this.comments[index];
      comment.likes += 1;
    },
    toggleReplies(index) {
      const comment = this.comments[index];
      comment.showReplies = !comment.showReplies;
    },
  },
};
</script>

<style scoped>
.comment-list {
  padding: 20px;
}

.comment-count {
  font-size: 18px;
  margin-bottom: 10px;
}

.filter-buttons button {
  margin-right: 10px;
  padding: 5px 10px;
  cursor: pointer;
}

.filter-buttons .active {
  background-color: #42b983;
  color: white;
  border-radius: 4px;
}

.comment-item {
  border-bottom: 1px solid #ddd;
  padding: 15px 0;
}

.comment-header {
  display: flex;
  align-items: center;
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

.nickname {
  font-weight: bold;
}

.time {
  color: #888;
  font-size: 12px;
}

.comment-content {
  margin: 10px 0;
}

.comment-actions button {
  margin-right: 10px;
  background: none;
  border: none;
  cursor: pointer;
}

.reply-card {
  border: 1px solid #eee;
  padding: 10px;
  margin-top: 5px;
}
</style>
