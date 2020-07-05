package com.example.orderweb.controller;

import com.example.orderservice.entity.OrderInfo;
import com.example.orderservice.feign.UserClient;
import com.example.orderservice.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/order")
public class OrderInfoController {

    @Autowired
    private OrderInfoService orderInfoService;

    @Autowired
    private UserClient userClient;

    @GetMapping("/save")
    public String save(String orderDesc, String name) {
        String uid = userClient.save(name);
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrderDesc(orderDesc);
        orderInfo.setUid(uid);
        return String.valueOf(orderInfoService.saveOrderInfo(orderInfo));
    }


}
