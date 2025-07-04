import { createRouter, createWebHistory } from 'vue-router'
import PostList from '@/views/PostList.vue'
import LoginForm from '@/views/LoginForm.vue'
import Register from '@/views/Register.vue'
import MomentView from '@/views/MomentView.vue'
import PublishMoment from '@/views/PublishMoment.vue'

const routes = [
  {
    path: '/login',
    name: 'LoginForm',
    component: LoginForm,
  },
  {
    path: '/register',
    name: 'Register',
    component: Register,
  },
  {
    path: '/posts',
    name: 'PostList',
    component: PostList,
  },
  {
    path: '/posts/:postId',
    name: 'PostDetail',
    component: () => import('@/views/PostDetail.vue'),
  },
  {
    path: '/',
    redirect: '/home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/moments',
    name: 'Moments',
    component: MomentView,
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/about',
    name: 'AboutView',
    component: () => import('@/views/AboutView.vue'),
  },
  {
    path: '/settings',
    name: 'SettingS',
    component: () => import('@/views/UpdateUser.vue'),
  },
  {
    path: '/message',
    name: 'Message',
    component: () => import('@/views/MessageS.vue'),
  },
  {
    path: '/user',
    name: 'User',
    component: () => import('@/views/UserInformation.vue'),
  },
  {
    path: '/publishPost',
    name: 'PublishPost',
    component: () => import('@/views/PublishPost.vue'),
  },
  {
    path: '/publishMoment',
    name: 'PublishMoment',
    component: PublishMoment,
  },
  {
    path: '/chat',
    name: 'Chat',
    component: () => import('@/views/AIagent.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
