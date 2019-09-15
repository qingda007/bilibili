package org.lanqiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoCollection;
import org.lanqiao.service.VideoCollectionService;

import org.lanqiao.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
public class VideoCollectionController {
    @Autowired
    VideoCollectionService videoCollectionService;
    @RequestMapping("/getVideoCollection")
    public List<VideoCollection> getVideoCollection(Integer userId){
        return videoCollectionService.getVideoCollection(userId);
    }
}
