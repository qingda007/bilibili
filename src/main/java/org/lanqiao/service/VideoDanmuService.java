package org.lanqiao.service;

import org.lanqiao.entity.VideoDanmu;

import java.util.List;

public interface VideoDanmuService {
    public List<VideoDanmu> selectAllDanmu(Integer videoId);
    public int selectDanmuCount(Integer videoId);
}
