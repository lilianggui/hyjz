package com.szkingdom.modules.customer.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.szkingdom.modules.customer.entity.CustShareHolding;
import com.szkingdom.modules.customer.entity.CustTradeSituation;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CustTradeSituationDao extends BaseMapper<CustTradeSituation> {

}
