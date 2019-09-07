package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustCapitalFlowDao;
import com.szkingdom.modules.customer.dao.CustFeeInfoDao;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustFeeInfo;
import com.szkingdom.modules.customer.service.interfaces.CustCapitalFlowService;
import com.szkingdom.modules.customer.service.interfaces.CustFeeInfoService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custCapitalFlowService")
public class CustCapitalFlowServiceImpl extends ServiceImpl<CustCapitalFlowDao, CustCapitalFlow> implements CustCapitalFlowService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustCapitalFlow> page = this.selectPage(
                new Query<CustCapitalFlow>(params).getPage(),
                new EntityWrapper<CustCapitalFlow>()
                        .eq(params.get("custId") != null,"cust_id", Long.parseLong(params.get("custId").toString()))
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
