package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustFeeInfo;
import com.szkingdom.modules.customer.entity.CustInvestor;

import java.io.Serializable;
import java.util.Map;

public interface CustFeeInfoService extends IService<CustFeeInfo> {
    PageUtils queryPage(Map<String, Object> params);

}
