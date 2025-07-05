<template>
  <div class="transfer-container">
    <div class="transfer-header">
      <h3>编辑技术栈</h3>
      <button class="close-btn" @click="$emit('close')">✕</button>
    </div>

    <div class="transfer-content" @click.stop>
      <div class="transfer-panels">
        <!-- 左侧：可选技术栈 -->
        <div class="transfer-panel left-panel">
          <div class="panel-header">
            <h4>可选技术栈</h4>
            <span class="count">{{ availableTechStack.length }}</span>
          </div>
          <div class="search-box">
            <input
              v-model="leftSearch"
              type="text"
              placeholder="搜索技术栈..."
              class="search-input"
            />
          </div>
          <div class="tech-list">
            <div
              v-for="tech in filteredAvailableTechStack"
              :key="tech.techStackId"
              class="tech-item"
              :class="getTechItemClass(tech.name)"
              @click="addToSelected(tech)"
            >
              <div class="tech-content">
                <span class="tech-name">{{ tech.name }}</span>
              </div>
              <span class="add-icon">+</span>
            </div>
          </div>
        </div>

        <!-- 右侧：已选技术栈 -->
        <div class="transfer-panel right-panel">
          <div class="panel-header">
            <h4>已选技术栈</h4>
            <span class="count">{{ selectedTechStack.length }}</span>
          </div>
          <div class="search-box">
            <input
              v-model="rightSearch"
              type="text"
              placeholder="搜索技术栈..."
              class="search-input"
            />
          </div>
          <div class="tech-list">
            <div
              v-for="tech in filteredSelectedTechStack"
              :key="tech.techStackId"
              class="tech-item selected"
              :class="getTechItemClass(tech.name)"
              @click="removeFromSelected(tech)"
            >
              <div class="tech-content">
                <span class="tech-name">{{ tech.name }}</span>
              </div>
              <span class="remove-icon">×</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="transfer-footer">
      <button class="cancel-btn" @click="$emit('close')">取消</button>
      <button class="save-btn" @click="saveTechStack">保存</button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue'
import { getAllTechStack } from '@/api/techstack/techstack.js'
import { updateUserStack } from '@/api/user/user.js'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/store/userStore.js'

const props = defineProps({
  currentTechStack: {
    type: Array,
    default: () => [],
  },
})

// 使用 userStore
const userStore = useUserStore()

const emit = defineEmits(['close', 'update'])

// 数据
const allTechStack = ref([])
const selectedKeys = ref([])
const leftSearch = ref('')
const rightSearch = ref('')

// 计算属性
const availableTechStack = computed(() => {
  return allTechStack.value.filter((tech) => !selectedKeys.value.includes(tech.techStackId))
})

const selectedTechStack = computed(() => {
  return allTechStack.value.filter((tech) => selectedKeys.value.includes(tech.techStackId))
})

const filteredAvailableTechStack = computed(() => {
  if (!leftSearch.value) return availableTechStack.value
  return availableTechStack.value.filter((tech) =>
    tech.name.toLowerCase().includes(leftSearch.value.toLowerCase()),
  )
})

const filteredSelectedTechStack = computed(() => {
  if (!rightSearch.value) return selectedTechStack.value
  return selectedTechStack.value.filter((tech) =>
    tech.name.toLowerCase().includes(rightSearch.value.toLowerCase()),
  )
})

// 方法
const fetchAllTechStack = async () => {
  try {
    const response = await getAllTechStack()
    if (response && response.data) {
      allTechStack.value = response.data
      console.log('获取到技术栈数据:', allTechStack.value)
      console.log(
        '技术栈名称列表:',
        allTechStack.value.map((tech) => tech.name),
      )
      // 初始化已选技术栈的key
      initializeSelectedKeys()
    }
  } catch (error) {
    console.error('获取技术栈列表失败:', error)
    ElMessage.error('获取技术栈列表失败')
  }
}

const initializeSelectedKeys = () => {
  if (props.currentTechStack && props.currentTechStack.length > 0) {
    selectedKeys.value = props.currentTechStack
      .map((tech) => {
        // 如果 currentTechStack 是字符串数组，需要找到对应的 techStackId
        if (typeof tech === 'string') {
          const foundTech = allTechStack.value.find((t) => t.name === tech)
          return foundTech ? foundTech.techStackId : null
        }
        // 如果 currentTechStack 是对象数组，直接使用 techStackId
        return tech.techStackId || tech
      })
      .filter((key) => key !== null)
  } else {
    selectedKeys.value = []
  }
  console.log('初始化已选技术栈:', selectedKeys.value)
}

const addToSelected = (tech) => {
  if (!selectedKeys.value.includes(tech.techStackId)) {
    selectedKeys.value.push(tech.techStackId)
  }
}

const removeFromSelected = (tech) => {
  const index = selectedKeys.value.indexOf(tech.techStackId)
  if (index > -1) {
    selectedKeys.value.splice(index, 1)
  }
}

