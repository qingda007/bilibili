package org.lanqiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoComment;
import org.lanqiao.service.VideoCommmentServiceImpl;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("video")
public class VideoController {
    @Autowired
    VideoServiceImpl videoService;

    @Autowired
    VideoCommmentServiceImpl videoCommmentService;

    @RequestMapping("/videoInfo")
    public ModelAndView selectVideoInfo(Integer videoId){
        Video video=videoService.selectVideoInfo(1);
        return new ModelAndView("player","video",video);
    }

    @RequestMapping("/Msg")
    public PageInfo selectAllComment(@RequestParam(value = "pageNo",defaultValue = "1") int pageNum,Integer videoId){
        PageHelper.startPage(pageNum,7);
        List<VideoComment> videoCommentList =videoCommmentService.selectAllComment(videoId);
        PageInfo<VideoComment> p =new PageInfo<>(videoCommentList);
        return p;
    }

//    @RequestMapping("/Msg")
//    @ResponseBody
//    public List selectAllComment(@RequestParam(value = "pageNo",defaultValue = "1") int pageNum){
//        PageHelper.startPage(pageNum,7);
//        List<VideoComment>videoCommentList =videoCommmentService.selectAllComment(1);
//        PageInfo<VideoComment> p =new PageInfo<>(videoCommentList);
//
//        return  videoCommentList;
//    }

    @RequestMapping("/insert")
    public String insertMsg(VideoComment videoComment){
        videoCommmentService.insertMsg(videoComment);
        return "redirect:Msg";
    }
//    public User select(userId){
//        return videoService.selectVideoInfo(userId);
//    }


}
