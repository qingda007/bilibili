package org.lanqiao.util;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class Ffmpeg {

    //ffmpeg安装目录
    public static String FFMPEG_PATH ="/home/bilibili/ffmpeg.exe";

    //设置图片大小
    private final static String IMG_SIZE = "1920x1080";

    /**
     * 视频截图方法（windows）
     */
    public String getImages(String videoPath, String imagePath, String uuid){
        int second = (int) new ReadVideo().readVideoSecond(videoPath);
        imagePath = imagePath + "/"+ uuid + "_";
        for(int i=1; i<5; i++){
            String imageUrl = imagePath + i + ".jpg";
            ffmpegToImage(videoPath,imageUrl,i*((second-1)/5));
        }
//        String imageUrl = imagePath + "test.jpg";
//        ffmpegToImage(videoPath,imageUrl,second-1);
        File file = new File(imagePath+"4.jpg");
        while(!file.exists());
        return uuid + "_";
    }
    public boolean ffmpegToImage(String videoPath,String imagePath,int timePoint){
        List<String> commands = new ArrayList<String>();
        FFMPEG_PATH= FFMPEG_PATH.replace("%20", " ");
        commands.add(FFMPEG_PATH);
        commands.add("-ss");
        commands.add(timePoint+"");//这个参数是设置截取视频多少秒时的画面
        commands.add("-i");
        commands.add(videoPath);
        commands.add("-y");
        commands.add("-f");
        commands.add("image2");
      //  commands.add("mjpeg");
        commands.add("-t");
        commands.add("0.001");
        commands.add("-s");
        commands.add(IMG_SIZE); //这个参数是设置截取图片的大小
//        commands.add("-vframes");
//        commands.add("1");//截取1帧
        commands.add(imagePath);
        try {
            ProcessBuilder builder = new ProcessBuilder();
        //    builder.directory(new File("/home//"));//切换工作目录，不加这一句还真不行，此目录为你ffmpeg文件夹的存放目录
            builder.command(commands);
//            builder.start();
            builder.redirectErrorStream(true);
            // builder.start();
            Process process = builder.start();
            InputStream in =process.getInputStream();
            byte[] re = new byte[1024];
            while (in.read(re) != -1) {
            }
            in.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean isExist(String dataPath){
        File file = new File("/home/bilibili"+dataPath);
        return file.exists();
    }
    public String getUuid(String fileName){
        File file = new File(fileName);
        return file.getName().substring(0, 32);
    }
    public String getRelDir(String absDir){
        File file = new File(absDir);
        String relDir = "/videoData/" + file.getName();
        return relDir;
    }
    public String getDataDir(String relDir){
        return "/home/bilibili" + relDir;
    }
    public String getPhyDir(String absDir){
        File file = new File(absDir);
        String relDir = "/home/bilibili/teporary/" + file.getName();
        return relDir;
    }
    public String moveFile(String path1){
        File file = new File(path1);
        String path2 = "/home/bilibili/videoData/";
        moveFile(path1, path2);
        return path2 + file.getName();
    }
    public boolean moveFile(String path1, String path2){
        File testFile = new File(path1);
        return testFile.renameTo(new File(path2 + testFile.getName()));
    }
    public boolean createFile(String userDir){
        File fileDir =new File(userDir);
        if(!fileDir.exists()){//如果文件夹不存在
            return fileDir.mkdir();//创建文件夹
        }
        else {
            return false;
        }
    }
    public void delUuidFile(String uuid){
        File file = new File("/home/bilibili/teporary");
        File[] files = file.listFiles();
        for (File f : files) {
            if(f.getName().contains(uuid)){
                delFile(f);
            }
        }
    }
    public void delDataFile(String path){
        path = getDataDir(path);
        File file = new File(path);
        delFile(file);
    }
    public boolean delFile(File file) {
        if (!file.exists()) {
            return false;
        }
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File f : files) {
                delFile(f);
            }
        }
        return file.delete();
    }
    /**
     * @Description 文件是否能被ffmpeg解析
     */
    public int checkFileType(String fileName) {
        String type = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length())
                .toLowerCase();
        if (type.equals("avi")) {
            return 0;
        }  else if (type.equals("mov")) {
            return 0;
        } else if (type.equals("mp4")) {
            return 0;
        }  else if (type.equals("flv")) {
            return 0;
        }
        else if (type.equals("png")) {
            return 1;
        } else if (type.equals("jpg")) {
            return 1;
        } else if (type.equals("jpeg")) {
            return 1;
        }
        return 9;
    }
}
