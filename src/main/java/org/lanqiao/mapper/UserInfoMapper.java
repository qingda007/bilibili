package org.lanqiao.mapper;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoMapper {
    List<Video> selectVideoUpload(Integer userId);

    int deleteByPrimaryKey(Integer userId);

    //注册用的方法
    int registerUser(UserInfo userInfo);

    //登陆用的方法
    UserInfo findByUsername(String userName);

    //登陆时改变激活状态
    void updateStatus(String userName);


    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}