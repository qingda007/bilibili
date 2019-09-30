package org.lanqiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.Status;
import org.lanqiao.entity.UserInfo;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoTag;
import org.lanqiao.service.StatusService;
import org.lanqiao.service.UploadService;
import org.lanqiao.service.VideoService;
import org.lanqiao.service.VideoTagService;
import org.lanqiao.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/video")
public class UploadController {
    @Autowired
    StatusService statusService;
    @Autowired
    UploadService uploadService;
    @Autowired
    VideoTagService videoTagService;
    @Autowired
    VideoService videoService;
    private String rootPath = "/usr/local/bilibili/teporary";
//    @ResponseBody
//    @RequestMapping(value = "/in")//测试用
//    public int testIn(@Param("userId")int userId, HttpServletRequest request){
//        UserInfo userInfo = new UserInfo();
//        userInfo.setUserId(userId);
//        request.getSession().setAttribute("userInfo",userInfo);
//        return 1;
//    }
    @ResponseBody
    @RequestMapping(value = "/test")//测试用
    public int testOut(){
        new Ffmpeg().testFun();
        return 1;
    }
    @ResponseBody
    @RequestMapping(value = "/test1")//测试用
    public List<Video> test1(){
        return videoService.selectAllVideo();
    }
    @ResponseBody
    @RequestMapping(value = "/test2")//测试用
    public List<String> test2(){
        return new FileManager().delSpareFile(videoService.selectAllVideo());
    }
    @ResponseBody
    @RequestMapping(value = "/test3")//测试用
    public List<String> test3(){
        return new FileManager().getFileName("/usr/local/bilibili/videoData");
    }

