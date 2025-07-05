import service from '@/utils/request.js'

/**
 * 获取朋友圈列表
 */
export function deleteMomentById(momentId) {
  return service.delete('/moment/deleteMoment',{
    params: {
      momentId,
    },
  })
}

export function deletePostById(postId) {
  return service.delete('/post/deletePost', {
    params: {
      postId,
    },
  });
}

export function deleteCommentById(commentId) {
  return service.delete('/comment/deleteComment', {
    params: {
      commentId,
    },
  });
}

