<template>
  <div class="login-container">
    <div class="login-card">
      <!-- 左侧装饰图形 -->
      <div class="decoration">
        <div class="circle circle-1"></div>
        <div class="circle circle-2"></div>
        <div class="shape"></div>
      </div>
      
      <!-- 右侧表单区域 -->
      <div class="form-section">
        <h1 class="title">欢迎回来</h1>
        <p class="subtitle">请登录您的账户</p>
        
        <form @submit.prevent="handleLogin">
          <div class="input-group">
            <label for="email">电子邮箱</label>
            <input 
              id="email" 
              type="email" 
              v-model="email" 
              placeholder="输入您的邮箱"
              required
            >
            <span class="icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#7e8aa1" stroke-width="2">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                <polyline points="22,6 12,13 2,6"></polyline>
              </svg>
            </span>
          </div>
          
          <div class="input-group">
            <label for="password">密码</label>
            <input 
              id="password" 
              :type="showPassword ? 'text' : 'password'" 
              v-model="password" 
              placeholder="输入您的密码"
              required
            >
            <span class="icon" @click="showPassword = !showPassword">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#7e8aa1" stroke-width="2">
                <path v-if="showPassword" d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                <path v-else d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                <circle cx="12" cy="12" r="3"></circle>
              </svg>
            </span>
          </div>
          
          <div class="options">
            <label class="remember">
              <input type="checkbox" v-model="rememberMe">
              <span class="checkmark"></span>
              记住我
            </label>
            <router-link to="/forgot-password" class="forgot-link">忘记密码?</router-link>
          </div>
          
          <button class="login-btn" type="submit">
            登录
            <span class="btn-arrow">→</span>
          </button>
        </form>
        
        <div class="divider">
          <span>或</span>
        </div>
        
        <div class="social-login">
          <button class="social-btn google">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24">
              <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"></path>
              <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"></path>
              <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"></path>
              <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"></path>
            </svg>
            Google
          </button>
          <button class="social-btn github">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24">
              <path fill="#333" d="M12 .3a12 12 0 0 0-3.8 23.4c.6.1.8-.3.8-.6v-2c-3.3.7-4-1.6-4-1.6-.6-1.4-1.4-1.8-1.4-1.8-1-.7.1-.7.1-.7 1.2 0 1.9 1.2 1.9 1.2 1 1.8 2.8 1.3 3.5 1 .1-.8.4-1.3.7-1.6-2.7-.3-5.5-1.3-5.5-6 0-1.2.5-2.3 1.3-3.1-.2-.4-.6-1.6 0-3.2 0 0 1-.3 3.4 1.2a11.5 11.5 0 0 1 6 0c2.3-1.5 3.3-1.2 3.3-1.2.6 1.6.2 2.8 0 3.2.9.8 1.3 1.9 1.3 3.2 0 4.6-2.8 5.6-5.5 5.9.5.4.9 1 .9 2.2v3.3c0 .3.1.7.8.6A12 12 0 0 0 12 .3z"></path>
            </svg>
            GitHub
          </button>
        </div>
        
        <p class="signup-link">
          还没有账户? <router-link to="/signup">立即注册</router-link>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginPage',
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false,
      showPassword: false
    }
  },
  methods: {
    handleLogin() {
      // 这里添加实际的登录逻辑
      console.log('登录信息:', {
        email: this.email,
        password: this.password,
        rememberMe: this.rememberMe
      })
      
      // 示例：登录成功后跳转
      // this.$router.push('/dashboard')
    }
  }
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #6e8efb, #a777e3);
  padding: 20px;
}

.login-card {
  display: flex;
  width: 900px;
  height: 700px;
  background: white;
  border-radius: 20px;
  box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  position: relative;
}

.decoration {
  flex: 1;
  background: linear-gradient(160deg, #6e8efb, #a777e3);
  position: relative;
  overflow: hidden;
}

.circle {
  position: absolute;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.1);
}

.circle-1 {
  width: 300px;
  height: 300px;
  top: -100px;
  left: -100px;
}

