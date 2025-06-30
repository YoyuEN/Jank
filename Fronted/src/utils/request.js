import axios from 'axios';

const service = axios.create({
  baseURL: '/api',
  timeout: 5000,
});

// 请求拦截器
service.interceptors.request.use(
  config => {
    // 从localStorage获取token
    const token = localStorage.getItem('token');
    if (token) {
      // 添加认证头
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  error => {
    console.error('请求配置错误:', error);
    return Promise.reject(error);
  }
);

// 响应拦截器
service.interceptors.response.use(
  response => {
    // 假设后端返回的结构是 { code: 200, message: '成功', data: ... }
    if (response.data.code === 200) {
      return Promise.resolve(response.data);
    } else {
      return Promise.reject(new Error(response.data.message || '请求失败'));
    }
  },
  error => {
    console.error('请求出错:', error);
    return Promise.reject(error);
  }
);

export default service;
