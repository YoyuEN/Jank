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
    redirect: '/home',
    component: () => import('@/views/Home.vue'),
  },
  {
    path: '/say',
    name: 'say',
    component: () => import('@/views/say.vue'),
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import('@/views/Home.vue'),
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/About.vue'),
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
