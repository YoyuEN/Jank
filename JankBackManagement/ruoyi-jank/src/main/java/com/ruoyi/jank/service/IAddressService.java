package com.ruoyi.jank.service;

import com.ruoyi.jank.domain.Address;
import java.util.List;

/**
 * 地址Service接口
 */
public interface IAddressService {
    /**
     * 获取省份列表
     *
     * @return 省份列表
     */
    List<Address> getProvinces();

    /**
     * 根据父级ID获取子级地址列表
     *
     * @param pId 父级ID
     * @return 子级地址列表
     */
    List<Address> getChildrenByPId(Long pId);
}
