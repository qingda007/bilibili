package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping("/user")
public class RegisterController {
    @Autowired
    UserInfoService userInfoService;

    //正常访问注册页面
    @RequestMapping("/toRegister")
    public String register() {
        return "register";
    }
    //真正转到注册页面
    @RequestMapping("/doRegister")
    public String register( UserInfo userInfo) {
        userInfoService.registerUser(userInfo);
        return "login";
    }

    @RequestMapping("toLogin")
    public String login(){
        return "login";
    }


    //表单提交过来的路径
    @RequestMapping("/checkLogin")

    public String checkLogin(UserInfo userInfo,  ModelMap model){
        //调用service方法
         userInfoService.checkLogin(userInfo.getUserName(), userInfo.getUserPassw());
         userInfo = userInfoService.updateStatus(userInfo.getUserName());
        //若有user则添加到model里并且跳转到成功页面
        if(userInfo != null){
            model.addAttribute("userInfo",userInfo);
            return "zhuye";
        }else{
            return "login";
        }
    }

}
