package org.lanqiao.controller;

import org.lanqiao.service.UserFansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
