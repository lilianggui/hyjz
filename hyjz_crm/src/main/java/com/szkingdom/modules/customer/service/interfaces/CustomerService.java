package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.Customer;

import java.util.Map;

public interface CustomerService extends IService<Customer> {
    PageUtils queryPage(Map<String, Object> params);

}
