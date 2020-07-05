package com.example.gateway.config.route;

import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @DESCRIPTION: 实现 RouteDefinitionRepository ，定义路由
 * @AUTHOR: yhx
 * @DATE: 2020/5/6 11:11
 **/
@Slf4j
public class NacosRouteDefinitionRepository implements RouteDefinitionRepository {

    private NacosRouteProperties nacosRouteProperties;

    private ConfigService configService;

    public NacosRouteDefinitionRepository(ConfigService configService, NacosRouteProperties nacosRouteProperties) {
        this.configService = configService;
        this.nacosRouteProperties = nacosRouteProperties;
    }

    @Override
    public Flux<RouteDefinition> getRouteDefinitions() {
        List<RouteDefinition> list = new ArrayList<>();
        try {
            String config = configService.getConfig(nacosRouteProperties.getDataId(), nacosRouteProperties.getGroup(), 5000);
            if (StringUtils.isNotBlank(config)) {
                list = JSON.parseArray(config, RouteDefinition.class);
            }
        } catch (NacosException e) {
            log.error("route get fail=" + e.getMessage(), e);
        }
        log.info("路由监听 list={}", list.stream().map(RouteDefinition::getId).collect(Collectors.toList()));
        return Flux.fromIterable(list);
    }


    @Override
    public Mono<Void> save(Mono<RouteDefinition> route) {
        return null;
    }

    @Override
    public Mono<Void> delete(Mono<String> routeId) {
        return null;
    }
}
