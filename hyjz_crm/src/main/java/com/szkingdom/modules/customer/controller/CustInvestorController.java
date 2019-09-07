package com.szkingdom.modules.customer.controller;

import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustInvestor;
import com.szkingdom.modules.customer.entity.Customer;
import com.szkingdom.modules.customer.service.interfaces.CustInvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/investor")
public class CustInvestorController {

    @Autowired
    private CustInvestorService custInvestorService;

    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custInvestorService.queryPage(params);
        return R.ok().put("page", page);
    }

    @PostMapping("/update")
    public R update(@RequestBody CustInvestor custInvestor){
        return R.ok().put("data", custInvestorService.updateById(custInvestor));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustInvestor custInvestor){
        Date now = new Date();
        custInvestor.setCreateTime(now);
        custInvestor.setUpdateTime(now);
        return R.ok().put("data", custInvestorService.insert(custInvestor));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long investorId){
        return R.ok().put("data", custInvestorService.deleteById(investorId));
    }
}
