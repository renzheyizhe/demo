package com.example.orderweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

@EnableFeignClients(basePackages = "com.example.orderservice.feign")
@MapperScan("com.example.orderservice.dao")
@ImportResource({"classpath:*.properties", "classpath:*.yml"})
@ComponentScan(basePackages = {"com.example"})
@EnableDiscoveryClient
@SpringBootApplication
public class OrderWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrderWebApplication.class, args);
    }

}
