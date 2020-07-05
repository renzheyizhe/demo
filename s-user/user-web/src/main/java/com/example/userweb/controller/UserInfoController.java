package com.example.userweb.controller;

import com.example.userapi.UserInfoAPI;
import com.example.userservice.entity.UserInfo;
import com.example.userservice.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserInfoController implements UserInfoAPI {

    @Autowired
    private UserInfoService userService;

    @Override
    public String save(String name) {
        UserInfo user = new UserInfo();
        user.setUsername(name);
        user.setPassword("123456");
        return String.valueOf(userService.saveUserInfo(user));
    }


}