    @RequestMapping(value = "/uploadVideo")//打开投稿页面
    public ModelAndView uploadVideo() {
        return new ModelAndView("upload");
    }
    @ResponseBody
    @RequestMapping(value = "/upload")//上传稿件的视频文件
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        //用户上传视频文件
        new Upload().upload(file, rootPath, request);
    }
    @ResponseBody
    @RequestMapping(value = "/getCover")//对上传的稿件视频用ffmpeg截图，生成四张图片供用户选择作为封面
    public String getCover(HttpServletRequest request) {
        String videoUrl = (String)request.getSession(false).getAttribute("videoUrl");
        String uuid = (String)request.getSession(false).getAttribute("Uuid");
        //生成随机四张封面cover
        return new Ffmpeg().getImages(videoUrl, rootPath, uuid); //生成四张视频截图
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoPic")//上传稿件的封面
    public String uploadVideoPic(@RequestParam("cover") MultipartFile file, HttpServletRequest request) throws IOException {
        //用户上传的封面文件image
        String imageUrl = new Upload().uploadPic(file, rootPath, "cover", request);
        request.getSession(true).setAttribute("picUrl", imageUrl);
        return imageUrl;
    }
    @ResponseBody
    @RequestMapping(value = "/getAllType1")//查询所有的一级分区（用于投稿时的下拉框）
    public List<String> getAllType1() {
        return statusService.selectAllType1();
    }
    @ResponseBody
    @RequestMapping(value = "/getType2ByType1")//查询一级分区对应的二级分区（用于投稿时的下拉框）
    public List<String> getType2ByType1(@RequestParam("type1") String type1) {
        return statusService.selectType2ByType1(type1);
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoInfo")//插入投稿的信息（*视频url、*封面url、*标题、简介、*一二级分区、标签）
    public int uploadVideoInfo(final Video video, Status status, String tags, HttpServletRequest request) {
        //根据选择的一二级分区，设置视频的类型
        video.setClassType(statusService.selectIdByType(status));
        //设置当前时间为上传时间
        video.setUpTime(new Date());
        //获取session中的视频文件路径
        String videoUrl = (String)request.getSession(false).getAttribute("videoUrl");
        //设置视频路径
        final Ffmpeg ffmpeg = new Ffmpeg();
        //获取视频和封面的物理路径
         String picUrl = video.getVideoPic();
        final String uuid = (String)request.getSession(false).getAttribute("Uuid");
        if(picUrl.contains(uuid)){//选择截取的图片作为封面
            picUrl = ffmpeg.getPhyDir(picUrl);
        }
        else{//选择上传的图片作为封面
            picUrl = ffmpeg.getPhyDir((String)request.getSession(false).getAttribute("picUrl"));
        }
         //设置视频和封面路径
        video.setVideoUrl(ffmpeg.getRelDir(ffmpeg.moveFile(videoUrl)));
       /* String outfile = "/usr/local/bilibili/videoData/" + new File(videoUrl).getName();
        ffmpeg.transferMp4(videoUrl, outfile);
        video.setVideoUrl(outfile);*/
        video.setVideoPic(ffmpeg.getRelDir(ffmpeg.moveFile(picUrl)));
        //设置视频文件的时长
        video.setVideoTime(new ReadVideo().readVideo(ffmpeg.getDataDir(video.getVideoUrl())));
        request.getSession(true).setAttribute("Uuid", null);
        request.getSession(true).setAttribute("videoUrl", null);
        //从标签字符串中抽出多个标签
        List<String> tagList = Arrays.asList(tags.trim().split("\\s+"));
        //去掉重复的标签
        tagList = new StringOp().strDistinct(tagList);
        //数据库新增video记录
        int flag = uploadService.uploadVideo(video);
        //获取新增video的id
        final int videoId = video.getVideoId();
        //根据获取的videoId插入对应的VideoTag表
        VideoTag videoTag = new VideoTag();
        for (String tag : tagList) {
            videoTag.setTagName(tag);
            videoTag.setVideoId(videoId);
            flag = flag*videoTagService.addVideoTag(videoTag);
        }
        new Thread() {
            public void run() {
                Ffmpeg ffmpeg = new Ffmpeg();
                ffmpeg.delUuidFile(uuid);
            }
        }.start();
        return flag;
    }
    @RequestMapping(value = "/homeVideo")//打开投稿主页
    public ModelAndView homeVideo(HttpServletRequest request) {
        UserInfo userInfo = (UserInfo)request.getSession(false).getAttribute("userInfo");
        return new ModelAndView("upload-home","videoInfo",uploadService.countVideoInfo(userInfo.getUserId()));
    }
    @RequestMapping(value = "/managerVideo")//打开投稿管理页面（可查询所有稿件、删除稿件）
    public ModelAndView managerVideo(@RequestParam(value="pageNo", defaultValue = "1") int pageNum, @RequestParam(value="isReview", defaultValue = "-1") int isReview, @RequestParam(value="videoId", defaultValue = "-1") final int videoId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        UserInfo userInfo = (UserInfo)request.getSession(false).getAttribute("userInfo");
        int userId = userInfo.getUserId();
        if(videoId!=-1){ //代表执行删除稿件的操作
            new Thread() {
                public void run() {
                    Ffmpeg ffmpeg = new Ffmpeg();
                    Video video = videoService.selectVideoInfo(videoId);
                    ffmpeg.delDataFile(video.getVideoPic()); //删除该稿件的封面
                    ffmpeg.delDataFile(video.getVideoUrl());  //删除该稿件的视频文件
                }
            }.start();
            uploadService.delVideo(videoId); //删除该稿件的数据库记录
        }
        if(isReview==-1){
            PageHelper.startPage(pageNum, 5);
            List<Video> videos = uploadService.selectUploadVideo(userId);
            PageInfo<Video> p = new PageInfo<>(videos);
            modelAndView.addObject("pageInfo",p);
        }
        else {
            PageHelper.startPage(pageNum, 5);
            List<Video> videos = uploadService.selectVideoByIsReview(userId, isReview);
            PageInfo<Video> p = new PageInfo<>(videos);
            modelAndView.addObject("pageInfo",p);
        }
        long waitReview = uploadService.countIsReview(userId,0);
        long isPass = uploadService.countIsReview(userId,1);
        long noPass = uploadService.countIsReview(userId,2);
        long length = waitReview + isPass + noPass;
        modelAndView.addObject("length",length);
        modelAndView.addObject("waitReview",waitReview);
        modelAndView.addObject("isPass",isPass);
        modelAndView.addObject("noPass",noPass);
        modelAndView.setViewName("upload-manager");
        return modelAndView;
    }
    @RequestMapping(value = "/selectVideo")//打开修改稿件页面
    public ModelAndView selectVideo(@Param("videoId")int videoId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Video video = videoService.selectVideoInfo(videoId);
        Ffmpeg ffmpeg = new Ffmpeg();
        if(ffmpeg.isExist(video.getVideoUrl())){
            String uuid = ffmpeg.getUuid(video.getVideoUrl());
            request.getSession(true).setAttribute("Uuid", uuid);
            request.getSession(true).setAttribute("videoUrl", ffmpeg.getDataDir(video.getVideoUrl()));
            modelAndView.addObject("video",video);
        }
        else modelAndView.addObject("video",-1);
        modelAndView.setViewName("upload-modify");
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping(value = "/modifyVideoPic")//修改稿件的封面
    public String modifyVideoPic(@RequestParam("cover") MultipartFile file, HttpServletRequest request) throws IOException {
        //用户上传的封面文件image
        String imageUrl = new Upload().uploadPic(file, rootPath, "cover", request);
        request.getSession(true).setAttribute("modifyPicUrl", imageUrl);
        return imageUrl;
    }
    @ResponseBody
    @RequestMapping(value = "/modifyVideo")//插入修改稿件的信息（封面、标题、简介）
    public int modifyVideo(Video video, HttpServletRequest request) {
        Ffmpeg ffmpeg = new Ffmpeg();
        String uuid = (String)request.getSession(false).getAttribute("Uuid");
        String picUrl = video.getVideoPic();
        String modifyPicUrl = (String)request.getSession(false).getAttribute("modifyPicUrl");
        if(picUrl.contains("/teporary/")){ //如果选择截取的图片
            picUrl = ffmpeg.getPhyDir(picUrl); //截取文件名
            String url = videoService.selectVideoInfo(video.getVideoId()).getVideoPic();
            if(url!=null && !url.equals("")){
                ffmpeg.delDataFile(url);
            }
            video.setVideoPic(ffmpeg.getRelDir(ffmpeg.moveFile(picUrl)));
        }
        else if (picUrl.contains("/videoData/")){ //如果选择原有的图片
            video.setVideoPic(null);
        }
        else { //如果选择了上传的图片
            ffmpeg.delDataFile(videoService.selectVideoInfo(video.getVideoId()).getVideoPic());
            video.setVideoPic(ffmpeg.getRelDir(ffmpeg.moveFile(modifyPicUrl)));
            request.getSession(true).setAttribute("modifyPicUrl", null);
        }
        if(uuid!=null){
            ffmpeg.delUuidFile(uuid);
            request.getSession(true).setAttribute("Uuid", null);
        }
        return uploadService.modifyVideo(video);
    }
}
