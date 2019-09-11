package org.lanqiao.mapper;

import org.lanqiao.entity.VideoTag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface VideoTagMapper {

    int insert(VideoTag record);

    int delete(VideoTag record);

    List<Integer> SelectByTag(String tagName);
}