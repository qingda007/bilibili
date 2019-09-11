package org.lanqiao.service;

import org.lanqiao.entity.Video;
import org.lanqiao.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
