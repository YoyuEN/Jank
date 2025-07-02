<template>
  <header class="navbar">
    <div class="lm">
      <div class="logo">Jank</div>
      <nav class="menu">
        <router-link to="/home" active-class="active">首页</router-link>
        <router-link to="/posts" active-class="active">帖子</router-link>
        <router-link to="/moments" active-class="active">说说</router-link>
        <router-link to="/message" active-class="active">留言</router-link>
        <router-link to="/about" active-class="active">关于</router-link>
      </nav>
    </div>
    <div class="icons">
      <button @click="toggleTheme">
        {{ isDarkMode ? '☀️' : '🌙' }}
      </button>
      <div class="avatar-container" @click="toggleDropdown">
        <img
          :src="user.avatar"
          alt=""
          class="user-avatar"
        />
        <!-- 下拉菜单 -->
        <div v-show="isDropdownOpen" class="dropdown-menu">
          <div class="dropdown-arrow"></div>
          <div class="dropdown-content">
            <div class="user-info">
              <img :src="user.avatar" alt="" class="dropdown-avatar">
              <div class="user-details">
                <div class="username">{{ user.username || '游客' }}</div>
                <div class="user-id">{{ user.userId ? 'ID: ' + user.userId : '' }}</div>
              </div>
            </div>
            <div class="dropdown-divider"></div>
            <ul>
              <li @click="goToProfile">
                <i class="fa fa-user-circle-o"></i> 个人资料
              </li>
              <li @click="goToSettings">
                <i class="fa fa-cog"></i> 设置
              </li>
              <li v-if="!userStore.user" @click="login">
                <i class="fa fa-sign-out"></i> 登录
              </li>
              <li v-if="userStore.user" @click="logout">
                <i class="fa fa-sign-out"></i> 退出
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
import { onMounted, ref, watchEffect, onUnmounted } from 'vue'
import { getUserByUserId } from '@/api/user/user.js'
import router from '@/router/index.js'
import { useUserStore } from '@/store/userStore.js'
import YoyuEN from '@/assets/YoyuEN.png'

const isDarkMode = ref(false);
const isDropdownOpen = ref(false);
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(userStore.user || {
  avatar: YoyuEN,
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

  // 恢复主题设置
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    isDarkMode.value = true;
    document.body.classList.add('dark');
  }

  // 添加点击外部关闭下拉菜单的事件
  document.addEventListener('click', handleOutsideClick);
});

// 卸载时移除事件监听器
onUnmounted(() => {
  document.removeEventListener('click', handleOutsideClick);
});

// 获取用户信息
onMounted(async () => {
  try {
    const userId = userStore.user?.userId;
    if (!userId) {
      console.warn('用户未登录或缺少 userId');
      return;
    }

    const response = await getUserByUserId(userId);
    const userData = response.data;

    if (userData) {
      user.value = userData;
    }
  } catch (error) {
    console.error('获取用户信息失败:', error);
  }
});

// 监听 storage 事件，跨标签页同步用户信息
window.addEventListener('storage', () => {
  const storedUser = localStorage.getItem('user')
  if (storedUser) {
    user.value = JSON.parse(storedUser)
  }
})

// 主题切换
const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value;
  document.body.classList.toggle('dark', isDarkMode.value);
  localStorage.setItem('theme', isDarkMode.value ? 'dark' : 'light');
};

// 下拉菜单切换
const toggleDropdown = (event) => {
  event.stopPropagation(); // 阻止事件冒泡
  isDropdownOpen.value = !isDropdownOpen.value;
};

// 点击外部关闭下拉菜单
const handleOutsideClick = (event) => {
  const dropdown = document.querySelector('.dropdown-menu');
  const avatar = document.querySelector('.user-avatar');

  if (dropdown && !dropdown.contains(event.target) && !avatar.contains(event.target)) {
    isDropdownOpen.value = false;
  }
};

// 导航相关方法
const goToProfile = () => {
  isDropdownOpen.value = false;
  if (userStore.user) {
    router.push('/user');
  } else {
    router.push('/login');
  }
};

const goToSettings = () => {
  isDropdownOpen.value = false;
  router.push('/settings');
};

const login = () => {
  isDropdownOpen.value = false;
  router.push('/login');
};

const logout = () => {
  isDropdownOpen.value = false;
  userStore.clearUserInfo(); // 清除 Vuex 或 Pinia 中的用户信息
  window.location.reload();
};

</script>

<style scoped>
.menu a.active {
  color: #000000;
  font-weight: bold;
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
  transform: translateX(-50%);
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
  align-items: center;
  gap: 16px;
}

.icons button {
  background: none;
  border: none;
  font-size: 18px;
  cursor: pointer;
}

/* 下拉菜单样式 */
.avatar-container {
  position: relative;
}

.dropdown-menu {
  position: absolute;
  top: calc(100% + 8px);
  right: 0;
  width: 240px;
  background-color: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  z-index: 2000;
  animation: fadeIn 0.2s ease-in-out;
  overflow: hidden;
  border: 1px solid rgba(0, 0, 0, 0.08);
}

/* 豆包风格的下拉箭头 */
.dropdown-arrow {
  position: absolute;
  top: -8px;
  right: 12px;
  width: 16px;
  height: 16px;
  background-color: white;
  transform: rotate(45deg);
  border-left: 1px solid rgba(0, 0, 0, 0.08);
  border-top: 1px solid rgba(0, 0, 0, 0.08);
}

.dropdown-content {
  position: relative;
  z-index: 10;
  background-color: white;
  border-radius: 12px;
}

.user-info {
  display: flex;
  align-items: center;
  padding: 16px;
}

.dropdown-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  margin-right: 12px;
}

.user-details {
  display: flex;
  flex-direction: column;
}

.username {
  font-weight: 600;
  color: #333;
  font-size: 14px;
}

.user-id {
  color: #888;
  font-size: 12px;
  margin-top: 2px;
}

.dropdown-divider {
  height: 1px;
  background-color: rgba(0, 0, 0, 0.08);
  margin: 0 12px;
}

.dropdown-content ul {
  list-style: none;
  padding: 4px 0;
  margin: 0;
}

.dropdown-content li {
  padding: 10px 16px;
  cursor: pointer;
  font-size: 14px;
  color: #333;
  display: flex;
  align-items: center;
}

.dropdown-content li:hover {
  background-color: rgba(0, 0, 0, 0.05);
}

.dropdown-content li i {
  margin-right: 12px;
  width: 16px;
  text-align: center;
  color: #888;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
