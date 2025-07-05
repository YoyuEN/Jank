import request from '@/utils/request'

// 查询类目管理列表
export function listCategory(query) {
  return request({
    url: '/jank/category/list',
    method: 'get',
    params: query
  })
}

// 查询类目管理详细
export function getCategory(categoryId) {
  return request({
    url: '/jank/category/' + categoryId,
    method: 'get'
  })
}

// 新增类目管理
export function addCategory(data) {
  return request({
    url: '/jank/category',
    method: 'post',
    data: data
  })
}

// 修改类目管理
export function updateCategory(data) {
  return request({
    url: '/jank/category',
    method: 'put',
    data: data
  })
}

// 删除类目管理
export function delCategory(categoryId) {
  return request({
    url: '/jank/category/' + categoryId,
    method: 'delete'
  })
}

// 获取所有类目名称
export function listAllCategoryNames() {
  return request({
    url: '/jank/category/names',
    method: 'get'
  })
}
