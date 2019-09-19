package org.lanqiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoComment;
import org.lanqiao.entity.VideoDanmu;
import org.lanqiao.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/video")
public class VideoController {
    @Autowired
    VideoServiceImpl videoService;

    @Autowired
    VideoCommmentServiceImpl videoCommmentService;

    @Autowired
    VideoDanmuServiceImpl videoDanmuService;

    @Autowired
    StatusServiceImpl statusService;

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

    @RequestMapping("/upInfo")
    public Video selectUpInfo(Integer videoId){
        return videoService.selectUpInfo(videoId);
    }

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

    @RequestMapping("/typeCount")
    public int countType1(String type1){
        return statusService.countVideoByType1(type1);
    }

    @RequestMapping("/like")
    public int updateLike(Video video){
        return videoService.updateByPrimaryKeySelective(video);
    }

    @RequestMapping("/coin")
    public int updataVideoCoin(Video video){
        return videoService.updateByPrimaryKey(video);
    }

    @RequestMapping("/videoStatus")
    public Video selectStatus(Integer videoId){
        return videoService.selectStatus(videoId);
    }

    @ResponseBody
    @RequestMapping("/show")
    public ModelAndView getByKeyword(@RequestParam(value="pageNo", defaultValue = "1") int pageNum, String videoTitle) {
        PageHelper.startPage(pageNum,20);
        List<Video> videoList= videoService.getByKeyword(videoTitle);
        PageInfo<Video> p = new PageInfo<>(videoList);
        return new ModelAndView("show", "pageInfo", p);
    }
}
