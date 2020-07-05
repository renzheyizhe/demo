package com.example.orderservice.feign;

import com.example.orderservice.config.FeignConfiguration;
import com.example.userapi.UserInfoAPI;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "user",configuration = FeignConfiguration.class)
public interface UserClient extends UserInfoAPI {

}
