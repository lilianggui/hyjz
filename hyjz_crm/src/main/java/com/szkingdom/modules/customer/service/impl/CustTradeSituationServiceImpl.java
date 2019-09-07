package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustShareHoldingDao;
import com.szkingdom.modules.customer.dao.CustTradeSituationDao;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.entity.CustTradeSituation;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import com.szkingdom.modules.customer.service.interfaces.CustTradeSituationService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custTradeSituationService")
public class CustTradeSituationServiceImpl extends ServiceImpl<CustTradeSituationDao, CustTradeSituation> implements CustTradeSituationService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustTradeSituation> page = this.selectPage(
                new Query<CustTradeSituation>(params).getPage(),
                new EntityWrapper<CustTradeSituation>()
                        .eq(params.get("custId") != null,"cust_id", Long.parseLong(params.get("custId").toString()))
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
