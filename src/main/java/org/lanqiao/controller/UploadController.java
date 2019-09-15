package org.lanqiao.controller;

import org.lanqiao.entity.Status;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoTag;
import org.lanqiao.service.StatusService;
import org.lanqiao.service.UploadService;
import org.lanqiao.service.VideoTagService;
import org.lanqiao.util.Ffmpeg;
import org.lanqiao.util.ReadVideo;
import org.lanqiao.util.StringOp;
import org.lanqiao.util.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private String rootPath = "E:/bilibili/teporary";

    @ResponseBody
    @RequestMapping(value = "/upload")
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        //用户上传视频文件
        String uuid = new Upload().upload(file, rootPath, request);
    }
    @ResponseBody
    @RequestMapping(value = "/getCover")
    public String getCover(HttpServletRequest request) {
        String videoUrl = (String)request.getSession(false).getAttribute("videoUrl");
        String uuid = (String)request.getSession(false).getAttribute("Uuid");
        //生成随机四张封面cover
        return new Ffmpeg().getImages(videoUrl, rootPath, uuid); //生成四张视频截图
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoPic")
    public String uploadVideoPic(@RequestParam("cover") MultipartFile file, HttpServletRequest request) throws IOException {
        //用户上传的封面文件image
        String imageUrl = new Upload().uploadPic(file, rootPath, "cover", request);
        request.getSession(true).setAttribute("picUrl", imageUrl);
        return imageUrl;
    }
    @ResponseBody
    @RequestMapping(value = "/getAllType1")
    public List<String> getAllType1() {
        return statusService.selectAllType1();
    }
    @ResponseBody
    @RequestMapping(value = "/getType2ByType1")
    public List<String> getType2ByType1(@RequestParam("type1") String type1) {
        return statusService.selectType2ByType1(type1);
    }
    @ResponseBody
    @RequestMapping(value = "/getIdByType")
    public String getIdByType(Status status) {
        return statusService.selectIdByType(status);
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoInfo")
    public int uploadVideoInfo(Video video, Status status, String tags, HttpServletRequest request) {
        //根据选择的一二级分区，设置视频的类型
        video.setClassType(statusService.selectIdByType(status));
        //设置当前时间为上传时间
        video.setUpTime(new Date());
        //获取session中的视频文件路径
        String videoUrl = (String)request.getSession(false).getAttribute("videoUrl");
        //设置视频路径
        Ffmpeg ffmpeg = new Ffmpeg();
        //获取视频和封面的物理路径
         videoUrl =ffmpeg.getPhyDir(videoUrl);
         String picUrl = video.getVideoPic();
        String uuid = (String)request.getSession(false).getAttribute("Uuid");
        if(!picUrl.contains(uuid)){
            picUrl = ffmpeg.getPhyDir((String)request.getSession(false).getAttribute("picUrl"));
        }
        else{
            picUrl = ffmpeg.getPhyDir(picUrl);
        }
         //设置视频和封面路径
        video.setVideoUrl(ffmpeg.getRelDir(ffmpeg.moveFile(videoUrl)));
        video.setVideoPic(ffmpeg.getRelDir(ffmpeg.moveFile(picUrl)));
        //设置视频文件的时长
        video.setVideoTime(new ReadVideo().readVideo(videoUrl));
        //从标签字符串中抽出多个标签
        List<String> tagList = Arrays.asList(tags.trim().split("\\s+"));
        //去掉重复的标签
        tagList = new StringOp().strDistinct(tagList);
        //数据库新增video记录
        int flag = uploadService.uploadVideo(video);
        //获取新增video的id
        int videoId = video.getVideoId();
        //根据获取的videoId插入对应的VideoTag表
        VideoTag videoTag = new VideoTag();
        for (String tag : tagList) {
            videoTag.setTagName(tag);
            videoTag.setVideoId(videoId);
            flag = flag*videoTagService.addVideoTag(videoTag);
        }
        ffmpeg.delUuidFile(uuid);
        return flag;
    }
    @ResponseBody
    @RequestMapping(value = "/test")
    public String test(@RequestParam("name") String name) {
        String newFileName = "ok";
        return newFileName+name;
    }
}