.circle-2 {
  width: 200px;
  height: 200px;
  bottom: -50px;
  right: -50px;
}

.shape {
  position: absolute;
  width: 120%;
  height: 80px;
  background: rgba(255, 255, 255, 0.15);
  bottom: 40%;
  left: -10%;
  transform: rotate(-5deg);
}

.form-section {
  flex: 1;
  padding: 50px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.title {
  font-size: 32px;
  font-weight: 700;
  color: #2d3748;
  margin-bottom: 10px;
}

.subtitle {
  color: #718096;
  margin-bottom: 40px;
  font-size: 16px;
}

.input-group {
  position: relative;
  margin-bottom: 25px;
}

.input-group label {
  display: block;
  margin-bottom: 8px;
  color: #4a5568;
  font-weight: 500;
  font-size: 14px;
}

.input-group input {
  width: 100%;
  padding: 15px 15px 15px 45px;
  border: 1px solid #e2e8f0;
  border-radius: 10px;
  font-size: 16px;
  transition: all 0.3s ease;
  box-sizing: border-box;
}

.input-group input:focus {
  border-color: #a777e3;
  box-shadow: 0 0 0 3px rgba(167, 119, 227, 0.1);
  outline: none;
}

.icon {
  position: absolute;
  left: 15px;
  bottom: 15px;
  cursor: pointer;
}

.options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
  font-size: 14px;
}

.remember {
  display: flex;
  align-items: center;
  color: #4a5568;
  cursor: pointer;
}

.remember input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.checkmark {
  position: relative;
  height: 18px;
  width: 18px;
  background-color: #fff;
  border: 1px solid #cbd5e0;
  border-radius: 4px;
  margin-right: 10px;
}

.remember input:checked ~ .checkmark {
  background-color: #a777e3;
  border-color: #a777e3;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
  left: 6px;
  top: 2px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}

.remember input:checked ~ .checkmark:after {
  display: block;
}

.forgot-link {
  color: #6e8efb;
  text-decoration: none;
  transition: color 0.3s;
}

.forgot-link:hover {
  color: #a777e3;
  text-decoration: underline;
}

.login-btn {
  width: 100%;
  padding: 16px;
  background: linear-gradient(to right, #6e8efb, #a777e3);
  color: white;
  border: none;
  border-radius: 10px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 15px rgba(110, 142, 251, 0.4);
}

.btn-arrow {
  margin-left: 10px;
  font-size: 18px;
  transition: transform 0.3s;
}

.login-btn:hover .btn-arrow {
  transform: translateX(3px);
}

.divider {
  display: flex;
  align-items: center;
  margin: 30px 0;
}

.divider::before,
.divider::after {
  content: "";
  flex: 1;
  border-bottom: 1px solid #e2e8f0;
}

.divider span {
  padding: 0 15px;
  color: #718096;
  font-size: 14px;
}

.social-login {
  display: flex;
  gap: 15px;
  margin-bottom: 25px;
}

.social-btn {
  flex: 1;
  padding: 12px;
  border-radius: 8px;
  border: 1px solid #e2e8f0;
  background: white;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.social-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}

.social-btn.google:hover {
  border-color: #4285F4;
  background: rgba(66, 133, 244, 0.05);
}

.social-btn.github:hover {
  border-color: #333;
  background: rgba(51, 51, 51, 0.05);
}

.signup-link {
  text-align: center;
  color: #718096;
  font-size: 14px;
}

.signup-link a {
  color: #6e8efb;
  text-decoration: none;
  font-weight: 500;
}

.signup-link a:hover {
  text-decoration: underline;
}

/* 响应式设计 */
@media (max-width: 950px) {
  .login-card {
    width: 700px;
  }
}

@media (max-width: 768px) {
  .login-card {
    flex-direction: column;
    height: auto;
    width: 90%;
  }
  
  .decoration {
    height: 150px;
    width: 100%;
  }
  
  .form-section {
    padding: 30px;
  }
}
</style>