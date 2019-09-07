package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustInvestorDao;
import com.szkingdom.modules.customer.dao.CustomerDao;
import com.szkingdom.modules.customer.entity.CustInvestor;
import com.szkingdom.modules.customer.entity.Customer;
import com.szkingdom.modules.customer.service.interfaces.CustInvestorService;
import com.szkingdom.modules.customer.service.interfaces.CustomerService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custInvestorService")
public class CustInvestorServiceImpl extends ServiceImpl<CustInvestorDao, CustInvestor> implements CustInvestorService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String investorName = (String)params.get("investorName");
        Page<CustInvestor> page = this.selectPage(
                new Query<CustInvestor>(params).getPage(),
                new EntityWrapper<CustInvestor>()
                        .like(StringUtils.isNotBlank(investorName),"investor_name", investorName)
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
