import service from '@/utils/request.js'

export function getAddress() {
  return service.get('/address/getAddress')
}
export function getAddressById(addressId) {
  return service.get('/address/getAddressById',{
    params: {
      addressId
    }})
}