// 获取技术栈CSS类
const getTechItemClass = (techName) => {
  const techClasses = {
    Java: 'tech-java',
    Python: 'tech-python',
    JavaScript: 'tech-javascript',
    'C++': 'tech-cpp',
    Ruby: 'tech-ruby',
    Go: 'tech-go',
    Swift: 'tech-swift',
    Kotlin: 'tech-kotlin',
    Rust: 'tech-rust',
    SQL: 'tech-sql',
  }
  return techClasses[techName] || 'tech-default'
}

const saveTechStack = async () => {
  try {
    // 直接使用选中的 techStackIds
    const techStackIds = selectedKeys.value

    // 创建更新数据，使用 FormData 格式
    const formData = new FormData()
    formData.append('userId', userStore.user.userId)
    techStackIds.forEach((id) => {
      formData.append('techStackIds', id)
    })

    const response = await updateUserStack(formData)
    if (response && response.code === 200) {
      ElMessage.success('技术栈更新成功')
      // 获取技术栈名称用于更新显示
      const selectedTechStack = techStackIds
        .map((key) => {
          const foundTech = allTechStack.value.find((tech) => tech.techStackId === key)
          return foundTech ? foundTech.name : null
        })
        .filter((name) => name !== null)
      emit('update', selectedTechStack)
      emit('close')
    } else {
      ElMessage.error('技术栈更新失败')
    }
  } catch (error) {
    console.error('更新技术栈失败:', error)
    ElMessage.error('技术栈更新失败')
  }
}

onMounted(() => {
  fetchAllTechStack()
})

// 监听 currentTechStack 变化
watch(
  () => props.currentTechStack,
  () => {
    if (allTechStack.value.length > 0) {
      initializeSelectedKeys()
    }
  },
  { immediate: true },
)
</script>

<style scoped>
.transfer-container {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 900px;
  max-width: 90vw;
  height: 650px;
  max-height: 85vh;
  background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
  border-radius: 20px;
  box-shadow:
    0 20px 60px rgba(0, 0, 0, 0.15),
    0 0 0 1px rgba(255, 255, 255, 0.1);
  display: flex;
  flex-direction: column;
  z-index: 1000;
  overflow: hidden;
  backdrop-filter: blur(10px);
}

.transfer-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 24px 32px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.08);
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 249, 250, 0.9));
  backdrop-filter: blur(10px);
}

