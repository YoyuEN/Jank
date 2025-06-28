import service from '@/utils/request.js';

/**
 * 获取朋友圈列表
 */
export function getMomentList() {
  return service.get('/moment/getMomentList');
}

/**
 * 根据朋友圈ID获取详情
 * @param {string} momentId - 朋友圈唯一标识
 */
export function getMomentDetail(momentId) {
  return service.get('/moment/getMomentDetail', {
    params: {
      momentId
    }
  });
}

/**
 * 新增一条朋友圈
 * @param {Object} data - 朋友圈数据对象
 */
export function addMoment(data) {
  return service.post('/moment/addMoment', data);
}

/**
 * 删除指定的朋友圈
 * @param {string} momentId - 朋友圈唯一标识
 */
export function deleteMoment(momentId) {
  return service.delete('/moment/deleteMoment', {
    params: {
      momentId
    }
  });
}

/**
 * 点赞朋友圈
 * @param {string} momentId - 朋友圈唯一标识
 */
export function likeMoment(momentId) {
  return service.post('/moment/likeMoment', {
    momentId
  });
}
