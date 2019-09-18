package org.lanqiao.service;

import org.lanqiao.entity.UserFans;
import org.lanqiao.mapper.UserFansMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserFansServiceImpl implements UserFansService {
    @Autowired
    UserFansMapper userFansMapper;
    @Override
    public int fansCount(Integer userId) {
        return userFansMapper.fansCount(userId);
    }

    @Override
    public int beFansCount(Integer fansId) {
        return userFansMapper.beFansCount(fansId);
    }

    @Override
    public List<UserFans> fansList(Integer userId) {
       return userFansMapper.fansList(userId);
    }

    @Override
    public List<UserFans> followList(Integer fansId) {
        return userFansMapper.followList(fansId);
    }
}
