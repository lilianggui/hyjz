package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustCapitalFlowDao;
import com.szkingdom.modules.customer.dao.CustMarketValueDao;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustMarketValue;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustMarketValueService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custMarketValueService")
public class CustMarketValueServiceImpl extends ServiceImpl<CustMarketValueDao, CustMarketValue> implements CustMarketValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustMarketValue> page = this.selectPage(
                new Query<CustMarketValue>(params).getPage(),
                new EntityWrapper<CustMarketValue>()
                        .eq(params.get("custId") != null,"cust_id", Long.parseLong(params.get("custId").toString()))
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
