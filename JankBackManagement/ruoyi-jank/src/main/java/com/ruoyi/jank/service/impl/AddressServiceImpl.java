package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.jank.domain.Address;
import com.ruoyi.jank.mapper.AddressMapper;
import com.ruoyi.jank.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 地址Service实现
 */
@Service
public class AddressServiceImpl implements IAddressService {

    @Autowired
    private AddressMapper addressMapper;

    /**
     * 获取省份列表
     *
     * @return 省份列表
     */
    @Override
    public List<Address> getProvinces() {
        LambdaQueryWrapper<Address> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Address::getPId, 0);
        return addressMapper.selectList(queryWrapper);
    }

    /**
     * 根据父级ID获取子级地址列表
     *
     * @param pId 父级ID
     * @return 子级地址列表
     */
    @Override
    public List<Address> getChildrenByPId(Long pId) {
        return addressMapper.selectByPId(pId);
    }
}
