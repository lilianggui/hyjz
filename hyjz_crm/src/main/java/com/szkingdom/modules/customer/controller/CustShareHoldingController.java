package com.szkingdom.modules.customer.controller;


import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/shareHolding")
public class CustShareHoldingController {

    @Autowired
    private CustShareHoldingService custShareHoldingService;

    /**
     * 资金流水列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = custShareHoldingService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 更新
     * @param custShareHolding
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CustShareHolding custShareHolding){
        return R.ok().put("data", custShareHoldingService.updateById(custShareHolding));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CustShareHolding custShareHolding){
        Date now = new Date();
        custShareHolding.setCreateTime(now);
        custShareHolding.setUpdateTime(now);
        return R.ok().put("data", custShareHoldingService.insert(custShareHolding));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(Long shareHoldingId){
        return R.ok().put("data", custShareHoldingService.deleteById(shareHoldingId));
    }

}
