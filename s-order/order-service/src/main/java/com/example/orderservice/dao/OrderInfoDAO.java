package com.example.orderservice.dao;

import com.example.orderservice.entity.OrderInfo;
import org.apache.ibatis.annotations.Insert;

public interface OrderInfoDAO {

    @Insert("insert into order_info(order_desc,create_time,uid) value(#{orderDesc},#{createTime},#{uid})")
    int insert(OrderInfo orderInfo);
}
