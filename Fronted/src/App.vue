<template>
  <div id="app" class="main">
    <AppHeader />
    <router-view />
  </div>
</template>

<script setup>
import AppHeader from './components/AppHeader.vue'
</script>

<style>
.main {
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
}

#app {
  font-family: KaiTi, SimKai, 'Noto Serif SC', serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
  width: 85%;
  max-width: 1400px;
  margin: 0 auto;
}

.dark {
  background-color: #121212;
  color: #fff;
}

.dark .navbar {
  background-color: rgba(0, 0, 0, 0.8);
  border-bottom-color: rgba(255, 255, 255, 0.1);
  color: white;
}

.dark .menu a {
  color: #f0f0f0;
}



:root {
  --bg-color: #fff;
  --text-color: #333;
  --card-bg: #fff;
}

.dark {
  --bg-color: #000000;
  --text-color: #f0f0f0;
  --card-bg: #1e1e1e;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
}


.dark .card,
.dark-mode .card {
  background-color: #1e1e1e;
  border-color: #333;
  color: #f0f0f0;
}



.dark .post-body,
.dark .post-card,
.dark .post-author {
  background-color: #0a0a0a;
  color: #ffffff;
}

.dark .post-body h1,
.dark .post-body h2,
.dark .post-body h3,
.dark .post-author .author-name {
  color: #ffffff;
}

.dark .post-body a,
.dark .post-author a {
  color: #87ceeb;
}

.dark .post-body:hover,
.dark .post-card:hover,
.dark .post-author:hover {
  box-shadow: 0 4px 12px rgba(66, 66, 66, 0.25);
  border-color: #666; /* 悬浮时变为稍亮的灰色 */
}
</style>
