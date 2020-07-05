package com.example.orderservice.entity;

import lombok.Data;

import java.util.Date;

@Data
public class OrderInfo {

    /**
     * 主键ID
     */
    private Long id;

    private String orderNo;

    /**
     * 创建时间
     */
    private Date createTime;

    private String orderDesc;

    private String uid;

    private String goodsId;

}
