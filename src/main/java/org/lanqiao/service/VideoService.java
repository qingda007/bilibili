package org.lanqiao.service;

import org.lanqiao.entity.Video;

import java.util.List;

public interface VideoService {
    public Video selectVideoInfo(Integer videoId);

    public List<Video> selectVideoUpload(Integer userId);

    public Video selectUpInfo(Integer videoId);
    //点赞
    public int updateByPrimaryKeySelective(Video record);
    //投币
    public int updateByPrimaryKey(Video video);

    public Video selectStatus(Integer videoId);

    public List<Video> getByKeyword(String videoTitle);
}
