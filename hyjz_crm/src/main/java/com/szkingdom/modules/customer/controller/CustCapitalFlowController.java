package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustFeeInfo;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustFeeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/capitalFlow")
public class CustCapitalFlowController {

    @Autowired
    private CustCapitalFlowService custCapitalFlowService;

    /**
     * 资金流水列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custCapitalFlowService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custCapitalFlow
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustCapitalFlow custCapitalFlow){
        return R.ok().put("data", custCapitalFlowService.updateById(custCapitalFlow));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustCapitalFlow custCapitalFlow){
        Date now = new Date();
        custCapitalFlow.setCreateTime(now);
        custCapitalFlow.setUpdateTime(now);
        return R.ok().put("data", custCapitalFlowService.insert(custCapitalFlow));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long capitalFlowId){
        return R.ok().put("data", custCapitalFlowService.deleteById(capitalFlowId));
    }

}
