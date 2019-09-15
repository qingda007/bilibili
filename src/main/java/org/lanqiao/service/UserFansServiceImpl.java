package org.lanqiao.service;

import org.lanqiao.mapper.UserFansMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
