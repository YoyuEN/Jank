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
