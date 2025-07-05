<template>
  <header class="navbar">
    <div class="lm">
      <div class="logo">
        <span class="logo-text">Jank</span>
        <span class="logo-dot"></span>
      </div>
      <nav class="menu">
        <router-link to="/home" active-class="active" class="nav-link">
          <i class="nav-icon">🏠</i>
          <span>首页</span>
        </router-link>
        <router-link to="/posts" active-class="active" class="nav-link">
          <i class="nav-icon">📝</i>
          <span>帖子</span>
        </router-link>
        <router-link to="/moments" active-class="active" class="nav-link">
          <i class="nav-icon">💬</i>
          <span>说说</span>
        </router-link>
        <router-link to="/message" active-class="active" class="nav-link">
          <i class="nav-icon">💌</i>
          <span>留言</span>
        </router-link>
        <router-link to="/about" active-class="active" class="nav-link">
          <i class="nav-icon">ℹ️</i>
          <span>关于</span>
        </router-link>
      </nav>
    </div>
    <div class="icons">
      <button @click="toggleTheme" class="theme-btn">
        <span class="theme-icon">{{ isDarkMode ? '☀️' : '🌙' }}</span>
      </button>
      <div class="avatar-container" @click="toggleDropdown">
        <div class="avatar-wrapper">
          <img :src="user.avatar" alt="" class="user-avatar" />
          <div class="avatar-status"></div>
          <div class="avatar-status" :class="{ offline: !userStore.user }"></div>
        </div>
        <!-- 下拉菜单 -->
        <div v-show="isDropdownOpen" class="dropdown-menu">
          <div class="dropdown-arrow"></div>
          <div class="dropdown-content">
            <div class="user-info">
              <img :src="user.avatar" alt="" class="dropdown-avatar" />
              <div class="user-details">
                <div class="username">{{ user.username || '游客' }}</div>
                <div class="user-id">{{ user.userId ? 'ID: ' + user.userId : '' }}</div>
              </div>
            </div>
            <div class="dropdown-divider"></div>
            <ul>
              <li @click="goToProfile" class="dropdown-item">
                <i class="fa fa-user-circle-o"></i> 个人资料
              </li>
              <li @click="goToSettings" class="dropdown-item"><i class="fa fa-cog"></i> 设置</li>
              <li v-if="!userStore.user" @click="login" class="dropdown-item">
                <i class="fa fa-sign-out"></i> 登录
              </li>
              <li v-if="userStore.user" @click="logout" class="dropdown-item">
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

const isDarkMode = ref(false)
const isDropdownOpen = ref(false)
const userStore = useUserStore()

// 使用 userStore 中的用户数据
const user = ref(
  userStore.user || {
    avatar: YoyuEN,
    username: '游客',
    userId: '',
  },
)

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
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'dark') {
    isDarkMode.value = true
    document.body.classList.add('dark')
  }

  // 添加点击外部关闭下拉菜单的事件
  document.addEventListener('click', handleOutsideClick)
})

// 卸载时移除事件监听器
onUnmounted(() => {
  document.removeEventListener('click', handleOutsideClick)
})

// 获取用户信息
onMounted(async () => {
  try {
    const userId = userStore.user?.userId
    if (!userId) {
      console.warn('用户未登录或缺少 userId')
      return
    }

    const response = await getUserByUserId(userId)
    const userData = response.data

    if (userData) {
      user.value = userData
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
  }
})

// 监听 storage 事件，跨标签页同步用户信息
window.addEventListener('storage', () => {
  const storedUser = localStorage.getItem('user')
  if (storedUser) {
    user.value = JSON.parse(storedUser)
  }
})

// 主题切换
const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value
  document.body.classList.toggle('dark', isDarkMode.value)
  localStorage.setItem('theme', isDarkMode.value ? 'dark' : 'light')
}

// 下拉菜单切换
const toggleDropdown = (event) => {
  event.stopPropagation() // 阻止事件冒泡
  isDropdownOpen.value = !isDropdownOpen.value
}

// 点击外部关闭下拉菜单
const handleOutsideClick = (event) => {
  const dropdown = document.querySelector('.dropdown-menu')
  const avatar = document.querySelector('.user-avatar')

  if (dropdown && !dropdown.contains(event.target) && !avatar.contains(event.target)) {
    isDropdownOpen.value = false
  }
}

// 导航相关方法
const goToProfile = () => {
  isDropdownOpen.value = false
  if (userStore.user) {
    router.push('/user')
  } else {
    router.push('/login')
  }
}

const goToSettings = () => {
  isDropdownOpen.value = false
  router.push('/settings')
}

const login = () => {
  isDropdownOpen.value = false
  router.push('/login')
}

const logout = () => {
  isDropdownOpen.value = false
  userStore.clearUserInfo() // 清除 Vuex 或 Pinia 中的用户信息
  window.location.reload()
}
</script>

<style scoped>
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 32px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow:
    0 8px 32px rgba(0, 0, 0, 0.08),
    0 2px 8px rgba(0, 0, 0, 0.04),
    inset 0 1px 0 rgba(255, 255, 255, 0.8);
  z-index: 1000;
  position: fixed;
  width: 70%;
  height: 20px;
  left: 50%;
  transform: translateX(-50%);
  top: 0;
  border-radius: 0 0 20px 20px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.navbar:hover {
  box-shadow:
    0 12px 40px rgba(0, 0, 0, 0.12),
    0 4px 12px rgba(0, 0, 0, 0.06),
    inset 0 1px 0 rgba(255, 255, 255, 0.9);
}

