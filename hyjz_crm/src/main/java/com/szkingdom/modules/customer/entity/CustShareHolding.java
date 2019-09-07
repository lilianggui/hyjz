package com.szkingdom.modules.customer.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@TableName("cust_share_holding")
public class CustShareHolding implements Serializable {

    @TableId
    private Long shareHoldingId;
    private Long custId;
    private String stockCode;
    private String stockName;
    private String stockCount;
    private BigDecimal shareHoldingCost;
    private Date createTime;
    private Date updateTime;

    public Long getShareHoldingId() {
        return shareHoldingId;
    }

    public void setShareHoldingId(Long shareHoldingId) {
        this.shareHoldingId = shareHoldingId;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public String getStockCode() {
        return stockCode;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public String getStockCount() {
        return stockCount;
    }

    public void setStockCount(String stockCount) {
        this.stockCount = stockCount;
    }

    public BigDecimal getShareHoldingCost() {
        return shareHoldingCost;
    }

    public void setShareHoldingCost(BigDecimal shareHoldingCost) {
        this.shareHoldingCost = shareHoldingCost;
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
