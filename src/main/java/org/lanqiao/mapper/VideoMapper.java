package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoMapper {
    List<Video> selectVideoUpload(Integer userId);

    List<Video> selectUploadVideo(Integer userId);

    int countIsReview(@Param("userId")Integer userId, @Param("isReview") Integer isReview);

    List<Video> selectVideoByIsReview(@Param("userId")Integer userId, @Param("isReview")Integer isReview);

    int countByPlay(@Param("userId")Integer userId);
    int countByLike(@Param("userId")Integer userId);
    int countByDanmu(@Param("userId")Integer userId);
    int countByCollection(@Param("userId")Integer userId);
    int countByCoin(@Param("userId")Integer userId);

    int deleteByPrimaryKey(Integer videoId);

    int insert(Video record);
    //用来插入新video
    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer videoId);
    //用来更新video

    Video selectUpInfo(Integer videoId);
    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
}