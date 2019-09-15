package org.lanqiao.service;

import org.lanqiao.entity.VideoCollection;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface VideoCollectionService {
    public List<VideoCollection> getVideoCollection(Integer userId);
}
