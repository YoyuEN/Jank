import service from '@/utils/request.js'

// 获取文章评论列表（平铺结构）
export function getCommentList(postId) {
  return service.get(`/comment/list/${postId}`)
}

// 获取文章评论列表（树状结构）
export function getNestedCommentList(postId) {
  return service.get(`/comment/nested-list/${postId}`)
}

// 提交评论
export function submitComment(data) {
  return service.post('/comment/add', data)
}
