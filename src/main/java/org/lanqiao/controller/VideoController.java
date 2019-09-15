package org.lanqiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoComment;
import org.lanqiao.entity.VideoDanmu;
import org.lanqiao.service.VideoCommmentServiceImpl;
import org.lanqiao.service.VideoDanmuService;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

    @Autowired
    VideoDanmuService videoDanmuService;

    @RequestMapping("/videoInfo")
    public Video selsctVideoInfo(Integer videoId){
        return videoService.selectVideoInfo(videoId);
    }

    @RequestMapping("/commentInfo")
    public List<VideoComment> selectComment(Integer videoId){
        return videoCommmentService.selectAllComment(videoId);
    }

    @RequestMapping("/danmuInfo")
    public List<VideoDanmu> selectDanmu(Integer videoId){
        return videoDanmuService.selectAllDanmu(videoId);
    }



//    @RequestMapping("/index")
//    public ModelAndView selectALl(Integer videoId, ModelMap model){
//        Video video=videoService.selectVideoInfo(videoId);
//        List<VideoComment> videoCommentList =videoCommmentService.selectAllComment(videoId);
//        List<VideoDanmu> videoDanmuList=videoDanmuService.selectAllDanmu(videoId);
//        model.addAttribute("video",video);
//        model.addAttribute("p",videoCommentList);
//        model.addAttribute("danmu",videoDanmuList);
//        ModelAndView modelAndView = new ModelAndView("player",model);
//        return modelAndView;
////        return new ModelAndView("player","video",video);
//    }



//    @RequestMapping("/videoInfo")
//    public ModelAndView selectAll(Integer videoId){
//       Video video=videoService.selectVideoInfo(videoId);
//        return new ModelAndView("player","video",video);
//    }
//    @RequestMapping("MsgInfo")
//    public ModelAndView selectMsg(Integer videoId){
//        List<VideoComment> videoCommentList=videoCommmentService.selectAllComment(videoId);
//        return new ModelAndView("player","comment",videoCommentList);
//    }

    @RequestMapping("/insert")
    public String insertMsg(VideoComment videoComment){
        videoCommmentService.insertMsg(videoComment);
        return "redirect:index";
    }



}
