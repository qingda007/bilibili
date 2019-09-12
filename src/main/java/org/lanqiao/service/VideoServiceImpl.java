package org.lanqiao.service;

import org.lanqiao.entity.Video;
import org.lanqiao.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    VideoMapper videoMapper;
    @Override
    public Video selectVideoInfo(Integer videoId) {
        return videoMapper.selectByPrimaryKey(videoId);
    }
}
