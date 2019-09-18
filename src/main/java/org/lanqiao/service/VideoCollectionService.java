package org.lanqiao.service;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.VideoCollection;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoCollectionService {
    public List<VideoCollection> getVideoCollection(Integer userId);

    public int collectionCount(Integer videoId);
//    查看是否已经收藏
    public int selectIsCollection(Integer videoId, Integer userId);

    //插入收藏
    public int insertSelective(VideoCollection videoCollection);
    //取消收藏
    public Integer deletecollect(Integer videoId,Integer userId);
}
