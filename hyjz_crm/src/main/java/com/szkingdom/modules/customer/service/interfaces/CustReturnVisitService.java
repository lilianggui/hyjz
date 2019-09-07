package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustReturnVisit;
import com.szkingdom.modules.customer.entity.CustShareHolding;

import java.util.Map;

public interface CustReturnVisitService extends IService<CustReturnVisit> {
    PageUtils queryPage(Map<String, Object> params);

}
