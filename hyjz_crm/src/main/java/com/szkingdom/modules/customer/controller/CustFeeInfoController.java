package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustFeeInfo;
import com.szkingdom.modules.customer.entity.CustInvestor;
import com.szkingdom.modules.customer.service.interfaces.CustFeeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/feeInfo")
public class CustFeeInfoController {

    @Autowired
    private CustFeeInfoService custFeeInfoService;

    /**
     * 交费情况列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custFeeInfoService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custFeeInfo
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustFeeInfo custFeeInfo){
        return R.ok().put("data", custFeeInfoService.updateById(custFeeInfo));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustFeeInfo custFeeInfo){
        Date now = new Date();
        custFeeInfo.setCreateTime(now);
        custFeeInfo.setUpdateTime(now);
        return R.ok().put("data", custFeeInfoService.insert(custFeeInfo));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long feeId){
        return R.ok().put("data", custFeeInfoService.deleteById(feeId));
    }

}
