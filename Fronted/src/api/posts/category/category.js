import service from '@/utils/request.js'

export function getCategoryList() {
  return service.get('/category/getCategoryList')
}
