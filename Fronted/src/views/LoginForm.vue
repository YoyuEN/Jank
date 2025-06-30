<template>
  <div class="login-container">
    <div class="Tegra">
      <h1>登录账号</h1>
      <p>输入你的用户名和密码</p>
    </div>

    <div>
      <form @submit.prevent="handleLogin">
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
        <div class="big">
          <a href="/register" class="big2">注册?</a>
          <a href="#" class="big2">忘记密码?</a>
        </div>
        <button type="submit">登录</button>
      </form>
    </div>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
  </div>
</template>

<script>
import { getLogin } from '@/api/user/user.js'
import { useUserStore } from '@/store/userStore.js'

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
      if (!this.form.username || !this.form.password) {
        this.errorMessage = '用户名和密码不能为空'
        return
      }

      try {
        const response = await getLogin(this.form)
        // 处理登录成功
        if (response.code === 200 && response.data) {
          // 打印完整的响应数据，以便调试
          console.log('登录响应数据:', response.data);

          const userData = response.data;

          // 尝试从不同可能的字段名中获取用户信息
          const token = userData.token || userData.accessToken || '';
          const userId = userData.userId || userData.id || userData.user_id || '';
          const username = userData.username || userData.name || '';
          const avatar = userData.avatar || userData.avatarUrl || '';

          console.log('解析后的token:', token);
          console.log('解析后的userId:', userId);
          console.log('解析后的username:', username);
          console.log('解析后的avatar:', avatar);

          // 构建规范化的用户信息对象
          const normalizedUserData = {
            ...userData,
            token,
            userId,
            username,
            avatar,
            id: userId, // 为了兼容性，同时设置id字段
            name: username, // 为了兼容性，同时设置name字段
            avatarUrl: avatar // 为了兼容性，同时设置avatarUrl字段
          };

          console.log('规范化后的用户信息:', normalizedUserData);

          const userStore = useUserStore();

          // 更新全局状态
          userStore.setUserInfo(normalizedUserData);

          // 将完整的用户信息存储到localStorage
          localStorage.setItem('user', JSON.stringify(normalizedUserData));
          localStorage.setItem('token', token);
          localStorage.setItem('userId', userId);
          localStorage.setItem('username', username);
          localStorage.setItem('avatar', avatar);

          this.$router.push('/posts');
        } else {
          this.errorMessage = response.message || '登录失败，请重试';
        }
      } catch (error) {
        console.error('登录请求失败:', error)
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
  border-radius: 10px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
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
