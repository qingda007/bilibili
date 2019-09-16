package org.lanqiao.mapper;

import org.lanqiao.entity.VideoDanmu;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface VideoDanmuMapper {
    int deleteByPrimaryKey(Integer danmuId);

    int insert(VideoDanmu record);

    int insertSelective(VideoDanmu record);

    VideoDanmu selectByPrimaryKey(Integer danmuId);

    int updateByPrimaryKeySelective(VideoDanmu record);

    int updateByPrimaryKey(VideoDanmu record);
    List<VideoDanmu> selectAllDanmu(Integer videoId);

    int selectDanmuCount(Integer videoId);
}