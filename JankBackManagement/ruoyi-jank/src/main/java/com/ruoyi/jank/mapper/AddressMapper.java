package com.ruoyi.jank.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.jank.domain.Address;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 地址Mapper接口
 */
@Mapper
public interface AddressMapper extends BaseMapper<Address> {
    /**
     * 根据父级ID查询地址列表
     *
     * @param pId 父级ID
     * @return 地址列表
     */
    List<Address> selectByPId(@Param("p_id") Long pId);
}
