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

    @Override
    public int insertUser(UserInfo userInfo) {
        return userInfoMapper.insertUser(userInfo);
    }
    @Override
    public UserInfo selectByPrimaryKey(Integer id) {
return userInfoMapper.selectByPrimaryKey(id);
    }
    @Override
    public List<Video> selectVideoUpload(Integer userId) {
        return userInfoMapper.selectVideoUpload(userId);
    }
}
