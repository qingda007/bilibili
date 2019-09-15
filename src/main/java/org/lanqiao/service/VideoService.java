package org.lanqiao.service;

import org.lanqiao.entity.Video;

import java.util.List;

public interface VideoService {
    public Video selectVideoInfo(Integer videoId);

    public List<Video> selectVideoUpload(Integer userId);
}
