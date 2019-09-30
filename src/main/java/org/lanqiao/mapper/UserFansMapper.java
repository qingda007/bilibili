package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.UserFans;

import java.util.List;

public interface UserFansMapper {
    List<UserFans> followList(Integer fansId);

    List<UserFans> fansList(Integer userId);

    Integer fansCount(Integer userId);

    Integer beFansCount(Integer fansId);

    int deleteByPrimaryKey(Integer id);

    int insert(UserFans record);

    int insertSelective(UserFans record);

    UserFans selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserFans record);

    int updateByPrimaryKey(UserFans record);

    int deleteFans(@Param("userId") Integer userId,@Param("fansId") Integer fansId);

    int selectFans(@Param("userId") Integer userId,@Param("fansId") Integer fansId);
}