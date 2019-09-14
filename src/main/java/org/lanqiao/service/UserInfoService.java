package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;

import java.util.List;


public interface UserInfoService {
    //用户注册
    int insertUser(UserInfo userInfo);
    UserInfo selectByPrimaryKey(Integer id);
    public List<Video> selectVideoUpload(Integer userId);
}
