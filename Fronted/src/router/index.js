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
    redirect: '/H'
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
