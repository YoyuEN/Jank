import { createRouter, createWebHistory } from 'vue-router';
import PostList from '@/views/PostList.vue';

const routes = [
  { path: '/posts', name: 'PostList', component: PostList },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
