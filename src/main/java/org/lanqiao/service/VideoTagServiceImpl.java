package org.lanqiao.service;

import org.lanqiao.entity.VideoTag;
import org.lanqiao.mapper.VideoTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoTagServiceImpl implements VideoTagService {
    @Autowired
    VideoTagMapper videoTagMapper;

    @Override
    public int addVideoTag(VideoTag videoTag) {
        return videoTagMapper.insert(videoTag);
    }

    @Override
    public int delVideoTag(VideoTag videoTag) {
        return videoTagMapper.delete(videoTag);
    }

    @Override
    public List<Integer> selectByTag(String tagName) {
        return videoTagMapper.SelectByTag(tagName);
    }
}
