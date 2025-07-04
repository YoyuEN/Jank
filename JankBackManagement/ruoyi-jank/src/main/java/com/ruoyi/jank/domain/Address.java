package com.ruoyi.jank.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 地址实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 地址ID */
    @TableId
    @Excel(name = "地址ID")
    private Long addressId;

    /** 地址名称 */
    @Excel(name = "地址名称")
    private String address;

    /** 父级ID */
    @Excel(name = "父级ID")
    private Long pId;

    /** 层级（1：省，2：市，3：区/县） */
    @Excel(name = "层级")
    private Integer level;
}
