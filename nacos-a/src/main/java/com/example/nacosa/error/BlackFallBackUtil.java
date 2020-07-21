package com.example.nacosa.error;

import com.alibaba.csp.sentinel.slots.block.BlockException;

/**
 * @DESCRIPTION:
 * @AUTHOR: yhx
 * @DATE: 2020/6/22 10:09
 **/
public class BlackFallBackUtil {

    // blockHandler 函数，原方法调用被限流/降级/系统保护的时候调用
    public static String helloWorldBlockHandler(String id, BlockException ex) {
        return "限流/降级/系统保护啦，不要再请求啦！！不开心。。。。";
    }

    //Fallback 函数，函数签名与原函数一致或加一个 Throwable 类型的参数.
    public static String helloWorldFallback(String id) {
        return "函数签名啦，不要再请求啦！！不开心。。。。";
    }

}
