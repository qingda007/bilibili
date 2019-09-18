package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.UserFans;

public interface UserFansMapper {
    int fansCount(Integer userId);

    int beFansCount(Integer fansId);

    int deleteByPrimaryKey(Integer id);

    int insert(UserFans record);

    int insertSelective(UserFans record);

    UserFans selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserFans record);

    int updateByPrimaryKey(UserFans record);

    int deleteFans(@Param("userId") Integer userId,@Param("fansId") Integer fansId);

    int selectFans(@Param("userId") Integer userId,@Param("fansId") Integer fansId);
}