package com.szkingdom.modules.customer.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.Query;
import com.szkingdom.modules.customer.dao.CustFeeInfoDao;
import com.szkingdom.modules.customer.dao.CustInvestorDao;
import com.szkingdom.modules.customer.entity.CustFeeInfo;
import com.szkingdom.modules.customer.entity.CustInvestor;
import com.szkingdom.modules.customer.service.interfaces.CustFeeInfoService;
import com.szkingdom.modules.customer.service.interfaces.CustInvestorService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("custFeeInfoService")
public class CustFeeInfoServiceImpl extends ServiceImpl<CustFeeInfoDao, CustFeeInfo> implements CustFeeInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CustFeeInfo> page = this.selectPage(
                new Query<CustFeeInfo>(params).getPage(),
                new EntityWrapper<CustFeeInfo>()
                        .orderBy("create_time", false)
        );

        return new PageUtils(page);
    }
}
