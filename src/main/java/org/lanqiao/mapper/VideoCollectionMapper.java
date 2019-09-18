package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoCollection;

import java.util.List;

public interface VideoCollectionMapper {
    List<VideoCollection> getVideoCollection(Integer userId);

    int deleteByPrimaryKey(Integer collectId);

    int insert(VideoCollection record);

    int insertSelective(VideoCollection record);

    VideoCollection selectByPrimaryKey(Integer collectId);

    int updateByPrimaryKeySelective(VideoCollection record);

    int updateByPrimaryKey(VideoCollection record);

    int collectionCount(Integer videoId);

    int selectIsCollection(@Param("videoId") Integer videoId,@Param("userId") Integer userId);

    Integer deletecollect(@Param("videoId") Integer videoId,@Param("userId") Integer userId);

}