.transfer-header h3 {
  margin: 0;
  color: #2c3e50;
  font-size: 20px;
  font-weight: 700;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.close-btn {
  background: none;
  border: none;
  font-size: 24px;
  color: #94a3b8;
  cursor: pointer;
  padding: 8px;
  border-radius: 12px;
  transition: all 0.3s ease;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.close-btn:hover {
  background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
  color: #64748b;
  transform: scale(1.1);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.transfer-content {
  flex: 1;
  padding: 20px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.transfer-panels {
  display: flex;
  gap: 24px;
  height: 100%;
  overflow: hidden;
  padding: 0 24px;
}

.transfer-panel {
  flex: 1;
  border: 1px solid rgba(0, 0, 0, 0.08);
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  background: rgba(255, 255, 255, 0.8);
  box-shadow:
    0 8px 32px rgba(0, 0, 0, 0.08),
    0 0 0 1px rgba(255, 255, 255, 0.1);
  min-height: 0;
  overflow: hidden;
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.transfer-panel:hover {
  box-shadow:
    0 12px 40px rgba(0, 0, 0, 0.12),
    0 0 0 1px rgba(255, 255, 255, 0.2);
  transform: translateY(-2px);
}

.left-panel {
  border-color: rgba(64, 158, 255, 0.3);
}

.left-panel:hover {
  border-color: rgba(64, 158, 255, 0.5);
}

.right-panel {
  border-color: rgba(103, 194, 58, 0.3);
}

.right-panel:hover {
  border-color: rgba(103, 194, 58, 0.5);
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  background: linear-gradient(135deg, rgba(248, 249, 250, 0.9), rgba(233, 236, 239, 0.9));
  border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  border-radius: 16px 16px 0 0;
  backdrop-filter: blur(10px);
}

.panel-header h4 {
  margin: 0;
  color: #374151;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.5px;
}

.count {
  background: linear-gradient(135deg, #409eff, #66b1ff);
  color: white;
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  min-width: 24px;
  text-align: center;
  box-shadow: 0 2px 8px rgba(64, 158, 255, 0.3);
}

.right-panel .count {
  background: linear-gradient(135deg, #67c23a, #85ce61);
  box-shadow: 0 2px 8px rgba(103, 194, 58, 0.3);
}

.search-box {
  padding: 16px 20px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.04);
}

.search-input {
  width: 100%;
  padding: 12px 16px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 12px;
  font-size: 14px;
  outline: none;
  transition: all 0.3s ease;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(10px);
}

.search-input:focus {
  border-color: #409eff;
  background: white;
  box-shadow: 0 0 0 3px rgba(64, 158, 255, 0.15);
  transform: translateY(-1px);
}

.tech-list {
  flex: 1;
  overflow-y: auto;
  overflow-x: hidden;
  padding: 12px;
  min-height: 0;
}

.tech-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  margin: 6px 0;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  color: #374151;
  background: rgba(255, 255, 255, 0.6);
  border: 1px solid rgba(0, 0, 0, 0.04);
  position: relative;
  overflow: hidden;
  backdrop-filter: blur(10px);
}

.tech-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(64, 158, 255, 0.1), rgba(64, 158, 255, 0.05));
  opacity: 0;
  transition: opacity 0.3s ease;
}

.tech-item:hover::before {
  opacity: 1;
}

.tech-item:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(64, 158, 255, 0.15);
  border-color: #409eff;
}

.tech-item.selected {
  background: linear-gradient(135deg, #f0f9ff 0%, #e6f7ff 100%);
  border-color: #67c23a;
  color: #67c23a;
}

.tech-item.selected::before {
  background: linear-gradient(135deg, rgba(103, 194, 58, 0.1), rgba(103, 194, 58, 0.05));
}

.tech-item.selected:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(103, 194, 58, 0.15);
  border-color: #85ce61;
}

/* 技术栈特定样式 */
.tech-java {
  border-left: 4px solid #f89820;
}

.tech-python {
  border-left: 4px solid #3776ab;
}

.tech-javascript {
  border-left: 4px solid #f7df1e;
}

.tech-cpp {
  border-left: 4px solid #00599c;
}

.tech-ruby {
  border-left: 4px solid #cc342d;
}

.tech-go {
  border-left: 4px solid #00add8;
}

.tech-swift {
  border-left: 4px solid #ff6b35;
}

.tech-kotlin {
  border-left: 4px solid #7f52ff;
}

.tech-rust {
  border-left: 4px solid #ce422b;
}

.tech-sql {
  border-left: 4px solid #336791;
}

.tech-default {
  border-left: 4px solid #667eea;
}

.tech-content {
  display: flex;
  align-items: center;
  flex: 1;
}

.tech-name {
  font-weight: 600;
  z-index: 1;
  position: relative;
  color: #374151;
}

.tech-item.selected .tech-name {
  color: #059669;
}

.add-icon,
.remove-icon {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  font-weight: bold;
  transition: all 0.3s ease;
  z-index: 1;
  position: relative;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.add-icon {
  background: linear-gradient(135deg, #409eff, #66b1ff);
  color: white;
}

.remove-icon {
  background: linear-gradient(135deg, #f56c6c, #f78989);
  color: white;
}

.tech-item:hover .add-icon {
  background: linear-gradient(135deg, #66b1ff, #85c1ff);
  transform: scale(1.1);
  box-shadow: 0 4px 12px rgba(64, 158, 255, 0.3);
}

.tech-item.selected:hover .remove-icon {
  background: linear-gradient(135deg, #f78989, #f89898);
  transform: scale(1.1);
  box-shadow: 0 4px 12px rgba(245, 108, 108, 0.3);
}

/* 滚动条样式 */
.tech-list::-webkit-scrollbar {
  width: 8px;
}

.tech-list::-webkit-scrollbar-track {
  background: #f8f9fa;
  border-radius: 4px;
  margin: 4px 0;
}

.tech-list::-webkit-scrollbar-thumb {
  background: linear-gradient(135deg, #c1c1c1, #a8a8a8);
  border-radius: 4px;
  border: 1px solid #f8f9fa;
}

.tech-list::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(135deg, #a8a8a8, #909090);
}

.tech-list::-webkit-scrollbar-corner {
  background: #f8f9fa;
}

/* 左侧面板滚动条 */
.left-panel .tech-list::-webkit-scrollbar-thumb {
  background: linear-gradient(135deg, #409eff, #66b1ff);
}

.left-panel .tech-list::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(135deg, #66b1ff, #85c1ff);
}

/* 右侧面板滚动条 */
.right-panel .tech-list::-webkit-scrollbar-thumb {
  background: linear-gradient(135deg, #67c23a, #85ce61);
}

.right-panel .tech-list::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(135deg, #85ce61, #95d475);
}

.transfer-footer {
  display: flex;
  justify-content: flex-end;
  gap: 16px;
  padding: 24px 32px;
  border-top: 1px solid rgba(0, 0, 0, 0.08);
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 249, 250, 0.9));
  backdrop-filter: blur(10px);
}

.cancel-btn,
.save-btn {
  padding: 12px 28px;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  border: none;
  position: relative;
  overflow: hidden;
}

.cancel-btn {
  background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
  color: #64748b;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.cancel-btn:hover {
  background: linear-gradient(135deg, #e2e8f0, #cbd5e1);
  color: #475569;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.save-btn {
  background: linear-gradient(135deg, #409eff, #66b1ff);
  color: white;
  box-shadow: 0 2px 8px rgba(64, 158, 255, 0.3);
}

.save-btn:hover {
  background: linear-gradient(135deg, #66b1ff, #85c1ff);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(64, 158, 255, 0.4);
}
</style>
