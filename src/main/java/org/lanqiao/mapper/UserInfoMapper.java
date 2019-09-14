package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoMapper {
    List<Video> selectVideoUpload(Integer userId);

    int deleteByPrimaryKey(Integer userId);

    int insertUser(UserInfo userInfo);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}