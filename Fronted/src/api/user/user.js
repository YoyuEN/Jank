import service from '@/utils/request.js'

// 用户登录
export function getLogin( data) {
  return service.post('/user/login', data)
}

export function getRegister( data) {
  return service.post('/user/register', data)
}

// 获取根据用户ID获取用户信息
export function getUserByUserId(userId) {
  return service.get('/user/getUserByUserId',{
    params:{
      userId:userId
    }
  })
}

export function updateUser(data) {
  return service.post('/user/updateUser', data)
}

