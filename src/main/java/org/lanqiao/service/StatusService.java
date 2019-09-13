package org.lanqiao.service;
import org.lanqiao.entity.Status;

import java.util.List;

public interface StatusService {
    List<String> selectAllType1();
    List<String> selectType2ByType1(String type1);
    String selectIdByType(Status status);
}
