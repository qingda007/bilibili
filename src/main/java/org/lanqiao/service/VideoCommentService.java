package org.lanqiao.service;

import org.lanqiao.entity.VideoComment;

import java.util.List;

public interface VideoCommentService {
    public List<VideoComment> selectAllComment(Integer videoId);
    public int insertMsg(VideoComment videoComment);
    public int selectCommentCount(Integer videoId);
}
