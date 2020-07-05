package com.example.gateway.config.route;

import com.alibaba.nacos.api.config.listener.Listener;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.event.RefreshRoutesEvent;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import java.util.concurrent.Executor;

/**
 * @DESCRIPTION: 基本数据获取
 * @AUTHOR: yhx
 * @DATE: 2020/5/6 13:52
 **/
@Component
@Data
public class NacosRouteProperties {


    @Value("${nacos.dataId}")
    private String dataId;

    @Value("${nacos.group}")
    private String group;

    @Value("${spring.cloud.nacos.config..namespace}")
    private String namespace;

    @Value("${spring.cloud.nacos.config.server-addr}")
    private String serverAddr;


    public Listener addListener(ApplicationEventPublisher publisher) {
        return new Listener() {
            @Override
            public Executor getExecutor() {
                return null;
            }

            @Override
            public void receiveConfigInfo(String configInfo) {
                publisher.publishEvent(new RefreshRoutesEvent(this));
            }
        };
    }


}
