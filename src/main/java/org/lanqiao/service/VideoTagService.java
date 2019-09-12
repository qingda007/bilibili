package org.lanqiao.service;

import org.lanqiao.entity.VideoTag;

import java.util.List;

public interface VideoTagService {
    int addVideoTag(VideoTag videoTag);
    int delVideoTag(VideoTag videoTag);
    List<Integer> selectByTag(String tagName);
}
