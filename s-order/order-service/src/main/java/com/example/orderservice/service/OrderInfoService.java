package com.example.orderservice.service;

import com.example.orderservice.dao.OrderInfoDAO;
import com.example.orderservice.entity.OrderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class OrderInfoService {

    @Autowired
    private OrderInfoDAO orderInfoDAO;

    public int saveOrderInfo(OrderInfo orderInfo) {
        orderInfo.setCreateTime(new Date());
        return orderInfoDAO.insert(orderInfo);
    }


}
