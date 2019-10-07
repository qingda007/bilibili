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
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        if(userInfo==null){
            mv.addObject("userId",0);
        }
        else mv.addObject("userId",userInfo.getUserId());
        mv.setViewName("player");
        mv.addObject("videoId",videoId);
        return mv;
    }
}
