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
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class VideoCollectionController {
    @Autowired
    VideoCollectionService videoCollectionService;
    VideoService videoService;
    @RequestMapping("/index")
    public ModelAndView getAll(@RequestParam(value = "pageNo", defaultValue = "1") int pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<VideoCollection> videoCollectionList = videoCollectionService.getVideoCollection(2);
        PageInfo<VideoCollection> p = new PageInfo<VideoCollection>(videoCollectionList);
        return new ModelAndView("user", "pageInfo", p);
    }

}
