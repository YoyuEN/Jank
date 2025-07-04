import request from '@/utils/request'

// 查询评论功能列表
export function listComment(query) {
  return request({
    url: '/jank/comment/list',
    method: 'get',
    params: query
  })
}

// 查询评论功能详细
export function getComment(commentId) {
  return request({
    url: '/jank/comment/' + commentId,
    method: 'get'
  })
}

// 新增评论功能
export function addComment(data) {
  return request({
    url: '/jank/comment',
    method: 'post',
    data: data
  })
}// 修改评论功能
export function updateComment(data) {
  return request({
    url: '/jank/comment',
    method: 'put',
    data: data
  })
}

// 删除评论功能
export function delComment(commentId) {
  return request({
    url: '/jank/comment/' + commentId,
    method: 'delete'
  })
}
