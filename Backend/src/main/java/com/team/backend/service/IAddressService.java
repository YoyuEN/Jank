package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Address;

import java.util.List;

public interface IAddressService extends IService<Address> {
    List<Address> getAddress();

    List<Address> getAddressById(int addressId);

    Integer getAddressIdByAddress(String address);
}
