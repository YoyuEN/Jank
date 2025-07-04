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
    console.log('Current token:', token); // 调试日志

    if (token) {
      // 添加认证头
      config.headers['Authorization'] = token.startsWith('Bearer ') ? token : `Bearer ${token}`;
      console.log('Request headers:', config.headers); // 调试日志
    } else {
      console.warn('No token found in localStorage'); // 调试日志
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
    console.log('响应数据:', response.data); // 添加日志记录

    // 检查响应数据格式
    if (!response.data) {
      console.error('响应数据为空');
      return Promise.reject(new Error('响应数据为空'));
    }

    // 假设后端返回的结构是 { code: 200, message: '成功', data: ... }
    // 但也处理其他可能的格式
    if (response.data.code === 200) {
      return Promise.resolve(response.data);
    } else if (response.status === 200) {
      // 如果HTTP状态是200，但没有code字段，可能是直接返回数据
      if (!response.data.hasOwnProperty('code')) {
        return Promise.resolve({
          code: 200,
          message: '成功',
          data: response.data
        });
      } else {
        console.error('响应code不是200:', response.data.code, '消息:', response.data.message);
        return Promise.reject(new Error(response.data.message || '请求失败'));
      }
    } else {
      console.error('响应状态码不是200:', response.status);
      return Promise.reject(new Error('请求失败，状态码: ' + response.status));
    }
  },
  error => {
    console.error('请求出错:', error);
    if (error.response) {
      console.error('错误响应状态:', error.response.status);
      console.error('错误响应数据:', error.response.data);
    } else if (error.request) {
      console.error('未收到响应:', error.request);
    } else {
      console.error('请求配置错误:', error.message);
    }
    return Promise.reject(error);
  }
);

export default service;
