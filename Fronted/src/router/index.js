import { createRouter, createWebHistory } from 'vue-router';
import PostList from '@/views/PostList.vue';
import LoginForm from '@/views/LoginForm.vue';

const routes = [
  {
    path: '/login',
    name: 'LoginForm',
    component: LoginForm
  },
  {
    path: '/posts',
    name: 'PostList',
    component: PostList
  },
  {
    path: '/posts/:postId',
    name: 'PostDetail',
    component: () => import('@/views/PostDetail.vue')
  },
  {
    path: '/',
    redirect: '/home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/say',
    name: 'say',
    component: () => import('@/views/say.vue'),
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/About.vue'),
  },
  {
    path: '/message',
    name: 'Message',
    component: () => import('@/views/Message.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
