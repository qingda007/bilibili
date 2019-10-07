package org.lanqiao.mapper;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.Video;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoMapper {
    List<Video> selectVideoUpload(Integer userId);

    List<Video> selectUploadVideo(Integer userId);

    Integer countIsReview(@Param("userId")Integer userId, @Param("isReview") Integer isReview);

    List<Video> selectVideoByIsReview(@Param("userId")Integer userId, @Param("isReview")Integer isReview);

    Integer countByPlay(@Param("userId")Integer userId);
    Integer countByLike(@Param("userId")Integer userId);
    Integer countByDanmu(@Param("userId")Integer userId);
    Integer countByCollection(@Param("userId")Integer userId);
    Integer countByCoin(@Param("userId")Integer userId);

    int deleteByPrimaryKey(Integer videoId);

    int insert(Video record);
    //用来插入新video
    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer videoId);
    //用来更新video

    Video selectUpInfo(Integer videoId);

    //点赞功能
    int updateByPrimaryKeySelective(Video record);
    //投币功能
    int updateByPrimaryKey(Video record);

    Video selectStatus(Integer videoId);

    List<Video> getByKeyword(@Param(value="videoTitle")String videoTitle);

    List<Video> selectAllVideo();
}