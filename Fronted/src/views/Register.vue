<template>
  <div class="login-container">
    <div class="Tegra">
      <h1>登录账号</h1>
      <p>输入你的用户名和密码</p>
    </div>

    <div>
      <form @submit.prevent="handleLogin">
        <div>
          <label for="username">用户昵称:</label>
          <input
            class="form-group"
            type="text"
            id="nickname"
            v-model="form.nickname"
            placeholder="请输入用户昵称"
          />
        </div>
        <div>
          <label for="username">邮箱:</label>
          <input
            class="form-group"
            type="text"
            id="email"
            v-model="form.email"
            placeholder="请输入邮箱"
          />
        </div>
        <div>
          <label for="username">用户名:</label>
          <input
            class="form-group"
            type="text"
            id="username"
            v-model="form.username"
            placeholder="请输入用户名"
          />
        </div>
        <div>
          <label for="password">密码:</label>
          <input
            class="form-group"
            type="password"
            id="password"
            v-model="form.password"
            placeholder="请输入密码"
          />
        </div>
        <div>
          <label for="password">确认密码:</label>
          <input
            class="form-group"
            type="password"
            id="checkPassword"
            v-model="form.checkPassword"
            placeholder="请输入密码"
          />
        </div>
        <div class="big">
          <a href="/login" class="big2">已有账户返回登录</a>
          <a href="#" class="big2">忘记密码?</a>
        </div>
        <button type="submit">注册</button>
      </form>
    </div>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
  </div>
</template>

<script>
import { getRegister } from '@/api/user/user.js'

export default {
  name: 'LoginForm',
  data() {
    return {
      //表单数据
      form: {},
      errorMessage: '',
    }
  },
  methods: {
    async handleLogin() {
      // 表单验证
      if (!this.form.username || !this.form.password|| !this.form.email) {
        this.errorMessage = '用户名和密码和邮箱不能为空'
        return
      }

      try {

        const response = await getRegister(this.form)

        // 处理登录成功
        if (response.code === 200) {
          // 存储token
          // localStorage.setItem('token', response.data.data.token)
          // 跳转到首页或其他页面
          this.$router.push('/login')
        } else {
          this.errorMessage = response.data.message || '注册失败，请重试'
        }
      } catch (error) {
        console.error('注册请求失败:', error)
        this.errorMessage = '服务器错误，请稍后再试'
      }
    },
  },
}
</script>

<style scoped>
.login-container {
  max-width: 500px;
  margin: 80px auto;
  padding: 30px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.big {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.big2 {
  color: #000; /* 黑色 */
  text-decoration: none; /* 可选：去除下划线 */
  font-size: 14px;
}

.Tegra {
  text-align: center;
  margin-bottom: 20px;
}

.Tegra h1 {
  font-size: 28px;
  color: #333;
  margin-bottom: 10px;
}

.Tegra p {
  font-size: 14px;
  color: #666;
}

form {
  display: flex;
  flex-direction: column;
}

.form-group {
  margin-bottom: 20px;
  position: relative;
  width: 93%;
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #555;
}

input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 16px;
  transition:
    border-color 0.3s ease,
    box-shadow 0.3s ease;
}

input:focus {
  border-color: #4caf50;
  box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
  outline: none;
}

button {
  width: 100%;
  padding: 12px;
  background-color: #111211;
  color: white;
  font-size: 16px;
  font-weight: bold;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #404341;
}

.error-message {
  color: #e74c3c;
  margin-top: 15px;
  text-align: center;
  font-size: 14px;
}
</style>
