package org.lanqiao.service;
import org.lanqiao.entity.Status;
import org.lanqiao.entity.Video;

import java.util.List;

public interface StatusService {
    List<String> selectAllType1();
    List<String> selectType2ByType1(String type1);
    String selectIdByType(Status status);
    Status selectStatusById(String statusId);
    //查找一级分区对应的视频数量
    int countType1(String type1);
}
