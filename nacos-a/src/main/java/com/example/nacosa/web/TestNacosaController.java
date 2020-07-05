package com.example.nacosa.web;

import com.example.nacosa.feign.FeignNacosBDoLog;
import com.example.nacosa.service.TestServiceNacosaImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private FeignNacosBDoLog bDoLog;

    @Value("${current.env}")
    private String currentEnv;

    @GetMapping("/save")
    public String save(String info) {
        return "调用 nacos b 服务," + bDoLog.saveDoLog("生成唯一ID");
    }

    @GetMapping("/saveList")
    public String saveList(String info) {
        int i = 0;
        while (i < 100) {
            new Thread(() -> {
                bDoLog.saveDoLog("生成唯一ID");
            }).start();
            i++;
        }
        return "调用 nacos b 服务, 批量生成ID";
    }


    @Autowired
    private TestServiceNacosaImpl testServiceNacosa;

    @GetMapping("/helloWorld")
    public String helloWorld(String id) {
        return testServiceNacosa.helloWorld(id);
    }

    @GetMapping("/helloWorld2")
    public String helloWorld2(String id) {
        return testServiceNacosa.helloWorld2(id);
    }

}
