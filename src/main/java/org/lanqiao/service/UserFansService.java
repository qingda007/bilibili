package org.lanqiao.service;

import org.lanqiao.entity.UserFans;

public interface UserFansService {
    int fansCount(Integer userId);
    int beFansCount(Integer fansId);
    int insertSelective(UserFans record);
    int deleteFans(Integer userId,Integer fansId);
    int selectFans(Integer userId,Integer fansId);
}
