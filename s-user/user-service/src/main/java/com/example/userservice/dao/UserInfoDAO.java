package com.example.userservice.dao;

import com.example.userservice.entity.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

public interface UserInfoDAO {
    //插入用户
    @Insert("insert into user_info(username,password,create_time) value(#{username},#{password},#{createTime})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    void insert(UserInfo user);
}
