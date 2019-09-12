package org.lanqiao.service;

import org.lanqiao.entity.VideoCollection;
import org.lanqiao.mapper.VideoCollectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoCollectionServiceImpl implements VideoCollectionService{
    @Autowired
    VideoCollectionMapper videoCollectionMapper;
    @Override
    public List<VideoCollection> getVideoCollection(Integer userId) {
        return videoCollectionMapper.getVideoCollection(userId);
    }
}
