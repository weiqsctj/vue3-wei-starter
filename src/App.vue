<!-- src/App.vue -->
<template>
  <div id="app">
    <!-- 导航栏 -->
    <nav class="navbar">
      <div class="nav-container">
        <router-link to="/" class="nav-logo">
          Logo
        </router-link>

        <ul class="nav-menu">
          <li class="nav-item">
            <router-link 
              to="/" 
              class="nav-link" 
              active-class="active"
            >
              首页
            </router-link>
          </li>
          <li class="nav-item">
            <router-link 
              to="/login" 
              class="nav-link" 
              active-class="active"
            >
              登录
            </router-link>
          </li>
          <!-- 可以继续添加其他页面 -->
        </ul>
      </div>
    </nav>

    <!-- 页面内容 -->
    <div class="main-content">
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style scoped>
#app {
  min-height: 100vh;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f7f9fc;
  color: #333;
}

/* 导航栏样式 */
.navbar {
  background: linear-gradient(135deg, #667eea, #764ba2);
  padding: 0;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 100;
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 60px;
}

.nav-logo {
  font-size: 24px;
  font-weight: 700;
  color: white;
  text-decoration: none;
  letter-spacing: 1px;
}

.nav-menu {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  gap: 2rem;
}

.nav-link {
  color: rgba(255, 255, 255, 0.85);
  text-decoration: none;
  font-weight: 500;
  font-size: 16px;
  padding: 8px 12px;
  border-radius: 6px;
  transition: all 0.3s ease;
}

.nav-link:hover {
  color: white;
  background: rgba(255, 255, 255, 0.2);
}

.nav-link.active {
  color: white;
  background: rgba(255, 255, 255, 0.3);
  font-weight: 600;
}

/* 主内容区域 */
.main-content {
  /* max-width: 1200px; */
  margin: 20px auto;
  /* padding: 20px; */
  flex: 1;
}

/* 响应式：移动端适配 */
@media (max-width: 768px) {
  .nav-container {
    flex-direction: column;
    height: auto;
    padding: 15px 20px;
  }

  .nav-menu {
    flex-direction: row;
    gap: 1rem;
    margin-top: 10px;
  }

  .nav-link {
    font-size: 14px;
    padding: 6px 10px;
  }

.main-content {
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
  flex: 1;
}
}
</style>