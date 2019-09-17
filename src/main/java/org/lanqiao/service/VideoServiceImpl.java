package org.lanqiao.service;

import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    VideoMapper videoMapper;
    @Override
    public Video selectVideoInfo(Integer videoId) {
        return videoMapper.selectByPrimaryKey(videoId);
    }

    @Override
    public List<Video> selectVideoUpload(Integer userId) {
        return videoMapper.selectVideoUpload(userId);
    }

    @Override
    public Video selectUpInfo(Integer videoId) {
        return videoMapper.selectUpInfo(videoId);
    }


}
