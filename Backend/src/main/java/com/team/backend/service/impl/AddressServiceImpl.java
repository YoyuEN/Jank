package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Address;
import com.team.backend.mapper.AddressMapper;
import com.team.backend.service.IAddressService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {

    @Override
    public List<Address> getAddress() {
        LambdaQueryWrapper<Address> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Address::getPId, "0");
        return list(wrapper);
    }

    @Override
    public List<Address> getAddressById(int addressId) {
        LambdaQueryWrapper<Address> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Address::getPId,addressId);
        return list(wrapper);
    }

    @Override
    public Integer getAddressIdByAddress(String address) {
        // 根据地址获取id
        LambdaQueryWrapper<Address> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Address::getAddress,address);
        return getOne(wrapper).getAddressId();
    }
}
