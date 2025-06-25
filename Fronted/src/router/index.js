import { createRouter, createWebHistory } from 'vue-router';
import PostList from '@/views/PostList.vue';

const routes = [
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
