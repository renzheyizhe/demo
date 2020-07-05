package com.example.rocketmqbind.bind;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

/**
 * @Description TODO
 * @Date 2020/7/6 1:37
 * @Created by 15617
 */
public interface CustomBinding {

    String inputC = "inputC";
    String outputPro = "outputPro";

    //消费者
    @Input
    SubscribableChannel inputC();

    //生产者
    @Output
    MessageChannel outputPro();

}
