package com.example.userweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

@MapperScan("com.example.userservice.dao")
@ImportResource({"classpath:*.properties", "classpath:*.yml"})
@ComponentScan(basePackages = {"com.example"})
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
public class UserWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserWebApplication.class, args);
    }

}
