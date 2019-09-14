package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;



public interface UserInfoService {
    //用户注册
    UserInfo registerUser(UserInfo userInfo);
    //用户登录
    UserInfo checkLogin(String userName,String userPassw);

    UserInfo selectByPrimaryKey(Integer id);
}
