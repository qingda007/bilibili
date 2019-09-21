package org.lanqiao.service;

import org.lanqiao.entity.Video;
import org.lanqiao.mapper.UserFansMapper;
import org.lanqiao.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    VideoMapper videoMapper;
    @Autowired
    UserFansMapper userFansMapper;

    @Override
    public int uploadVideo(Video video) {
        return videoMapper.insertSelective(video);
    }
    @Override
    public int modifyVideo(Video video){
        return videoMapper.updateByPrimaryKeySelective(video);
    }

    @Override
    public List<Video> selectUploadVideo(int userId) { return videoMapper.selectUploadVideo(userId); }

    @Override
    public Integer countIsReview(int userId, int isReview) {
        return videoMapper.countIsReview(userId, isReview);
    }

    @Override
    public List<Video> selectVideoByIsReview(int userId, int isReview) {
        return videoMapper.selectVideoByIsReview(userId, isReview);
    }

    @Override
    public int delVideo(int videoId) {
        return videoMapper.deleteByPrimaryKey(videoId);
    }

    @Override
    public int countByWord(int userId, String word) {
        if("play".equals(word)) return videoMapper.countByPlay(userId);
        else if("like".equals(word)) return videoMapper.countByLike(userId);
        else if("danmu".equals(word)) return videoMapper.countByDanmu(userId);
        else if("collection".equals(word)) return videoMapper.countByCollection(userId);
        else if("coin".equals(word)) return videoMapper.countByCoin(userId);
        else return 0;
    }

    @Override
    public List<Integer> countVideoInfo(int userId) {
        List<Integer> videoInfo = new ArrayList<>();
        Integer play = videoMapper.countByPlay(userId);
        Integer like = videoMapper.countByLike(userId);
        Integer danmu = videoMapper.countByDanmu(userId);
        Integer collection = videoMapper.countByCollection(userId);
        Integer coin = videoMapper.countByCoin(userId);
        Integer fans = userFansMapper.fansCount(userId);
        videoInfo.add(play==null?0:play);
        videoInfo.add(like==null?0:like);
        videoInfo.add(danmu==null?0:danmu);
        videoInfo.add(collection==null?0:collection);
        videoInfo.add(coin==null?0:coin);
        videoInfo.add(fans==null?0:fans);
        return videoInfo;
    }
}
