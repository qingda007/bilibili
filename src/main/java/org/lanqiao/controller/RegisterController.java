package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.lanqiao.service.UserInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


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


    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(UserInfo userInfo, Model model){
        //调用service方法
        userInfo = userInfoService.checkLogin(userInfo.getUserName(), userInfo.getUserPassw());
        //若有user则添加到model里并且跳转到成功页面
        if(userInfo != null){
            model.addAttribute("userInfo",userInfo);
            return "zhuye";
        }else{
            return "login";
        }
    }

}
