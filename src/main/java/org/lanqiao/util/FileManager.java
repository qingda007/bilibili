package org.lanqiao.util;

import org.lanqiao.entity.Video;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileManager {
    public List<String> delSpareFile(List<Video> videos){
        List<String> fileName = new ArrayList<>();
        File file = new File("/usr/local/bilibili/videoData");
        File[] files = file.listFiles();
        for (File f : files) {
            int i;
            for(i = 0; i < videos.size(); i++){
                if(videos.get(i).getVideoUrl().contains(f.getName())||videos.get(i).getVideoPic().contains(f.getName())){
                    break;
                }
            }
            if(i==videos.size()){
                fileName.add(f.getAbsolutePath());
                f.delete();
            }
        }
        return fileName;
    }
    public List<String> getFileName(String path){
        List<String> fileName = new ArrayList<>();
        File file = new File(path);
        File[] files = file.listFiles();
        for (File f : files) {
            fileName.add(f.getName());
        }
        return fileName;
    }
}
