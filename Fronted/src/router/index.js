import { createRouter, createWebHistory } from 'vue-router';
import PostList from '@/views/PostList.vue';
import LoginForm from '@/views/LoginForm.vue';
import Register from '@/views/Register.vue'
import MomentView from '@/views/MomentView.vue'
const routes = [
  {
    path: '/login',
    name: 'LoginForm',
    component: LoginForm
  },
  {
    path:'/register',
    name: 'Register',
    component: Register
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
    path: '/moments',
    name: 'Moments',
    component: MomentView
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
    path: '/publish',
    name: 'Publish',
    component: () => import('@/views/PublishPost.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
