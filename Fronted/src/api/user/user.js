import service from '@/utils/request.js'

export function getLogin(data) {
  return service.post('/account/loginAccount',{
    data:data
  })
}
