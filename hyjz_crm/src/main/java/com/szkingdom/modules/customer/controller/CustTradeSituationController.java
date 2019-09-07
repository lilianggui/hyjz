package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.entity.CustTradeSituation;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import com.szkingdom.modules.customer.service.interfaces.CustTradeSituationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/tradeSituation")
public class CustTradeSituationController {

    @Autowired
    private CustTradeSituationService custTradeSituationService;

    /**
     * 资金流水列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custTradeSituationService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custTradeSituation
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustTradeSituation custTradeSituation){
        return R.ok().put("data", custTradeSituationService.updateById(custTradeSituation));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustTradeSituation custTradeSituation){
        Date now = new Date();
        custTradeSituation.setCreateTime(now);
        custTradeSituation.setUpdateTime(now);
        return R.ok().put("data", custTradeSituationService.insert(custTradeSituation));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long tradeId){
        return R.ok().put("data", custTradeSituationService.deleteById(tradeId));
    }

}
