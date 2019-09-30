package org.lanqiao.util;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VideoFormatUtil {
    private static Logger log = Logger.getLogger(VideoFormatUtil.class);

    /**转码工具路径*/
    private static String UTILPATH = "D:\\ffmpeg\\";

    /*举个栗子*/
    public static void main(String[] args) {
        String path = "D:\\video\\测试视频";
        Map<String,Boolean> retmsg = batch2MP4(path);
        System.out.println(retmsg);
    }

    /**
     * 扫描指定文件夹下的所有视频
     * @param videopath
     * @return
     * @author lxycx_xc
     * 创建时间：2017年12月18日
     *
     */
    public static Map<String,Boolean> batch2MP4(String videopath){

        Map<String,Boolean> retmsg = new HashMap<String, Boolean>();


        File[] mencoders = new File(videopath).listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File file, String name) {
                if(file.isDirectory()&&(name.endsWith(".vm9")||name.endsWith(".rm")||name.endsWith(".rmvb"))){//只查找目录或者页面文件
                    return true;
                }
                return false;
            }
        });
        for(File f:mencoders){
            String filename = f.getName();
            String flag = mencoder2AVI(videopath,filename);
            boolean b = flag!=null;
            if(b){
                int i = flag.lastIndexOf("\\");
                b = ffmpeg2MP4(flag.substring(0,i),flag.substring(i+1));
            }
            retmsg.put(filename, b);
        }

        //mencoders 和 ffmpegs 分开扫描，提高效率；

        File[] ffmpegs = new File(videopath).listFiles(new FilenameFilter() {

            @Override
            public boolean accept(File file, String name) {
                if(file.isDirectory()&&(name.endsWith(".avi")||name.endsWith(".mpg")||name.endsWith(".wmv")
                        ||name.endsWith(".3gp")||name.endsWith(".mov")||name.endsWith(".mp4")
                        ||name.endsWith(".asf")||name.endsWith(".asx")||name.endsWith(".flv"))){//只查找目录或者页面文件
                    return true;
                }
                return false;
            }
        });
        for(File f:ffmpegs){
            String filename = f.getName();
            boolean b =ffmpeg2MP4(videopath,filename);//执行转码
            retmsg.put(filename, b);
        }
        return retmsg;
    }


    /**判断视频类型 ffmpeg能解析的返回1，mencoder能解析的返回2*/
    private static int checkContentType(String path){
        String type = path.substring(path.lastIndexOf(".")+1).toLowerCase();
        // ffmpeg能直接解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等
        if("avi".equals(type)||"mpg".equals(type)||"wmv".equals(type)||"3gp".equals(type)
                ||"mov".equals(type)||"mp4".equals(type)||"asf".equals(type)
                ||"asx".equals(type)||"flv".equals(type)){
            return 1;

            // 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等),
            // 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
        }else if("vm9".equals(type)||"rm".equals(type)||"rmvb".equals(type)){
            return 2;
        }
        return -1;
    }

    /**
     * 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等), 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式
    // * @param before 需要转换的视频路径
     * @return 转码成功,返回转码后的文件路径
     * @author lxycx_xc
     * 创建时间：2017年12月15日
     */
    public static String mencoder2AVI(String Directory,String filename) {
        String newdir = Directory+"\\mencoder2AVI";
        String newfilename = filename.substring(0, filename.lastIndexOf("."))+".avi";

        new File(newdir).mkdirs();//创建对应的文件夹
        List<String> commend = new ArrayList<String>();
        commend.add(UTILPATH+"mencoder");
        commend.add(Directory+"\\"+filename);
        commend.add("-oac");
        commend.add("lavc");
        commend.add("-lavcopts");
        commend.add("acodec=mp3:abitrate=64");
        commend.add("-ovc");
        commend.add("xvid");
        commend.add("-xvidencopts");
        commend.add("bitrate=600");
        commend.add("-of");
        commend.add("avi");
        commend.add("-o");
        commend.add(newdir+"\\"+newfilename);
        try {
            //调用线程命令启动转码
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commend);
            builder.start();
            return newdir+"\\"+newfilename;
        } catch (Exception e) {
            log.error("mencoder2AVI转码错误",e);
            return null;
        }
    }

    public static boolean ffmpeg2FLV(String Directory,String filename){
        List<String> params = new ArrayList<String>();  ;
        return ffmpeg2All("FLV", params, Directory, filename);
    }

    /**ffmpeg转MP4格式:  -f mp4 -vcodec libx264*/
    public static boolean ffmpeg2MP4(String Directory,String filename){
        List<String> params = new ArrayList<String>();
        params.add("-f");
        params.add("mp4");
        params.add("-vcodec");
        params.add("libx264");
        return ffmpeg2All("mp4", params, Directory, filename);
    }



    /**
     * ffmpeg 转码
     * @param format 转码格式 如mp4 能解析的格式：(asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等)
     * @param params 转码参数，参考ffmpeg 命令
     * @param Directory 原文件目录
     * @param filename 原文件名称
     * @return
     * @author lxycx_xc
     * 创建时间：2017年12月18日
     *
     */
    public static boolean  ffmpeg2All(String format,List<String> params,String Directory,String filename){
        String newdir = Directory+"\\news";
        String newfilename = filename.substring(0, filename.lastIndexOf("."))+"."+format;

        String before = Directory+"\\"+filename;
        new File(newdir).mkdirs();//创建对应的文件夹

        List<String> commend = new ArrayList<String>();
        commend.add(UTILPATH+"ffmpeg");
        commend.add("-i");
        commend.add(before);
        commend.addAll(params);
        commend.add(newdir+"\\"+newfilename);

        try {
            //从视频低8秒开始截图
            cut(before, 10, newdir+"\\"+filename.substring(0, filename.lastIndexOf("."))+"_"+System.currentTimeMillis()+".jpg");

            //调用线程命令进行转码
            ProcessBuilder builder = new ProcessBuilder(commend);
            builder.command(commend);
            builder.start();

            log.info("ffmpeg转码成功！！文件位于："+newdir);
            return true;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            log.error("ffmpeg转码错误",e);
            return false;
        }
    }



    /**
     * 视频截图
     * @param before 视频地址
     * @param timeindex 从视频指定秒数的位置截图
     * @param newimage 生成新的图片
     * @return
     * @author lxycx_xc
     * 创建时间：2017年12月18日
     *
     */
    public static boolean cut(String before,int timeindex,String newimage){
        try {
            Runtime runtime = Runtime.getRuntime();
            //视频截图命令，封面图。
            String cut = UTILPATH+"ffmpeg.exe -i "+ before+ " -y -f image2 -ss "+timeindex+" -t 0.001 -s 600x500 "+newimage;
            Process proce = runtime.exec(cut);
            return true;
        } catch (IOException e) {
            log.error("截图失败:",e);
        }
        return false;
    }

}
