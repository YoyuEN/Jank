import request from '@/utils/request'

// 获取省份列表
export function getProvinces() {
  return request({
    url: '/address/provinces',
    method: 'get'
  })
}

// 根据父级ID获取子级地址
export function getChildrenByPId(pId) {
  return request({
    url: `/address/children/${pId}`,
    method: 'get'
  })
}
