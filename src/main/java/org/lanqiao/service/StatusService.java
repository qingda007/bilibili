package org.lanqiao.service;
import java.util.List;

public interface StatusService {
    List<String> selectAllType1();
    List<String> selectType2ByType1(String type1);
}
