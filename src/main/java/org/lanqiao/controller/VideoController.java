package org.lanqiao.controller;

import org.lanqiao.entity.User;
import org.lanqiao.entity.Video;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("video")
public class VideoController {
    @Autowired
    VideoServiceImpl videoService;

    @RequestMapping("/videoInfo")
    @ResponseBody
    public ModelAndView selectVideoInfo(Integer videoId){
        Video video=videoService.selectVideoInfo(videoId);
        return new ModelAndView("player","video",video);
    }

//    public User select(userId){
//        return videoService.selectVideoInfo(userId);
//    }


}
