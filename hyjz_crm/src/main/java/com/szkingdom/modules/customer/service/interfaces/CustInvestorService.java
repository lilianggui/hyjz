package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustInvestor;

import java.util.Map;

public interface CustInvestorService extends IService<CustInvestor> {
    PageUtils queryPage(Map<String, Object> params);

}
