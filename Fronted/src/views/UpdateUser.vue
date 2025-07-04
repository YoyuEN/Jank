<template>
  <div class="update-user-container">
    <div class="user-card">
      <div class="form-layout">
        <!-- 左侧：头像上传 -->
        <div class="avatar-section">
          <h3 class="section-title">头像设置</h3>
          <el-upload
            class="avatar-uploader"
            action="#"
            :show-file-list="false"
            :before-upload="beforeAvatarUpload"
            :http-request="handleAvatarUpload"
          >
            <div class="avatar-container">
              <img v-if="userForm.avatar" :src="userForm.avatar" class="avatar" />
              <div v-else class="avatar-placeholder">
                <el-icon class="avatar-uploader-icon">
                  <Plus />
                </el-icon>
                <span class="upload-text">点击上传头像</span>
              </div>
              <div class="avatar-overlay">
                <span class="overlay-text">更换头像</span>
              </div>
            </div>
          </el-upload>
        </div>

        <!-- 右侧：用户信息表单 -->
        <div class="form-section">
          <h3 class="section-title">基本信息</h3>

          <el-form
            :model="userForm"
            :rules="rules"
            ref="userFormRef"
            label-width="100px"
            class="user-form"
          >
            <el-form-item label="昵称" prop="nickname">
              <el-input
                v-model="userForm.nickname"
                placeholder="请输入昵称"
                class="custom-input"
              ></el-input>
            </el-form-item>

            <el-form-item label="邮箱" prop="email">
              <el-input
                v-model="userForm.email"
                placeholder="请输入邮箱"
                class="custom-input"
              ></el-input>
            </el-form-item>

            <el-form-item label="用户名" prop="username">
              <el-input
                v-model="userForm.username"
                placeholder="请输入用户名"
                class="custom-input"
              ></el-input>
            </el-form-item>

            <el-form-item label="所在地区" prop="address">
              <el-cascader
                v-model="userForm.address"
                :options="addressOptions"
                :props="addressProps"
                @change="handleAddressChange"
                placeholder="请选择所在地区"
                clearable
                class="custom-cascader"
              >
              </el-cascader>
            </el-form-item>
          </el-form>
        </div>
      </div>

      <!-- 修改密码折叠面板 -->
      <div class="password-section">
        <el-collapse v-model="activeCollapse" class="password-collapse">
          <el-collapse-item title="修改密码" name="password">
            <template #title>
              <div class="collapse-title">
                <span class="title-text">修改密码</span>
              </div>
            </template>

            <el-form-item label="原密码" prop="oldPassword">
              <el-input
                v-model="userForm.oldPassword"
                type="password"
                placeholder="请输入原密码"
                class="custom-input"
              >
              </el-input>
            </el-form-item>

            <el-form-item label="新密码" prop="newPassword">
              <el-input
                v-model="userForm.newPassword"
                type="password"
                placeholder="请输入新密码"
                class="custom-input"
              >
              </el-input>
            </el-form-item>

            <el-form-item label="确认密码" prop="confirmPassword">
              <el-input
                v-model="userForm.confirmPassword"
                type="password"
                placeholder="请确认新密码"
                class="custom-input"
              >
              </el-input>
            </el-form-item>
          </el-collapse-item>
        </el-collapse>
      </div>

      <!-- 提交按钮 -->
      <div class="form-actions">
        <el-button type="primary" @click="submitForm" class="submit-btn">
          <span class="btn-icon">💾</span>
          保存修改
        </el-button>
        <el-button @click="resetForm" class="reset-btn">
          <span class="btn-icon">🔄</span>
          重置
        </el-button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Plus } from '@element-plus/icons-vue'
import { getAddressById, getAddress } from '@/api/address/address.js'
import { updateUser } from '@/api/user/user.js'
import { useUserStore } from '@/store/userStore'
import { useRouter } from 'vue-router'
import { watchEffect } from 'vue'
const router = useRouter()
// 表单引用
const userFormRef = ref(null)

// 折叠面板激活项
const activeCollapse = ref([])
const userStore = useUserStore()
// // 使用 userStore 中的用户数据
// const user = ref(
//     userStore.user || {
//       userId: '',
//     },
// )
// // 监听 store 的变化（响应式更新头像）
// watchEffect(() => {
//   if (userStore.user) {
//     user.value = userStore.user
//   }
// })
// 表单数据
const userForm = reactive({
  userId: '',
  avatar: '',
  avatar1: '',
  nickname: '',
  email: '',
  username: '',
  address: [],
  oldPassword: '',
  newPassword: '',
  confirmPassword: '',
})

