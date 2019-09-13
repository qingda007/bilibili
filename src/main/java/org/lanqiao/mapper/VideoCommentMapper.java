package org.lanqiao.mapper;

import org.lanqiao.entity.VideoComment;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface VideoCommentMapper {
    int deleteByPrimaryKey(Integer comId);

    int insert(VideoComment record);

    int insertSelective(VideoComment record);

    VideoComment selectByPrimaryKey(Integer comId);

    int updateByPrimaryKeySelective(VideoComment record);

    int updateByPrimaryKey(VideoComment record);
    List<VideoComment> selectAllComment(Integer videoId);
}