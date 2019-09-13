package org.lanqiao.service;

import org.lanqiao.entity.VideoComment;
import org.lanqiao.mapper.VideoCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoCommmentServiceImpl implements VideoCommentService {
    @Autowired
    VideoCommentMapper videoCommentMapper;

    @Override
    public List<VideoComment> selectAllComment(Integer videoId) {
        return videoCommentMapper.selectAllComment(videoId);
    }

    @Override
    public int insertMsg(VideoComment videoComment) {
        return videoCommentMapper.insertSelective(videoComment);
    }
}
