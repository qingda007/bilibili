package org.lanqiao.controller;

import org.lanqiao.entity.UserInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
public class playerController {
    @RequestMapping("/player")
    public ModelAndView player(Integer videoId, HttpServletRequest request){
        UserInfo userInfo = new UserInfo();
        userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("player");
        mv.addObject("videoId",videoId);
        mv.addObject("userId",userInfo.getUserId());
        return mv;
    }
}
