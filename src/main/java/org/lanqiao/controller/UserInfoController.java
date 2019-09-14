package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoCollection;
import org.lanqiao.service.UserInfoService;
import org.lanqiao.service.UserInfoServiceImpl;
import org.lanqiao.service.VideoService;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserInfoController {
@Autowired
UserInfoService userInfoService;
@Autowired
VideoServiceImpl videoService;
@RequestMapping("/getUserInfo")
    public UserInfo GetUserInfo(Integer id){
return userInfoService.selectByPrimaryKey(id);
}
    @RequestMapping("/getVideoUpload")
    public List<Video> GetVideoUpload(Integer userId) {
        return videoService.selectVideoUpload(userId);
    }
}
