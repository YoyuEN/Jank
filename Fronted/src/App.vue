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
</style>
