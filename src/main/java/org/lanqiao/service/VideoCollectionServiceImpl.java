package org.lanqiao.service;


import org.lanqiao.entity.VideoCollection;
import org.lanqiao.mapper.VideoCollectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoCollectionServiceImpl implements VideoCollectionService {
    @Autowired
    VideoCollectionMapper videoCollectionMapper;
    @Override
    public List<VideoCollection> getVideoCollection(Integer userId) {
        return videoCollectionMapper.getVideoCollection(userId);
    }

    @Override
    public int collectionCount(Integer videoId) {
        return videoCollectionMapper.collectionCount(videoId);
    }

    @Override
    public int selectIsCollection(Integer videoId, Integer userId) {
        return videoCollectionMapper.selectIsCollection(videoId,userId);
    }

    @Override
    public int insertSelective(VideoCollection videoCollection) {
        return videoCollectionMapper.insertSelective(videoCollection);
    }

    @Override
    public Integer deletecollect(Integer videoId, Integer userId) {
        return videoCollectionMapper.deletecollect(videoId,userId);
    }

}
