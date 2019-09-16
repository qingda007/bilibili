package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;

import java.util.List;


public interface UserInfoService {
    //用户注册
    UserInfo registerUser(UserInfo userInfo);
    //用户登录
    UserInfo checkLogin(String userName,String userPassw);

    UserInfo selectByPrimaryKey(Integer id);
    public List<Video> selectVideoUpload(Integer userId);

    //记录在线人数
    int countUserNum(String id);
}
