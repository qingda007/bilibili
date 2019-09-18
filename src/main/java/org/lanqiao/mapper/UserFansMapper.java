package org.lanqiao.mapper;

import org.lanqiao.entity.UserFans;

import java.util.List;

public interface UserFansMapper {
    List<UserFans> followList(Integer fansId);

    List<UserFans> fansList(Integer userId);

    int fansCount(Integer userId);

    int beFansCount(Integer fansId);

    int deleteByPrimaryKey(Integer id);

    int insert(UserFans record);

    int insertSelective(UserFans record);

    UserFans selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserFans record);

    int updateByPrimaryKey(UserFans record);
}