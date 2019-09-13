package org.lanqiao.util;

import java.util.ArrayList;
import java.util.List;

public class StringOp {
    public List<String> strDistinct(List<String> list) {
        //新建新List集合，用于存放去重后的元素
        List<String> newList = new ArrayList<String>();
        //循环遍历旧集合元素
        for(int i = 0; i < list.size(); i++ ){
            //判断新集合是否包含有，如果不包含有，则存入新集合中
            boolean isContains = newList.contains(list.get(i));
            if(!isContains){
                newList.add(list.get(i));
            }
        }
        return newList;
    }
}
