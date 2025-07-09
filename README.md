##  项目简介：Jank - 基于 AI 的个人分享博客

**Jank** 是一个基于 **Spring Boot 3.x** 与 **Vue 3.x** 技术栈开发的 **AI 辅助型个人分享博客系统**，致力于为用户打造一个集内容创作、智能问答与多模型调用于一体的现代化博客平台。

------

##  核心功能与技术点

- **后端技术栈**
  - 基于 **Spring Boot 3.x** 构建，结构清晰，易扩展，安全可靠。
  - 集成 **MyBatis-Plus**，简化数据库 CRUD 操作，提高开发效率。
  - 内置 **MinIO**，支持分布式对象存储，方便上传与管理图片、附件等多媒体资源。
  - 集成 **LangChain4j**，可快速对接多种大型语言模型（LLM），如 **DeepSeek**、**通义千问**、**OpenAI** 等，助力内容生成与智能对话。
- **前端技术栈**
  - 使用 **Vue 3.x** 与 **Element-UI** 实现响应式、现代化的前端界面。
  - 引入 **Pinia** 管理全局状态，支持用户信息、会话等数据的持久化存储，保证页面刷新后的状态一致性与良好的用户体验。
  - 模块化设计，支持多页面路由、动态加载与权限控制。

------

##  AI 加持

通过 **LangChain4j** 框架，Jank 可以与多种主流 AI 模型无缝对接，实现以下智能化功能：

- 智能撰写与润色：辅助用户生成博客摘要等。
- 在线智能问答：访客可通过 AI 模块与博客主进行互动，提升社区粘性。
- 多模型切换：支持根据使用场景选择不同的 LLM，如 DeepSeek 的长文本处理，通义千问的中文对话优化，OpenAI 的创意内容生成等。

------

##  适用场景

- 个人或团队搭建智能博客、自媒体发布平台
- 技术分享与在线知识库
- 集成 AI 内容生成与互动的示范项目
- AI 应用落地与二次开发的学习参考

------

##  主要特色

-  **前后端分离，易于扩展与部署**
- **支持多云/本地对象存储**
-  **灵活切换大模型供应商**
- **现代化前端 UI 与交互**
- **简洁易用的用户管理与权限控制**

## 开发指南

------

###  技术栈

- **后端语言**：Java 17
- **数据库**：
  - 关系型数据库：MySQL
  - 非关系型数据库：MongoDB
- **对象存储**：MinIO（用于本地分布式文件管理）
- **Node.js**：v20（前端运行环境）

------

### ⚙️ 前端启动

1. 进入前端项目根目录：

   ```
   复制编辑
   cd frontend
   ```

2. 安装依赖：

   ```
   复制编辑
   npm install
   ```

3. 启动开发环境：

   ```
   复制编辑
   npm run dev
   ```

   > 默认使用 Vite/webpack 启动，可根据实际配置调整。

------

###  ⚙️后端启动

1. 修改后端配置文件：
    打开 `application.properties`，填写 MinIO 本地分布式文件系统相关配置：

   ```application.properties
   properties复制编辑# MinIO 配置示例
   minio.endpoint=http://localhost:9000
   minio.access-key=your-access-key
   minio.secret-key=your-secret-key
   minio.bucket-name=your-bucket-name
   ```

   > 请根据你的本地或服务器 MinIO 部署情况，替换为实际值。

2. 启动后端服务：
    使用 IDE（如 IntelliJ IDEA）或命令行，运行 `BackendApplication` 主类：

   ```
   复制编辑
   ./mvnw spring-boot:run
   ```

   或使用 IDE 右键直接运行。

------

###  启动完成

- 前端默认运行在 `http://localhost:5173` （或根据 `vite.config.js` 中的端口配置）。
- 后端默认运行在 `http://localhost:9010/api`。

------

###  小提示

- 若需要连接远程或云端 MinIO，可在 `application.properties` 中配置公网地址及密钥信息。
- 启动前请确认：
  - 数据库已创建并正确连接；
  - MinIO 已运行且配置的桶（bucket）已创建；
  - 前端 `.env` 中的 API 接口地址与后端一致。

#### 项目演示

![首页.png](Image/%E9%A6%96%E9%A1%B5.png)
![帖子.png](Image/%E5%B8%96%E5%AD%90.png)
![发帖.png](Image/%E5%8F%91%E5%B8%96.png)
![说说.png](Image/%E8%AF%B4%E8%AF%B4.png)
![发说说.png](Image/%E5%8F%91%E8%AF%B4%E8%AF%B4.png)
![留言.png](Image/%E7%95%99%E8%A8%80.png)
![关于.png](Image/%E5%85%B3%E4%BA%8E.png)
![个人中心.png](Image/%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83.png)
![技术栈修改.png](Image/%E6%8A%80%E6%9C%AF%E6%A0%88%E4%BF%AE%E6%94%B9.png)
![个人资料设置.png](Image/%E4%B8%AA%E4%BA%BA%E8%B5%84%E6%96%99%E8%AE%BE%E7%BD%AE.png)
