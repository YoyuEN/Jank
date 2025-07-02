import service from '@/utils/request.js'


export function getPerMessage() {
  return service.get('/permessage/getmessagelist');
}
export function postPerMessage(data) {
  return service.post('/permessage/addmessage', data);
}