watchEffect(() => {
  console.log('地址路径更新为:', userForm.address)
})

// 表单验证规则
const rules = reactive({
  nickname: [
    { required: true, message: '请输入昵称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' },
  ],
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' },
  ],
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' },
  ],
  address: [{ required: true, message: '请选择所在地区', trigger: 'change' }],
  oldPassword: [{ required: true, message: '请输入原密码', trigger: 'blur' }],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能小于6位', trigger: 'blur' },
  ],
  confirmPassword: [
    { required: true, message: '请确认新密码', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (value !== userForm.newPassword) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur',
    },
  ],
})

// 地址选择器配置
const addressOptions = ref([])
const addressProps = {
  value: 'addressId',
  label: 'address',
  children: 'children',
  checkStrictly: true, // 允许选择任何一级
  emitPath: true,
  expandTrigger: 'hover',
  lazy: true,
  lazyLoad: async (node, resolve) => {
    const { level, value } = node

    try {
      let response
      if (level === 0) {
        // 加载第一层级
        response = await getAddress()
      } else {
        // 加载子级
        response = await getAddressById(value)
      }

      if (
        response &&
        response.data &&
        (Array.isArray(response.data) ? response.data.length > 0 : true)
      ) {
        const data = Array.isArray(response.data) ? response.data : [response.data]

        // 检查是否有子节点
        const nodes = await Promise.all(
          data.map(async (item) => {
            // 尝试获取子节点，判断是否为叶子节点
            try {
              const childResponse = await getAddressById(item.addressId)
              if (!childResponse.data) {
                return
              }
              const hasChildren =
                childResponse &&
                childResponse.data &&
                (Array.isArray(childResponse.data) ? childResponse.data.length > 0 : true)

              return {
                ...item,
                leaf: !hasChildren, // 如果没有子节点，则标记为叶子节点
              }
            } catch (error) {
              console.error(`检查节点 ${item.addressId} 的子节点失败:`, error)
              return {
                ...item,
                leaf: true, // 出错时默认为叶子节点
              }
            }
          }),
        )

        resolve(nodes)
      } else {
        // 如果没有数据，则表示是叶子节点
        resolve([])
      }
    } catch (error) {
      console.error('加载地址数据失败:', error)
      resolve([])
    }
  },
}

// 处理地址选择变化
const handleAddressChange = async (value) => {
  if (value && value.length > 0) {
    // 获取最后选择的地址ID
    const addressId = value[value.length - 1]
    console.log('选中的地址路径:', value)
    console.log('最终选中的addressId:', addressId)
  }
}

// 头像上传前的验证
const beforeAvatarUpload = (file) => {
  const isJPG = file.type === 'image/jpeg' || file.type === 'image/png'
  const isLt2M = file.size / 1024 / 1024 < 2

  if (!isJPG) {
    ElMessage.error('头像只能是 JPG 或 PNG 格式!')
  }
  if (!isLt2M) {
    ElMessage.error('头像大小不能超过 2MB!')
  }
  return isJPG && isLt2M
}

// 处理头像上传
const handleAvatarUpload = (options) => {
  const { file } = options
  userForm.avatar = file
  userForm.avatar1 = file
  const reader = new FileReader()
  reader.readAsDataURL(options.file)
  reader.onload = () => {
    userForm.avatar = reader.result
  }
}

// 提交表单
const submitForm = async () => {
  if (!userFormRef.value) return
  userForm.avatar = userForm.avatar1
  const formData = new FormData()
  formData.append('userId', userStore.user.userId)
  formData.append('avatar', userForm.avatar)
  formData.append('nickname', userForm.nickname)
  formData.append('email', userForm.email)
  formData.append('username', userForm.username)
  formData.append('address', userForm.address)
  formData.append('oldPassword', userForm.oldPassword)
  formData.append('newPassword', userForm.newPassword)
  formData.append('confirmPassword', userForm.confirmPassword)

  const response = await updateUser(formData)
  console.log('提交的用户数据:', userStore.user)
  if (response.code === 200) {
    // 这里应该调用实际的保存API
    ElMessage.success('保存成功')
    userStore.setUserInfo(response.data)
    await router.push('/posts')
  } else {
    ElMessage.error('保存失败')
  }
}

// 重置表单
const resetForm = () => {
  if (userFormRef.value) {
    userFormRef.value.resetFields()
  }
}