/* Logo 样式 */
.logo {
  display: flex;
  align-items: center;
  gap: 8px;
}

.logo-text {
  font-weight: 800;
  font-size: 24px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  letter-spacing: -0.5px;
}

.logo-dot {
  width: 8px;
  height: 8px;
  background: linear-gradient(135deg, #ff6b6b, #ee5a24);
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%,
  100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.2);
    opacity: 0.8;
  }
}

.lm {
  display: flex;
  align-items: center;
  gap: 40px;
}

/* 导航菜单样式 */
.menu {
  display: flex;
  gap: 8px;
}

.nav-link {
  display: flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
  color: #64748b;
  font-weight: 500;
  font-size: 14px;
  padding: 10px 16px;
  border-radius: 12px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  overflow: hidden;
}

.nav-link::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  border-radius: 12px;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.nav-link:hover::before {
  opacity: 1;
}

.nav-link:hover {
  color: #475569;
  transform: translateY(-1px);
}

.nav-link.active {
  color: #1e293b;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.15), rgba(118, 75, 162, 0.15));
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.2);
}

.nav-icon {
  font-size: 16px;
  transition: transform 0.3s ease;
}

.nav-link:hover .nav-icon {
  transform: scale(1.1);
}

/* 右侧图标区域 */
.icons {
  display: flex;
  align-items: center;
  gap: 16px;
}

/* 主题切换按钮 */
.theme-btn {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
  border: 1px solid rgba(255, 255, 255, 0.3);
  border-radius: 12px;
  padding: 10px;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
  backdrop-filter: blur(10px);
}

.theme-btn:hover {
  transform: translateY(-2px) scale(1.05);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  background: linear-gradient(135deg, rgba(255, 255, 255, 1), rgba(248, 250, 252, 1));
}

.theme-icon {
  font-size: 18px;
  display: block;
  transition: transform 0.3s ease;
}

.theme-btn:hover .theme-icon {
  transform: rotate(15deg);
}

/* 头像容器 */
.avatar-container {
  position: relative;
}

.avatar-wrapper {
  position: relative;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.avatar-wrapper:hover {
  transform: scale(1.05);
}

.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid rgba(255, 255, 255, 0.8);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  transition: all 0.3s ease;
}

.avatar-status {
  position: absolute;
  bottom: 2px;
  right: 2px;
  width: 12px;
  height: 12px;
  background: linear-gradient(135deg, #10b981, #059669);
  border-radius: 50%;
  border: 2px solid white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.avatar-status.offline {
  background: linear-gradient(135deg, #9ca3af, #6b7280);
}

/* 下拉菜单样式 */
.dropdown-menu {
  position: absolute;
  top: calc(100% + 12px);
  right: 0;
  width: 260px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(248, 250, 252, 0.95));
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 16px;
  box-shadow:
    0 20px 60px rgba(0, 0, 0, 0.15),
    0 8px 24px rgba(0, 0, 0, 0.08),
    inset 0 1px 0 rgba(255, 255, 255, 0.8);
  z-index: 2000;
  animation: fadeInUp 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.dropdown-arrow {
  position: absolute;
  top: -8px;
  right: 16px;
  width: 16px;
  height: 16px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(248, 250, 252, 0.95));
  transform: rotate(45deg);
  border-left: 1px solid rgba(255, 255, 255, 0.2);
  border-top: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: -2px -2px 4px rgba(0, 0, 0, 0.05);
}

.dropdown-content {
  position: relative;
  z-index: 10;
}

.user-info {
  display: flex;
  align-items: center;
  padding: 20px;
}

.dropdown-avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  margin-right: 16px;
  border: 3px solid rgba(255, 255, 255, 0.8);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.user-details {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.username {
  font-weight: 600;
  color: #1e293b;
  font-size: 16px;
}

.user-id {
  color: #64748b;
  font-size: 13px;
  font-weight: 500;
}

.dropdown-divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, rgba(0, 0, 0, 0.08), transparent);
  margin: 0 16px;
}

.dropdown-content ul {
  list-style: none;
  padding: 8px 0;
  margin: 0;
}

.dropdown-item {
  padding: 12px 20px;
  cursor: pointer;
  font-size: 14px;
  color: #475569;
  display: flex;
  align-items: center;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.dropdown-item::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 0;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  transition: width 0.3s ease;
}

.dropdown-item:hover::before {
  width: 100%;
}

.dropdown-item:hover {
  color: #1e293b;
  background: rgba(102, 126, 234, 0.05);
  transform: translateX(4px);
}

.dropdown-item i {
  margin-right: 12px;
  width: 16px;
  text-align: center;
  color: #64748b;
  transition: color 0.3s ease;
}

.dropdown-item:hover i {
  color: #667eea;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(-20px) scale(0.95);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .navbar {
    width: 90%;
    padding: 12px 20px;
  }

  .lm {
    gap: 20px;
  }

  .menu {
    gap: 4px;
  }

  .nav-link {
    padding: 8px 12px;
    font-size: 13px;
  }

  .nav-icon {
    font-size: 14px;
  }

  .logo-text {
    font-size: 20px;
  }
}
</style>
