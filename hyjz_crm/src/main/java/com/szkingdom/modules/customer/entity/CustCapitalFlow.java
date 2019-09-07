package com.szkingdom.modules.customer.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@TableName("cust_capital_flow")
public class CustCapitalFlow implements Serializable {

    @TableId
    private Long capitalFlowId;
    private Long custId;
    private Date flowDate;
    private BigDecimal inOrOut;
    private String entryPerson;
    private String remark;
    private Date createTime;
    private Date updateTime;

    public Long getCapitalFlowId() {
        return capitalFlowId;
    }

    public void setCapitalFlowId(Long capitalFlowId) {
        this.capitalFlowId = capitalFlowId;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public Date getFlowDate() {
        return flowDate;
    }

    public void setFlowDate(Date flowDate) {
        this.flowDate = flowDate;
    }

    public BigDecimal getInOrOut() {
        return inOrOut;
    }

    public void setInOrOut(BigDecimal inOrOut) {
        this.inOrOut = inOrOut;
    }

    public String getEntryPerson() {
        return entryPerson;
    }

    public void setEntryPerson(String entryPerson) {
        this.entryPerson = entryPerson;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
