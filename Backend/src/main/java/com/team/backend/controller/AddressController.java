package com.team.backend.controller;

import com.team.backend.domain.Address;
import com.team.backend.service.IAddressService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private IAddressService addressService;
    //查询地址信息
    @RequestMapping("/getAddress")
    public Result<List<Address>> getAddress(){
        List<Address> address = addressService.getAddress();
        return Result.success(ResponseCode.SUCCESS,address);
    }
    @GetMapping("/getAddressById")
    public Result<List<Address>> getAddressById(@RequestParam("addressId") String addressId){
        int getPId = Integer.parseInt(addressId);
        List<Address> address = addressService.getAddressById(getPId);
        return Result.success(ResponseCode.SUCCESS,address);
    }
}
