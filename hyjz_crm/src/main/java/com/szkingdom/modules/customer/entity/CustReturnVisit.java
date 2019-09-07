package com.szkingdom.modules.customer.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@TableName("cust_return_visit")
public class CustReturnVisit implements Serializable {

    @TableId
    private Long returnVisitId;
    private Long custId;
    private Date visitDate;
    private String content;
    private String entryPerson;
    private Date createTime;
    private Date updateTime;

    public Long getReturnVisitId() {
        return returnVisitId;
    }

    public void setReturnVisitId(Long returnVisitId) {
        this.returnVisitId = returnVisitId;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
