package org.lanqiao.mapper;

import org.lanqiao.entity.Status;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StatusMapper {
    //查找所有一级分区
    List<String> selectAllType1();
    //查找一级分区对应的二级分区
    List<String> selectType2ByType1(String type1);
    //查找一二级分区对应的statusId
    String selectIdByType(Status status);

    int deleteByPrimaryKey(String statusId);

    int insert(Status record);

    int insertSelective(Status record);

    Status selectByPrimaryKey(String statusId);

    int updateByPrimaryKeySelective(Status record);

    int updateByPrimaryKey(Status record);
}