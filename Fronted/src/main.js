import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'

// 创建 Pinia 实例
const pinia = createPinia()
const app = createApp(App)

// 使用 Pinia 和 Router
app.use(pinia)
app.use(router)
app.mount('#app')
