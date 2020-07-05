package com.example.nacossentineldemo.web;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.example.nacossentineldemo.service.TestServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @DESCRIPTION:
 * @AUTHOR: yhx
 * @DATE: 2020/6/12 13:54
 **/
@Slf4j
@RestController
@RequestMapping("/test")
public class TestController {

    @Autowired
    private TestServiceImpl testService;

    @GetMapping("/HelloWorld")
    @SentinelResource("HelloWorld")
    public String HelloWorld() {
        return "HelloWorld";
    }

    @GetMapping("/nohello")
    public String nohello() {
        return "nohello";
    }

}
