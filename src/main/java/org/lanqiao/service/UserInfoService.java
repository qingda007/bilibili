package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;

public interface UserInfoService {
    UserInfo selectByPrimaryKey(Integer id);
}
