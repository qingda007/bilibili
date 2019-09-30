package org.lanqiao.service;

import org.apache.ibatis.annotations.Param;
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

    @Override
    public int updateByPrimaryKeySelective(Video video) {
        return videoMapper.updateByPrimaryKeySelective(video);
    }

    @Override
    public int updateByPrimaryKey(Video video) {
        return videoMapper.updateByPrimaryKey(video);
    }

    @Override
    public Video selectStatus(Integer videoId) {
        return videoMapper.selectStatus(videoId);
    }

    @Override
    public List<Video> getByKeyword(@Param("videoTitle")String videoTitle) {
        return videoMapper.getByKeyword(videoTitle);
    }
}
