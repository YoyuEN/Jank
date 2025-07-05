import request from '@/utils/request'

// 获取评论列表
export function getNestedCommentList(postId) {
  return request({
    url: `/comment/listComment/${postId}`, // 移除重复的api前缀
    method: 'get',
  })
}
// 获取文章评论列表
export function getCommentByUserId(postId) {
  return request({
    url: `/comment/getComments/${postId}`, // 移除重复的api前缀
    method: 'get',
  })
}
//获取评论心级数
export function getCommentLevel(postId) {
  return request({
    url: `/comment/level/${postId}`,  // 移除重复的api前缀
    method: 'get'
  })
}

// // 获取文章评论列表
// export function getCommentByUserId(postId) {
//   return request({
//     url: `/comment/comments/${postId}`,  // 移除重复的api前缀
//     method: 'get'
//   })
// }

// 提交评论
export function submitComment(data) {
  return request({
    url: '/comment/comments',  // 修正为与后端一致的API路径
    method: 'post',
    data
  })
}
