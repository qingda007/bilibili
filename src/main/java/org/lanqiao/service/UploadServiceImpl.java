package org.lanqiao.service;

import org.lanqiao.entity.Video;
import org.lanqiao.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    VideoMapper videoMapper;
    @Override
    public int uploadVideo(Video video) {
        return videoMapper.insertSelective(video);
    }
    @Override
    public int modifyVideo(Video video){
        return videoMapper.updateByPrimaryKeySelective(video);
    }

    @Override
    public List<Video> selectUploadVideo(int userId) {
        return videoMapper.selectUploadVideo(userId);
    }

    @Override
    public int countIsReview(int isReview) {
        return videoMapper.countIsReview(isReview);
    }

    @Override
    public List<Video> selectVideoByIsReview(int userId, int isReview) {
        return videoMapper.selectVideoByIsReview(userId, isReview);
    }

    @Override
    public int delVideo(int videoId) {
        return videoMapper.deleteByPrimaryKey(videoId);
    }
}
