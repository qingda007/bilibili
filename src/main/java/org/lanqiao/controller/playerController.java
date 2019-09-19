package org.lanqiao.controller;

import org.springframework.web.servlet.ModelAndView;

public class playerController {
    public ModelAndView player(Integer videoId,Integer userId){
        ModelAndView mv = new ModelAndView("player");
        return mv;
    }
}
