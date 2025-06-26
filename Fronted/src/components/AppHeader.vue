<template>
  <header class="navbar">
    <div class="lm">
      <div class="logo">Jank</div>
      <nav class="menu">
        <router-link to="/home" active-class="active">首页</router-link>
        <router-link to="/posts" active-class="active">帖子</router-link>
        <router-link to="/say" active-class="active">说说</router-link>
        <router-link to="/message" active-class="active">留言</router-link>
        <router-link to="/about" active-class="active">关于</router-link>
      </nav>
    </div>
    <div class="icons">
      <button @click="toggleTheme">
        {{ isDarkMode ? '☀️' : '🌙' }}
      </button>
      <img
        :src="user.avatar"
        alt="用户头像"
        class="user-avatar"
        @click="goToProfile"
      />
    </div>
  </header>
</template>

<script setup>
import { onMounted, ref, watchEffect } from 'vue'
import { getUserByUserId } from '@/api/user/user.js'
import router from '@/router/index.js'
import { useUserStore } from '@/store/userStore.js'

const isDarkMode = ref(false);
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(userStore.user || {
  avatar: '/img1.png',
  username: '游客',
  userId: ''
})
// 监听 store 的变化（响应式更新头像）
watchEffect(() => {
  if (userStore.user) {
    user.value = userStore.user
  }
})

// 页面加载时恢复用户状态（例如刷新页面）
onMounted(() => {
  userStore.restoreFromLocalStorage()
})

onMounted(async () => {
  try {
    const userId = userStore.user?.userId; // 从 Pinia store 获取 userId
    if (!userId) {
      console.warn('用户未登录或缺少 userId');
      return;
    }

    const response = await getUserByUserId(userId); // 正确传入 userId 参数
    const userData = response.data;

    if (userData) {
      user.value = userData; // 更新本地 user 响应式数据
    }
  } catch (error) {
    console.error('获取用户信息失败:', error);
  }
});


// 可选：监听 storage 事件，跨标签页同步用户信息
window.addEventListener('storage', () => {
  const storedUser = localStorage.getItem('user')
  if (storedUser) {
    user.value = JSON.parse(storedUser)
  }
})
const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value;
  document.body.classList.toggle('dark', isDarkMode.value);
  localStorage.setItem('theme', isDarkMode.value ? 'dark' : 'light');
};

onMounted(() => {
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    isDarkMode.value = true;
    document.body.classList.add('dark');
  }
});
const goToProfile = () => {
  router.push('/login');
};
</script>

<style scoped>
.menu a.active {
  color: #000000; /* 激活状态的文字颜色 */
  font-weight: bold; /* 加粗字体 */
}
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 24px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  background-color: rgba(255, 255, 255, 0.6);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  z-index: 1000;
  position: fixed;
  width: 70%;
  left: 50%;
  transform: translateX(-50%); /* 水平居中 */
  top: 0;
}

.user-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  object-fit: cover;
  cursor: pointer;
  transition: transform 0.2s ease;
}

.user-avatar:hover {
  transform: scale(1.1);
}

.logo {
  font-weight: bold;
  font-size: 18px;
}

.lm {
  display: flex;
  align-items: center;
}
.menu {
  display: flex;
  gap: 20px;
  margin-left: 20px;
}

.menu a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
}

.icons {
  display: flex;
  gap: 16px;
}

.icons button {
  background: none;
  border: none;
  font-size: 18px;
  cursor: pointer;
}
</style>
