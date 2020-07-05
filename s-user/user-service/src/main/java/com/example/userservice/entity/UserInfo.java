package com.example.userservice.entity;

import lombok.Data;

import java.util.Date;

@Data
public class UserInfo {

    /**
     * 主键ID
     */
    private Long id;

    private String username;

    /**
     * 创建时间
     */
    private Date createTime;

    private String password;

}