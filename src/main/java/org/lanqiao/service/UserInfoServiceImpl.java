package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService{
    @Autowired
    UserInfoMapper userInfoMapper;
    @Override
    public UserInfo selectByPrimaryKey(Integer id) {
return userInfoMapper.selectByPrimaryKey(id);
    }
}
