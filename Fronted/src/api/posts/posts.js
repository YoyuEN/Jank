import service from '@/utils/request.js'


export function getPostList() {
  return service.get('/post/getPostList');
}


