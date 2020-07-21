package com.example.nacosa.web;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.example.nacosa.error.BlackFallBackUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "/test")
public class TestNacosaController {

    @Value("${current.env}")
    private String currentEnv;


    @SentinelResource(value = "/test/helloWorld", blockHandler = "helloWorldBlockHandler", blockHandlerClass = {BlackFallBackUtil.class}, fallback = "helloWorldFallback", fallbackClass =
            {BlackFallBackUtil.class})
    @GetMapping("/helloWorld")
    public String helloWorld(String id) {
        return "HelloWorld,do service r1," + id + "======" + currentEnv;
    }

    @GetMapping("/helloWorld2")
    public String helloWorld2(String id) {
        return "HelloWorld2,do service r1," + id + "======" + currentEnv;
    }


}
