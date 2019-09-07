package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustCapitalFlowDao;
import com.szkingdom.modules.customer.dao.CustShareHoldingDao;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custShareHoldingService")
public class CustShareHoldingServiceImpl extends ServiceImpl<CustShareHoldingDao, CustShareHolding> implements CustShareHoldingService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustShareHolding> page = this.selectPage(
                new Query<CustShareHolding>(params).getPage(),
                new EntityWrapper<CustShareHolding>()
                        .eq(params.get("custId") != null,"cust_id", Long.parseLong(params.get("custId").toString()))
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
