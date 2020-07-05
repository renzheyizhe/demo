package com.example.userapi;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping(value = "/user")
public interface UserInfoAPI {


    @PostMapping("/save")
    public String save(@RequestParam("name") String name);


}
