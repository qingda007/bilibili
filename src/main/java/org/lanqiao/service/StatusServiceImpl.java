package org.lanqiao.service;

import org.lanqiao.entity.Status;
import org.lanqiao.mapper.StatusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StatusServiceImpl implements StatusService {
    @Autowired
    StatusMapper statusMapper;
    @Override
    public List<String> selectType2ByType1(String type1) {
        return statusMapper.selectType2ByType1(type1);
    }
    @Override
    public List<String> selectAllType1() {
        return statusMapper.selectAllType1();
    }
    @Override
    public String selectIdByType(Status status){
        return statusMapper.selectIdByType(status);
    }
}
