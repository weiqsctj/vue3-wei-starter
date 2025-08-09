// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router';

// 引入 Login 组件
import Login from '../views/Login.vue';

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  // 其他页面可以继续添加
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL), // Vite 用法
  routes,
});

export default router;