// 获取用户信息并填充表单
const getUserInfo = async () => {
  try {
    // 正确获取用户信息
    const userData = useUserStore().user

    if (userData) {
      console.log('获取到用户数据:', userData)
      // 填充表单数据
      userForm.nickname = userData.nickname || ''
      userForm.username = userData.username || ''
      userForm.email = userData.email || ''
      userForm.avatar = userData.avatar || ''
      userForm.address = userData.address || ''

      // 如果有地址信息，设置地址
      if (userData.addressId) {
        try {
          const addressResponse = await getAddressById(userData.addressId)
          console.log('获取到用户地址详情:', addressResponse)

          if (addressResponse && addressResponse.data) {
            // 构建完整的地址路径
            await buildAddressPath(addressResponse.data)
          }
        } catch (error) {
          console.error('获取用户地址详情失败:', error)
        }
      }
    } else {
      console.warn('未获取到用户数据')
    }
  } catch (error) {
    ElMessage.error('获取用户信息失败')
    console.error('获取用户信息失败:', error)
  }
}

// 构建地址路径
const buildAddressPath = async (addressData) => {
  try {
    const addressPath = []
    let currentAddress = addressData

    // 从当前地址开始，向上查找所有父级地址
    while (currentAddress && currentAddress.addressId) {
      addressPath.unshift(currentAddress.addressId)

      if (currentAddress.pid && currentAddress.pid !== '0') {
        try {
          const parentResponse = await getAddressById(currentAddress.pid)
          if (parentResponse && parentResponse.data) {
            currentAddress = parentResponse.data
          } else {
            break
          }
        } catch (error) {
          console.error('获取父级地址失败:', error)
          break
        }
      } else {
        break
      }
    }

    console.log('构建的地址路径:', addressPath)

    // 设置地址路径前确保所有必要的选项都已加载
    if (addressPath.length > 0) {
      // 延迟设置地址值，确保级联选择器已完成初始化
      setTimeout(() => {
        userForm.address = addressPath
      }, 100)
    }
  } catch (error) {
    console.error('构建地址路径失败:', error)
  }
}

// 页面加载时获取地址数据和用户信息
onMounted(async () => {
  if (!userStore.user || !userStore.user.userId) {
    ElMessage.error('用户信息缺失，请重新登录')
    await router.push('/login')
    return
  }
  await getUserInfo()
})
</script>

<style scoped>
.update-user-container {
  min-height: 80vh;
  padding: 40px 20px;
  margin-top: 60px;
}

/* 页面头部 */
.page-header {
  text-align: center;
  margin-bottom: 40px;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.page-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 12px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.page-subtitle {
  font-size: 1.1rem;
  color: #64748b;
  font-weight: 500;
  margin: 0;
}

/* 用户卡片 */
.user-card {
  max-width: 800px;
  margin: 0 auto;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-radius: 24px;
  box-shadow:
    0 20px 60px rgba(0, 0, 0, 0.1),
    0 8px 24px rgba(0, 0, 0, 0.06),
    inset 0 1px 0 rgba(255, 255, 255, 0.8);
  border: 1px solid rgba(255, 255, 255, 0.2);
  overflow: hidden;
}

/* 卡片头部 */
.card-header {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  padding: 32px;
  border-bottom: 1px solid rgba(102, 126, 234, 0.1);
}

.header-content {
  display: flex;
  align-items: center;
  gap: 20px;
}

.header-icon {
  font-size: 2.5rem;
  background: linear-gradient(135deg, #667eea, #764ba2);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.header-text h2 {
  font-size: 1.5rem;
  font-weight: 600;
  color: #1e293b;
  margin: 0 0 4px 0;
}

.header-text p {
  color: #64748b;
  margin: 0;
  font-size: 0.95rem;
}

/* 表单布局 */
.form-layout {
  display: flex;
  gap: 40px;
  padding: 32px;
  align-items: flex-start;
}

.avatar-section {
  flex: 0 0 300px;
  text-align: center;
}

.form-section {
  flex: 1;
}

/* 表单样式 */
.user-form {
  padding: 0;
}

.section-title {
  font-size: 1.2rem;
  font-weight: 600;
  color: #1e293b;
  margin-bottom: 20px;
  padding-bottom: 8px;
  border-bottom: 2px solid rgba(102, 126, 234, 0.1);
}

/* 头像上传区域 */
.avatar-section {
  margin-bottom: 32px;
}

.avatar-uploader {
  text-align: center;
}

.avatar-container {
  position: relative;
  width: 180px;
  height: 180px;
  margin: 0 auto;
  border-radius: 50%;
  overflow: hidden;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.avatar-container:hover {
  transform: scale(1.02);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50%;
}

.avatar-placeholder {
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border: 2px dashed rgba(102, 126, 234, 0.3);
  border-radius: 50%;
  transition: all 0.3s ease;
}

.avatar-container:hover .avatar-placeholder {
  border-color: #667eea;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.15), rgba(118, 75, 162, 0.15));
}

.avatar-uploader-icon {
  font-size: 2rem;
  color: #667eea;
  margin-bottom: 8px;
}

.upload-text {
  font-size: 0.9rem;
  color: #64748b;
  font-weight: 500;
}

.avatar-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s ease;
  border-radius: 50%;
}

.avatar-container:hover .avatar-overlay {
  opacity: 1;
}

.overlay-text {
  color: white;
  font-weight: 600;
  font-size: 0.9rem;
}

/* 自定义输入框样式 */
.custom-input :deep(.el-input__wrapper) {
  background: rgba(255, 255, 255, 0.8);
  border: 1.5px solid rgba(102, 126, 234, 0.1);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.03);
  transition: all 0.3s ease;
}

.custom-input :deep(.el-input__wrapper:hover) {
  border-color: rgba(102, 126, 234, 0.3);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.08);
}

