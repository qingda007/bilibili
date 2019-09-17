package org.lanqiao.service;

import org.lanqiao.entity.VideoDanmu;
import org.lanqiao.mapper.VideoDanmuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoDanmuServiceImpl implements VideoDanmuService {

    @Autowired
    VideoDanmuMapper videoDanmuMapper;
    @Override
    public List<VideoDanmu> selectAllDanmu(Integer videoId) {
        return videoDanmuMapper.selectAllDanmu(videoId);
    }

    @Override
    public int selectDanmuCount(Integer videoId) {
        return videoDanmuMapper.selectDanmuCount(videoId);
    }

    @Override
    public int insertSelective(VideoDanmu videoDanmu) {
        return videoDanmuMapper.insertSelective(videoDanmu);
    }
}
