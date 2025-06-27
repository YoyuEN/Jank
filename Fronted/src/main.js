import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css';

// 创建 Pinia 实例
const pinia = createPinia()
const app = createApp(App)

// 使用 Pinia 和 Router
app.use(pinia)
app.use(router)
app.use(ElementPlus);
app.mount('#app')
