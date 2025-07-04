package com.team.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.team.backend.domain.Address;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressMapper extends BaseMapper<Address> {
}
