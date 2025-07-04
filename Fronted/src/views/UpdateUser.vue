<template>
  <div class="update-user-container">
    <el-card class="user-card">
      <template #header>
        <div class="card-header">
          <span>个人信息设置</span>
        </div>
      </template>

      <el-form :model="userForm" :rules="rules" ref="userFormRef" label-width="100px">
        <!-- 头像上传 -->
        <el-form-item label="头像" prop="avatar">
          <el-upload
            class="avatar-uploader"
            action="#"
            :show-file-list="false"
            :before-upload="beforeAvatarUpload"
            :http-request="handleAvatarUpload"
          >
            <img v-if="userForm.avatar" :src="userForm.avatar" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>

        <!-- 用户昵称 -->
        <el-form-item label="昵称" prop="nickname">
          <el-input v-model="userForm.nickname" placeholder="请输入昵称"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="userForm.email" placeholder="请输入邮箱"></el-input>
        </el-form-item>

        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input v-model="userForm.username" placeholder="请输入用户名"></el-input>
        </el-form-item>

        <!-- 地址选择 -->
        <el-form-item label="所在地区" prop="address">
          <el-cascader
            v-model="userForm.address"
            :options="addressOptions"
            :props="addressProps"
            @change="handleAddressChange"
            placeholder="请选择所在地区"
          >
          </el-cascader>
        </el-form-item>

        <!-- 修改密码折叠面板 -->
        <el-collapse v-model="activeCollapse">
          <el-collapse-item title="修改密码" name="password">
            <el-form-item label="原密码" prop="oldPassword">
              <el-input v-model="userForm.oldPassword" type="password" placeholder="请输入原密码">
              </el-input>
            </el-form-item>
            <el-form-item label="新密码" prop="newPassword">
              <el-input v-model="userForm.newPassword" type="password" placeholder="请输入新密码">
              </el-input>
            </el-form-item>
            <el-form-item label="确认密码" prop="confirmPassword">
              <el-input
                v-model="userForm.confirmPassword"
                type="password"
                placeholder="请确认新密码"
              >
              </el-input>
            </el-form-item>
          </el-collapse-item>
        </el-collapse>

        <!-- 提交按钮 -->
        <el-form-item>
          <el-button type="primary" @click="submitForm">保存修改</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, watchEffect } from 'vue'
import { ElMessage } from 'element-plus'
import { Plus } from '@element-plus/icons-vue'
import { getAddressById, getAddress } from '@/api/address/address.js'
import { updateUser } from '@/api/user/user.js'
import { useUserStore } from '@/store/userStore'

// 表单引用
const userFormRef = ref(null)

// 折叠面板激活项
const activeCollapse = ref([])
const userStore = useUserStore()
// 使用 userStore 中的用户数据
const user = ref(userStore.user || {
  userId: ''
})
// 监听 store 的变化（响应式更新头像）
watchEffect(() => {
  if (userStore.user) {
    user.value = userStore.user
  }
})
// 表单数据
const userForm = reactive({
  userId: user.value.userId,
  avatar: '',
  nickname: '',
  email: '',
  username: '',
  address: [],
  oldPassword: '',
  newPassword: '',
  confirmPassword: '',
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

      if (response && response.data &&
        (Array.isArray(response.data) ? response.data.length > 0 : true)) {
        const data = Array.isArray(response.data) ? response.data : [response.data]

        // 检查是否有子节点
        const nodes = await Promise.all(data.map(async item => {
          // 尝试获取子节点，判断是否为叶子节点
          try {
            const childResponse = await getAddressById(item.addressId)
            const hasChildren = childResponse &&
              childResponse.data &&
              (Array.isArray(childResponse.data) ?
                childResponse.data.length > 0 : true)

            return {
              ...item,
              leaf: !hasChildren // 如果没有子节点，则标记为叶子节点
            }
          } catch (error) {
            console.error(`检查节点 ${item.addressId} 的子节点失败:`, error)
            return {
              ...item,
              leaf: true // 出错时默认为叶子节点
            }
          }
        }))

        resolve(nodes)
      } else {
        // 如果没有数据，则表示是叶子节点
        resolve([])
      }
    } catch (error) {
      console.error('加载地址数据失败:', error)
      resolve([])
    }
  }
}

// 获取地址数据
const loadAddressData = async () => {
  try {
    console.log('开始加载地址数据...')
    // 不需要在这里加载数据，因为级联选择器会通过lazy load自动加载
    return true
  } catch (error) {
    ElMessage.error('初始化地址选择器失败')
    console.error('初始化地址选择器失败:', error)
    return false
  }
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
  // 这里应该调用实际的上传API
  // 临时使用 FileReader 预览
  const reader = new FileReader()
  reader.readAsDataURL(options.file)
  reader.onload = () => {
    userForm.avatar = reader.result
  }
}

// 提交表单
const submitForm = async () => {
  if (!userFormRef.value) return
  const user = updateUser(userForm)
  console.log('提交的用户数据:', user)
    if (user.code === 200) {
      // 这里应该调用实际的保存API
      ElMessage.success('保存成功')
    } else {
      ElMessage.success('保存成功')
      this.$router.push('/user');
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
    const userStore = useUserStore()
    const userData = userStore.user

    if (userData) {
      console.log('获取到用户数据:', userData)
      // 填充表单数据
      userForm.nickname = userData.nickname || ''
      userForm.username = userData.username || ''
      userForm.avatar = userData.avatar || ''

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
  await loadAddressData()
  await getUserInfo()
})
</script>

<style scoped>
.update-user-container {
  padding: 50px;
  max-width: 800px;
  margin: 0 auto;
}

.user-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.avatar-uploader {
  text-align: center;
}

.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
  object-fit: cover;
}

.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
  line-height: 178px;
}
</style>
