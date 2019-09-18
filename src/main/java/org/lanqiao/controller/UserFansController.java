package org.lanqiao.controller;

import org.lanqiao.entity.UserFans;
import org.lanqiao.service.UserFansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserFansController {
    @Autowired
    UserFansService userFansService;
    @RequestMapping("/getFansCount")
    public int GetFansCount(int userId){
        return userFansService.fansCount(userId);
    }
    @RequestMapping("/getBeFansCount")
    public int GetBeFansCount(int fansId){
        return userFansService.beFansCount(fansId);
    }
    @RequestMapping("/getFansList")
    public List<UserFans> GetFansList(int userId){return userFansService.fansList(userId);}
    @RequestMapping("/getFollowList")
    public List<UserFans> GetFollowList(int fansId){return userFansService.followList(fansId);}
}
