import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null, // 用户信息
    token: null, // 登录 token
    isAuthenticated: false, // 是否已认证
  }),
  actions: {
    setUserInfo(userData) {
      // 如果userData是一个对象，并且包含token属性
      if (userData && typeof userData === 'object') {
        const token = userData.token || '';
        const userId = userData.userId || userData.id || '';

        this.user = userData;
        this.token = token;
        this.isAuthenticated = !!token; // 只有当token存在时才设置为已认证

        // 持久化存储
        localStorage.setItem('user', JSON.stringify(userData));
        localStorage.setItem('token', token);
        localStorage.setItem('userId', userId);

        console.log('userStore - 设置用户信息:', { userData, token, userId });
      }
      // 兼容旧的调用方式：setUserInfo(userData, token)
      else {
        const token = arguments[1];
        this.user = userData;
        this.token = token;
        this.isAuthenticated = !!token;

        localStorage.setItem('user', JSON.stringify(userData));
        localStorage.setItem('token', token);

        // 尝试从userData中获取userId
        if (userData && userData.userId) {
          localStorage.setItem('userId', userData.userId);
        }

        console.log('userStore - 设置用户信息(旧方式):', { userData, token });
      }
    },
    clearUserInfo() {
      this.user = null
      this.token = null
      this.isAuthenticated = false
      localStorage.removeItem('user')
      localStorage.removeItem('token')
    },
    restoreFromLocalStorage() {
      const storedUser = localStorage.getItem('user')
      const storedToken = localStorage.getItem('token')
      const storedUserId = localStorage.getItem('userId')

      console.log('userStore - 从localStorage恢复:', {
        storedUser,
        storedToken,
        storedUserId
      });

      if (storedUser && storedToken) {
        try {
          const userData = JSON.parse(storedUser);

          // 确保userData中包含userId
          if (storedUserId && (!userData.userId || !userData.id)) {
            userData.userId = storedUserId;
          }

          this.user = userData;
          this.token = storedToken;
          this.isAuthenticated = true;

          console.log('userStore - 恢复成功:', {
            user: this.user,
            token: this.token,
            isAuthenticated: this.isAuthenticated
          });
        } catch (error) {
          console.error('userStore - 恢复用户信息失败:', error);
          this.clearUserInfo();
        }
      } else {
        console.log('userStore - 没有找到存储的用户信息');
      }
    }
  }
})
