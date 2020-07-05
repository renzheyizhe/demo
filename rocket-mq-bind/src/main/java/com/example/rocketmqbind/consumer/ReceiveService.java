package com.example.rocketmqbind.consumer;

import com.example.rocketmqbind.bind.CustomBinding;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.stereotype.Component;

/**
 * @Description TODO
 * @Date 2020/7/6 1:27
 * @Created by 15617
 */
@Slf4j
@Component
public class ReceiveService {

    @StreamListener(CustomBinding.inputC)
    public void consume(String content) {
        log.info("从Binding-{}收到消息-{}", CustomBinding.inputC, content);
    }

}
