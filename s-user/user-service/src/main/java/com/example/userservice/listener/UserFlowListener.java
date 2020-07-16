package com.example.userservice.listener;

import com.alibaba.nacos.api.NacosFactory;
import com.alibaba.nacos.api.PropertyKeyConst;
import com.alibaba.nacos.api.annotation.NacosInjected;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.config.listener.Listener;
import com.alibaba.nacos.api.exception.NacosException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.util.Properties;
import java.util.concurrent.Executor;

/**
 * @Description TODO
 * @Date 2020/7/16 23:52
 * @Created by 15617
 */
@Slf4j
@Configuration
public class UserFlowListener {

    private static final String DATA_ID = "user-flow.properties";

    private static final String DEFAULT_GROUP = "DEFAULT_GROUP";

    @Value("${spring.cloud.nacos.config.namespace}")
    private String namespace;

    @Value("${spring.cloud.nacos.config.server-addr}")
    private String serverAddr;

    @NacosInjected
    private ConfigService configService;

    @PostConstruct
    public void init() throws Exception {
        Properties properties = new Properties();
        properties.put(PropertyKeyConst.SERVER_ADDR, serverAddr);
        properties.put(PropertyKeyConst.NAMESPACE, namespace);
        configService = NacosFactory.createConfigService(properties);
    }

    @Bean
    public void userFlow() {
        try {
            configService.addListener(DATA_ID, DEFAULT_GROUP, new Listener() {
                @Override
                public Executor getExecutor() {
                    return null;
                }

                @Override
                public void receiveConfigInfo(String s) {
                    log.info("user-flow：{}", s);
                }
            });
        } catch (NacosException e) {
            log.error(e.getMessage());
        }
    }


}
