package org.lanqiao.service;

import org.lanqiao.entity.UserFans;

import java.util.List;

public interface UserFansService {
    int fansCount(Integer userId);
    int beFansCount(Integer fansId);
    List<UserFans> fansList(Integer userId);
    List<UserFans>followList(Integer fansId);
}
