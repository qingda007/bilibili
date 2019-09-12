package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class RegisterController {
    @Autowired
    UserInfoService userInfoService;


    @RequestMapping("/doRegister")
    public String register(UserInfo userInfo) {
        int index = userInfoService.insertUser(userInfo);
        return "redirect:login.jsp";
//        if(index<0){
//            return "/register.jsp";
//        }else{
//            return "/login.jsp";
//        }
    }

    @RequestMapping("/toRegister")
    public String register() {
        return "register";
    }
}
