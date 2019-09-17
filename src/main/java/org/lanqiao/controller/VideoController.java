package org.lanqiao.controller;

import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoComment;
import org.lanqiao.entity.VideoDanmu;
import org.lanqiao.service.VideoCommmentServiceImpl;
import org.lanqiao.service.VideoDanmuService;
import org.lanqiao.service.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/video")
public class VideoController {
    @Autowired
    VideoServiceImpl videoService;

    @Autowired
    VideoCommmentServiceImpl videoCommmentService;

    @Autowired
    VideoDanmuService videoDanmuService;

    @RequestMapping("/videoInfo")
    public Video selectVideoInfo(Integer videoId){
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

//    @RequestMapping("/upInfo")
//    public Video selectUpInfo(Integer videoId){
//        return videoService.selectUpInfo(videoId);
//    }

    @RequestMapping("/insertComment")
    public int insertMsg(VideoComment videoComment){
       return videoCommmentService.insertMsg(videoComment);
    }

    @RequestMapping("/insertDanmu")
    public int insertDanmu(VideoDanmu videoDanmu){
        return videoDanmuService.insertSelective(videoDanmu);
    }

    @RequestMapping("/commentCount")
    public int videoCommentCount(Integer videoId){
        return  videoCommmentService.selectCommentCount(videoId);
    }

    @RequestMapping("/danmuCount")
    public int videoDanmuCount(Integer videoId){
        return videoDanmuService.selectDanmuCount(videoId);
    }

}
