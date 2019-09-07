package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustMarketValue;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustMarketValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/marketValue")
public class CustMarketValueController {

    @Autowired
    private CustMarketValueService custMarketValueService;

    /**
     * 市值列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custMarketValueService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custMarketValue
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustMarketValue custMarketValue){
        return R.ok().put("data", custMarketValueService.updateById(custMarketValue));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustMarketValue custMarketValue){
        Date now = new Date();
        custMarketValue.setCreateTime(now);
        custMarketValue.setUpdateTime(now);
        return R.ok().put("data", custMarketValueService.insert(custMarketValue));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long marketValueId){
        return R.ok().put("data", custMarketValueService.deleteById(marketValueId));
    }
}
