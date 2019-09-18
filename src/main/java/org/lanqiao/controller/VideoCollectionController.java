package org.lanqiao.controller;

import org.lanqiao.entity.VideoCollection;
import org.lanqiao.service.VideoCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class VideoCollectionController {
    @Autowired
    VideoCollectionService videoCollectionService;
    @RequestMapping("/getVideoCollection")
    public List<VideoCollection> getVideoCollection(Integer userId){
        return videoCollectionService.getVideoCollection(userId);
    }
//获取收藏数
    @RequestMapping("/getCollectionCount")
    public int selectIsCollection(Integer videoId , Integer userId){
        return videoCollectionService.selectIsCollection(videoId,userId);
    }

    //插入收藏
    @RequestMapping("/insertCollection")
    public int insertSelective(VideoCollection videoCollection) {
        return videoCollectionService.insertSelective(videoCollection);
    }
    //取消收藏
    @RequestMapping("/deleteCollection")
    public Integer deleteSelective(Integer videoId, Integer userId) {
        return videoCollectionService.deletecollect(videoId,userId);
    }
}
