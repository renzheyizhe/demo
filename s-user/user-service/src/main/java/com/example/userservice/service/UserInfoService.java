package com.example.userservice.service;

import com.example.userservice.dao.UserInfoDAO;
import com.example.userservice.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserInfoService {

    @Autowired
    private UserInfoDAO userDAO;

    public Long saveUserInfo(UserInfo user) {
        user.setCreateTime(new Date());
        userDAO.insert(user);
        return user.getId();
    }

}
