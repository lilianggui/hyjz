package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustReturnVisit;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.service.interfaces.CustReturnVisitService;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/returnVisit")
public class CustReturnVisitController {

    @Autowired
    private CustReturnVisitService custReturnVisitService;

    /**
     * 回访记录列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custReturnVisitService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custReturnVisit
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustReturnVisit custReturnVisit){
        return R.ok().put("data", custReturnVisitService.updateById(custReturnVisit));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustReturnVisit custReturnVisit){
        Date now = new Date();
        custReturnVisit.setCreateTime(now);
        custReturnVisit.setUpdateTime(now);
        return R.ok().put("data", custReturnVisitService.insert(custReturnVisit));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long returnVisitId){
        return R.ok().put("data", custReturnVisitService.deleteById(returnVisitId));
    }

}