.custom-input :deep(.el-input__wrapper.is-focus) {
  border-color: #667eea;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.custom-input :deep(.el-input__inner) {
  color: #1e293b;
  font-weight: 500;
}

.custom-input :deep(.el-input__inner::placeholder) {
  color: #94a3b8;
}

/* 级联选择器样式 */
.custom-cascader :deep(.el-cascader) {
  width: 100%;
}

.custom-cascader :deep(.el-input__wrapper) {
  background: rgba(255, 255, 255, 0.8);
  border: 1.5px solid rgba(102, 126, 234, 0.1);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.03);
  transition: all 0.3s ease;
}

.custom-cascader :deep(.el-input__wrapper:hover) {
  border-color: rgba(102, 126, 234, 0.3);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.08);
}

/* 密码部分样式 */
.password-section {
  padding: 0 32px 32px;
}

/* 折叠面板样式 */
.password-collapse :deep(.el-collapse) {
  border: none;
}

.password-collapse :deep(.el-collapse-item__header) {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
  border: 1px solid rgba(102, 126, 234, 0.1);
  border-radius: 12px;
  padding: 16px 20px;
  font-weight: 600;
  color: #1e293b;
  transition: all 0.3s ease;
}

.password-collapse :deep(.el-collapse-item__header:hover) {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  border-color: rgba(102, 126, 234, 0.2);
}

.password-collapse :deep(.el-collapse-item__content) {
  padding: 20px;
  background: rgba(255, 255, 255, 0.5);
  border: 1px solid rgba(102, 126, 234, 0.1);
  border-top: none;
  border-radius: 0 0 12px 12px;
}

.collapse-title {
  display: flex;
  align-items: center;
  gap: 12px;
}

.title-text {
  font-weight: 600;
}

/* 表单操作按钮 */
.form-actions {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin: 20px auto;
  padding-top: 32px;
  border-top: 1px solid rgba(102, 126, 234, 0.1);
}

.submit-btn {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  border-radius: 12px;
  padding: 12px 32px;
  font-weight: 600;
  font-size: 1rem;
  color: white;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.2);
}

.submit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(102, 126, 234, 0.3);
}

.reset-btn {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
  border: 1.5px solid rgba(102, 126, 234, 0.2);
  border-radius: 12px;
  padding: 12px 32px;
  font-weight: 600;
  font-size: 1rem;
  color: #64748b;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}

.reset-btn:hover {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
  border-color: rgba(102, 126, 234, 0.3);
  color: #1e293b;
  transform: translateY(-1px);
}

.btn-icon {
  margin-right: 8px;
  font-size: 1.1rem;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .update-user-container {
    padding: 20px 16px;
  }

  .user-card {
    border-radius: 16px;
  }

  .form-layout {
    flex-direction: column;
    gap: 24px;
    padding: 24px 20px;
  }

  .avatar-section {
    flex: none;
    width: 100%;
  }

  .avatar-container {
    width: 140px;
    height: 140px;
  }

  .password-section {
    padding: 0 20px 24px;
  }

  .form-actions {
    flex-direction: column;
    gap: 12px;
  }

  .submit-btn,
  .reset-btn {
    width: 100%;
    padding: 14px 24px;
  }
}

@media (max-width: 480px) {
  .form-layout {
    padding: 20px 16px;
    gap: 20px;
  }

  .avatar-container {
    width: 120px;
    height: 120px;
  }

  .avatar-uploader-icon {
    font-size: 1.5rem;
  }

  .upload-text {
    font-size: 0.8rem;
  }

  .password-section {
    padding: 0 16px 20px;
  }
}
</style>
