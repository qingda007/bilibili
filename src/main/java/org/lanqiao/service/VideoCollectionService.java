package org.lanqiao.service;

import org.lanqiao.entity.VideoCollection;

import java.util.List;

public interface VideoCollectionService {
    public List<VideoCollection> getVideoCollection(Integer userId,Integer currentPage);
}
