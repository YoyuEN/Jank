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
import { onMounted, ref } from 'vue'

const isDarkMode = ref(false);

const user = ref({
  avatar: '/YoyuEN.png', // 示例头像地址，可替换为真实数据
  username: 'test_user'
});

onMounted(async () => {
  const userData = await fetchUserInfo(); // 假设这是你的用户信息接口
  if (userData) {
    user.value = userData;
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
  alert('跳转到用户中心（可替换为路由）');
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
