# 社交平台前端项目

这是一个基于现代前端技术的社交平台前端项目，包含帖子、朋友圈、评论和用户管理等核心功能。

## 核心功能

- 用户认证与管理
- 帖子发布与管理
- 朋友圈动态展示
- 评论与互动
- 点赞功能

## 项目结构

```
src/
├── api/                  # API接口定义
│   ├── comment/          # 评论相关API
│   ├── moments/          # 朋友圈相关API
│   ├── posts/            # 帖子相关API
│   └── user/             # 用户相关API
├── assets/               # 静态资源
├── components/           # 公共组件
├── router/               # 路由配置
├── store/                # 状态管理
├── utils/                # 工具函数
│   └── request.js        # 请求封装
└── views/                # 页面组件
```

## 核心代码文件

1. `src/api/comment/comment.js` - 评论相关API
   - 获取评论列表
   - 提交评论
   - 点赞/取消点赞评论

2. `src/api/moments/moments.js` - 朋友圈相关API
   - 获取朋友圈列表
   - 发布/删除朋友圈
   - 点赞/取消点赞

3. `src/api/posts/posts.js` - 帖子相关API
   - 获取帖子列表
   - 创建/更新/删除帖子

4. `src/api/user/user.js` - 用户相关API
   - 用户认证
   - 用户信息管理

5. `src/utils/request.js` - 请求封装
   - 统一请求拦截
   - 错误处理
   - 响应处理

## 安装与运行

### 前置要求
- Node.js (建议v16+)
- npm/yarn

### 安装依赖
```bash
npm install
# 或
yarn install
```

### 开发模式
```bash
npm run dev
# 或
yarn dev
```

### 生产构建
```bash
npm run build
# 或
yarn build
```

## 技术栈

- Vue.js/React (根据实际框架调整)
- Axios
- Vuex/Redux (根据实际框架调整)
- Sass/Less (根据实际样式预处理器调整)

## 注意事项

1. 项目需要配合后端API服务使用
2. 开发前请配置好环境变量
3. API路径可能需要根据实际后端服务调整

## 贡献指南

1. Fork项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 发起Pull Request
