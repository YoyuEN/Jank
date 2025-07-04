import request from '@/utils/request'

// 查询用户管理列表
export function listCommonuser(query) {
  return request({
    url: '/commonuser/commonuser/list',
    method: 'get',
    params: query
  })
}
// @/api/commonuser/commonuser.js
export function checkUsernameExist(username) {
  return request({
    url: '/commonuser/commonuser/check-username',
    method: 'get',
    params: { username }
  });
}

export function updateCommonuserStatus(data) {
  return request({
    url: '/commonuser/commonuser/updateStatus',
    method: 'put',
    data: data
  })
}

// 查询用户管理详细
export function getCommonuser(userId) {
  return request({
    url: '/commonuser/commonuser/' + userId,
    method: 'get'
  })
}

// 新增用户管理
export function addCommonuser(data) {
  return request({
    url: '/commonuser/commonuser',
    method: 'post',
    data: data
  })
}

// 修改用户管理
export function updateCommonuser(data) {
  return request({
    url: '/commonuser/commonuser',
    method: 'put',
    data: data
  })
}

// 删除用户管理
export function delCommonuser(userId) {
  return request({
    url: '/commonuser/commonuser/' + userId,
    method: 'delete'
  })
}
