import service from '@/utils/request.js'

// 获取所有技术栈
export function getAllTechStack() {
  return service.get('/tech-stack/getAllTechStack')
}
