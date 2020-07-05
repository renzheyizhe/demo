package com.example.rocketmqbind;

import com.example.rocketmqbind.bind.CustomBinding;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;

@EnableBinding({CustomBinding.class})
@SpringBootApplication
public class RocketMqBindApplication {

    public static void main(String[] args) {
        SpringApplication.run(RocketMqBindApplication.class, args);
    }

}
