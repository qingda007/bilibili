package org.lanqiao.controller;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.UserFans;
import org.lanqiao.service.UserFansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
    @RequestMapping("/insertFans")
    public int insertFans(UserFans userFans){
        return userFansService.insertSelective(userFans);
    }
    @RequestMapping("/deleteFans")
    public int deleteFans(Integer userId,Integer fansId){
        return userFansService.deleteFans(userId,fansId);
    }
    @RequestMapping("/selectFans")
    public int selectFans(Integer userId,Integer fansId){
        return userFansService.selectFans(userId,fansId);
    }

}
