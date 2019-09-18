package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService{
    @Autowired
    private UserInfoMapper userInfoMapper;

    //注册业务
    @Override
    public UserInfo registerUser(UserInfo userInfo) {
        userInfoMapper.registerUser(userInfo);
        return userInfo;
    }
    //登录业务
    @Override
    public UserInfo checkLogin(String userName, String userPassw) {
        UserInfo userInfo = userInfoMapper.findByUsername(userName);
        if(userInfo != null && userInfo.getUserPassw().equals(userPassw)){
            return userInfo;
        }
        return null;
    }
    //登陆时改变激活状态
    @Override
    public UserInfo updateStatus(String userName) {
        userInfoMapper.updateStatus(userName);
        UserInfo userInfo = userInfoMapper.findByUsername(userName);
        return userInfo;
    }

    @Override
    public UserInfo selectByPrimaryKey(Integer id) {
return userInfoMapper.selectByPrimaryKey(id);
    }
    @Override
    public List<Video> selectVideoUpload(Integer userId) {
        return userInfoMapper.selectVideoUpload(userId);
    }

    @Override
    public int countUserNum(String userType) {
        return userInfoMapper.selectCountUserNum(userType);
    }


}
