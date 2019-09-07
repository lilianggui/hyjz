package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustReturnVisitDao;
import com.szkingdom.modules.customer.dao.CustShareHoldingDao;
import com.szkingdom.modules.customer.entity.CustReturnVisit;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.service.interfaces.CustReturnVisitService;
import com.szkingdom.modules.customer.service.interfaces.CustShareHoldingService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custReturnVisitService")
public class CustReturnVisitServiceImpl extends ServiceImpl<CustReturnVisitDao, CustReturnVisit> implements CustReturnVisitService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustReturnVisit> page = this.selectPage(
                new Query<CustReturnVisit>(params).getPage(),
                new EntityWrapper<CustReturnVisit>()
                        .eq(params.get("custId") != null,"cust_id", Long.parseLong(params.get("custId").toString()))
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
