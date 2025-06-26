import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null, // 用户信息
    token: null, // 登录 token
    isAuthenticated: false, // 是否已认证
  }),
  actions: {
    setUserInfo(userData, token) {
      this.user = userData
      this.token = token
      this.isAuthenticated = true
      // 可选：持久化存储
      localStorage.setItem('user', JSON.stringify(userData))
      localStorage.setItem('token', token)
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
      if (storedUser && storedToken) {
        this.user = JSON.parse(storedUser)
        this.token = storedToken
        this.isAuthenticated = true
      }
    }
  }
})
