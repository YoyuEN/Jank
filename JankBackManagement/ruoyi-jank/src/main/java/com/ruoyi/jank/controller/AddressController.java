package com.ruoyi.jank.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.jank.domain.Address;
import com.ruoyi.jank.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 地址信息
 */
@RestController
@RequestMapping("/address")
public class AddressController extends BaseController {
    @Autowired
    private IAddressService addressService;

    /**
     * 获取省份列表
     */
    @GetMapping("/provinces")
    public AjaxResult getProvinces() {
        List<Address> list = addressService.getProvinces();
        return success(list);
    }

    /**
     * 根据父级ID获取子级地址
     */
    @GetMapping("/children/{pId}")
    public AjaxResult getChildren(@PathVariable("pId") Long pId) {
        List<Address> list = addressService.getChildrenByPId(pId);
        return success(list);
    }
}
