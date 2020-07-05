package com.example.nacosa.feign;

import com.example.bapi.DoLogApi;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @ProjectName: cloud-demo
 * @Package: web
 * @Description:
 * @Author: yhx
 * @CreateDate: 2019/6/3 9:42
 * @Version: 1.0
 */
@FeignClient(value = "nacosb")
public interface FeignNacosBDoLog extends DoLogApi {

}
