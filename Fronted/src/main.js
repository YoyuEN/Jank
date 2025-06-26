import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

// 引入 Element Plus 库
import ElementPlus from 'element-plus'
// 引入 Element Plus 默认样式
import 'element-plus/dist/index.css'

const app = createApp(App)
app.use(router)
app.mount('#app')
