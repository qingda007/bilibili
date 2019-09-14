package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.lanqiao.service.UserInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserInfoController {
@Autowired
UserInfoService userInfoService;
@RequestMapping("/getUserInfo")
    public UserInfo GetUserInfo(Integer id){
return userInfoService.selectByPrimaryKey(id);
}
}
