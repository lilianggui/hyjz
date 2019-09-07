package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustomerDao;
import com.szkingdom.modules.customer.service.interfaces.CustomerService;
import com.szkingdom.modules.customer.entity.Customer;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("customerService")
public class CustomerServiceImpl extends ServiceImpl<CustomerDao, Customer> implements CustomerService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String custName = (String)params.get("custName");
        Page<Customer> page = this.selectPage(
                new Query<Customer>(params).getPage(),
                new EntityWrapper<Customer>()
                        .like(StringUtils.isNotBlank(custName),"cust_name", custName)
        );

        return new PageUtils(page);
    }
}
