package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoCollection;
import org.lanqiao.service.UserInfoService;
import org.lanqiao.service.UserInfoServiceImpl;
import org.lanqiao.service.VideoService;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
public class UserInfoController {
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    VideoServiceImpl videoService;

    @RequestMapping("/getUserInfo")
    public UserInfo GetUserInfo(Integer id) {
        return userInfoService.selectByPrimaryKey(id);
    }

    @RequestMapping("/getVideoUpload")
    public List<Video> GetVideoUpload(Integer userId) {
        return videoService.selectVideoUpload(userId);
    }

    //统计在线人数
    @RequestMapping("/liveUserNum")
    public int countUserNum(String userType){
        return userInfoService.countUserNum(userType);
    }

    int uid;
    @RequestMapping(value = "/toUser")
    public int toUser(Integer id){
        uid=id;
        return uid;
    }
    @RequestMapping("/user")
    public ModelAndView user(){
        ModelAndView user=new ModelAndView("user");
//        user.addObject("id",uid);
        return user;
    }

    @RequestMapping("/bilibili")
    public ModelAndView zhuye(){
        ModelAndView bilibili=new ModelAndView("bilibili");
        return bilibili;
    }

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request){
        ModelAndView mv=new ModelAndView("user");
        HttpSession session=request.getSession();
        UserInfo userInfo=new UserInfo();
        userInfo=userInfoService.selectByPrimaryKey(1);
        session.setAttribute("userinfo",userInfo);
        return mv;
    }
}
