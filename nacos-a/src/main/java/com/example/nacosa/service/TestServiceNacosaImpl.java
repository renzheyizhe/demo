package com.example.nacosa.service;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * @DESCRIPTION:
 * @AUTHOR: yhx
 * @DATE: 2020/6/22 10:09
 **/
@Service
public class TestServiceNacosaImpl {

    @Value("${current.env}")
    private String currentEnv;


    @SentinelResource(value = "/test/helloWorld", blockHandler = "helloWorldBlockHandler", blockHandlerClass = {BlackFallBackUtil.class}, fallback = "helloWorldFallback", fallbackClass =
            {BlackFallBackUtil.class})
    public String helloWorld(String id) {
        return "HelloWorld,do service r1," + id + "======" + currentEnv;
    }

    public String helloWorld2(String id) {
        return "HelloWorld2,do service r1," + id + "======" + currentEnv;
    }

}
