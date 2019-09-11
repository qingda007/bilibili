package org.lanqiao.mapper;

import org.lanqiao.entity.Video;
import org.springframework.stereotype.Repository;

@Repository
public interface VideoMapper {
    int deleteByPrimaryKey(Integer videoId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer videoId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
}