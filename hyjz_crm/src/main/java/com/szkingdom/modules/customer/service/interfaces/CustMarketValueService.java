package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustMarketValue;

import java.util.Map;

public interface CustMarketValueService extends IService<CustMarketValue> {
    PageUtils queryPage(Map<String, Object> params);

}
