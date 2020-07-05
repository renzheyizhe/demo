package com.example.rocketmqbind.web;

import com.example.rocketmqbind.producer.ProducerSend;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ProjectName: cloud-demo
 * @Package: web
 * @Description:
 * @Author: yhx
 * @CreateDate: 2019/6/3 9:42
 * @Version: 1.0
 */
@Slf4j
@RestController
public class TestMQController {

    @Autowired
    private ProducerSend send;

    @GetMapping("/send")
    public String helloWorld2(String content) {
        send.send(content);
        return content;
    }

}
