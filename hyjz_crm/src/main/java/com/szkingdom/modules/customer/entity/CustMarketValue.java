package com.szkingdom.modules.customer.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@TableName("cust_market_value")
public class CustMarketValue implements Serializable {

    @TableId
    private Long marketValueId;
    private Long custId;
    private Date marketValueDate;
    private BigDecimal marketValue;
    private BigDecimal increase;
    private BigDecimal increaseReduce;
    private String entryPerson;
    private Date createTime;
    private Date updateTime;

    public BigDecimal getIncreaseReduce() {
        return increaseReduce;
    }

    public void setIncreaseReduce(BigDecimal increaseReduce) {
        this.increaseReduce = increaseReduce;
    }

    public Long getMarketValueId() {
        return marketValueId;
    }

    public void setMarketValueId(Long marketValueId) {
        this.marketValueId = marketValueId;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public Date getMarketValueDate() {
        return marketValueDate;
    }

    public void setMarketValueDate(Date marketValueDate) {
        this.marketValueDate = marketValueDate;
    }

    public BigDecimal getMarketValue() {
        return marketValue;
    }

    public void setMarketValue(BigDecimal marketValue) {
        this.marketValue = marketValue;
    }

    public BigDecimal getIncrease() {
        return increase;
    }

    public void setIncrease(BigDecimal increase) {
        this.increase = increase;
    }

    public String getEntryPerson() {
        return entryPerson;
    }

    public void setEntryPerson(String entryPerson) {
        this.entryPerson = entryPerson;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
