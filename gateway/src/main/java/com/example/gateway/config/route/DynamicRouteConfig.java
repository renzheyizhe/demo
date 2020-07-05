package com.example.gateway.config.route;

import com.alibaba.nacos.api.NacosFactory;
import com.alibaba.nacos.api.PropertyKeyConst;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * @DESCRIPTION: config 文件，添加 路由 监听器
 * @AUTHOR: yhx
 * @DATE: 2020/5/6 13:41
 **/
@Configuration
@Slf4j
public class DynamicRouteConfig {


    @Autowired
    private ApplicationEventPublisher publisher;

    @Autowired
    private NacosRouteProperties nacosRouteProperties;

    private ConfigService configService;


    @Bean
    public NacosRouteDefinitionRepository nacosRouteDefinitionRepository() {
        getConfigService();
        return new NacosRouteDefinitionRepository(configService, nacosRouteProperties);
    }

    private void getConfigService() {
        Properties properties = new Properties();
        properties.put(PropertyKeyConst.SERVER_ADDR, nacosRouteProperties.getServerAddr());
        properties.put(PropertyKeyConst.NAMESPACE, nacosRouteProperties.getNamespace());
        try {
            configService = NacosFactory.createConfigService(properties);
            configService.addListener(nacosRouteProperties.getDataId(), nacosRouteProperties.getGroup(), nacosRouteProperties.addListener(publisher));
        } catch (NacosException e) {
            log.error(e.getMessage(), e);
        }
    }


}
