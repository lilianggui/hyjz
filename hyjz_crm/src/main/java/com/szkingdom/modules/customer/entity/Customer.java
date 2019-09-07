package com.szkingdom.modules.customer.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@TableName("cust_info")
public class Customer implements Serializable {

    @TableId
    private Long custId;
    private String custName;
    private String custPhone;
    private String custArea;
    private String developer;
    private String entryPerson;
    private String chargePerson;
    private BigDecimal initMarketValue;
    private BigDecimal principal;
    private Date startDate;
    private Date endDate;
    private String remark;
    private String trader;
    private Date createTime;
    private Date updateTime;

    public BigDecimal getPrincipal() {
        return principal;
    }

    public void setPrincipal(BigDecimal principal) {
        this.principal = principal;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getTrader() {
        return trader;
    }

    public void setTrader(String trader) {
        this.trader = trader;
    }

    public BigDecimal getInitMarketValue() {
        return initMarketValue;
    }

    public void setInitMarketValue(BigDecimal initMarketValue) {
        this.initMarketValue = initMarketValue;
    }

    public String getChargePerson() {
        return chargePerson;
    }

    public void setChargePerson(String chargePerson) {
        this.chargePerson = chargePerson;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public String getCustArea() {
        return custArea;
    }

    public void setCustArea(String custArea) {
        this.custArea = custArea;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
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

    public static void main(String[] args) throws ParseException {
        String pa = "2019-02-05T16:00:00.000Z";
        String pa1 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
        SimpleDateFormat sf = new SimpleDateFormat(pa1);
        System.out.println(sf.parse("2019-02-06T16:00:00.000Z"));

    }
}
