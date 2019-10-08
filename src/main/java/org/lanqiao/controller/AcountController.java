package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@RestController
@RequestMapping("/account")
public class AcountController {
    @Autowired
    UserInfoService userInfoService;
    @RequestMapping("/account")
    public ModelAndView index(){
        ModelAndView mv=new ModelAndView("account");
        return mv;
    }
    @RequestMapping("/changeuserinfo")
    public ModelAndView ChangeUserInfo(UserInfo userInfo){
        userInfoService.updateByPrimaryKeySelective(userInfo);
        ModelAndView mv=new ModelAndView("account");
        return mv;
    }
}