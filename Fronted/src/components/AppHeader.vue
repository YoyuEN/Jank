<template>
  <header class="navbar">
    <div class="logo">Jank</div>
    <nav class="menu">
      <router-link to="/" >首页</router-link>
      <router-link to="/posts" >文章</router-link>
      <router-link to="/say" >说说</router-link>
      <router-link to="/about" >关于</router-link>
    </nav>
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
  border-bottom: 1px solid #eee;
  background-color: #fff;
}

.logo {
  font-weight: bold;
  font-size: 18px;
}

.menu {
  display: flex;
  gap: 20px;
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
