package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustCapitalFlow;
import com.szkingdom.modules.customer.entity.CustFeeInfo;

import java.util.Map;

public interface CustCapitalFlowService extends IService<CustCapitalFlow> {
    PageUtils queryPage(Map<String, Object> params);

}
