import service from '@/utils/request.js'

export function getPostList() {
  return service.get('/post/getPostList')
}

// 根据帖子ID获取帖子详情
export function getPostDetail(postId) {
  return service.get('/post/getPostDetail', {
    params: {
      postId,
    },
  })
}
//新增帖子
export function addPostDetail(data) {
  return service.post('/post/addPostDetail', data)
}

//根据用户id获取帖子列表
export function getUserIdPost(userId) {
  return service.get('/post/getUserIdPost', {
    params: {
      userId,
    },
  })
}

export function updatePost(postId){
  return service.put(`/post/updatePost/${postId}`)
}
