import service from '@/utils/request.js'


export function getPostList() {
  return service.get('/post/getPostList');
}

// 根据帖子ID获取帖子详情
export function getPostDetail(postId) {
  return service.get('/post/getPostDetail', {
    params: {
      postId
    }
  })
}
//新增帖子
export function addPostDetail(data) {
  return service.post('/post/addPostDetail', data)
}
