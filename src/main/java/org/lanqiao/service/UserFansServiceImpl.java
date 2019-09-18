package org.lanqiao.service;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.UserFans;
import org.lanqiao.mapper.UserFansMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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
    public int insertSelective(UserFans userFans) {
        return userFansMapper.insertSelective(userFans);
    }

    @Override
    public int deleteFans(Integer userId, Integer fansId) {
        return userFansMapper.deleteFans(userId,fansId);
    }

    @Override
    public int selectFans(@RequestParam("userId") Integer userId,@RequestParam("fansId") Integer fansId) {
        return userFansMapper.selectFans(userId,fansId);
    }
}
