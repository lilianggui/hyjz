package com.szkingdom.modules.customer.service.interfaces;

import com.baomidou.mybatisplus.service.IService;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.entity.CustTradeSituation;

import java.util.Map;

public interface CustTradeSituationService extends IService<CustTradeSituation> {
    PageUtils queryPage(Map<String, Object> params);

}
