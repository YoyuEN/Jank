<template>
  <header class="navbar">
    <div class="lm">
      <div class="logo">Jank</div>
      <nav class="menu">
        <router-link to="/" >首页</router-link>
        <router-link to="/posts" >帖子</router-link>
        <router-link to="/say" >说说</router-link>
        <router-link to="/about" >关于</router-link>
      </nav>
    </div>
    <div class="icons">
      <button @click="toggleTheme">🌙</button>
      <button @click="goToProfile">👤</button>
    </div>
  </header>
</template>

<script setup>
const toggleTheme = () => {
  document.body.classList.toggle('dark');
};

const goToProfile = () => {
  alert('跳转到用户中心（可替换为路由）');
};
</script>

<style scoped>
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
