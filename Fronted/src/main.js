import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import 'core-js/stable';
import 'regenerator-runtime/runtime';
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css';
import { useUserStore } from './store/userStore'

// 创建 Pinia 实例
const pinia = createPinia()
const app = createApp(App)

// 使用 Pinia 和 Router
app.use(pinia)
app.use(router)
app.use(ElementPlus);

// 从 localStorage 恢复用户状态
const userStore = useUserStore(pinia)
userStore.restoreFromLocalStorage()

app.mount('#app')
