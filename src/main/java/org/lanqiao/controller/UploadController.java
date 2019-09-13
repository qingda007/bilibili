package org.lanqiao.controller;

import org.lanqiao.entity.Status;
import org.lanqiao.entity.Video;
import org.lanqiao.entity.VideoTag;
import org.lanqiao.service.StatusService;
import org.lanqiao.service.UploadService;
import org.lanqiao.service.VideoTagService;
import org.lanqiao.util.ReadVideo;
import org.lanqiao.util.StringOp;
import org.lanqiao.util.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
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

    @ResponseBody
    @RequestMapping(value = "/upload")
    public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "E:/upload";
        String newPath = new Upload().upload(file, filePath, request);
        request.getSession(true).setAttribute("videoPath", newPath);
        return newPath;
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoPic")
    public String uploadVideoPic(@RequestParam("cover") MultipartFile file, HttpServletRequest request) throws IOException {
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "E:/upload";
        String newPath = new Upload().upload(file, filePath, request);
        request.getSession(true).setAttribute("picPath", newPath);
        return newPath;
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
        video.setClassType(statusService.selectIdByType(status));
        video.setUpTime(new Date());
        String picUrl = (String)request.getSession(true).getAttribute("picPath");
        String videoUrl = (String)request.getSession(true).getAttribute("videoPath");
        video.setVideoPic(picUrl);
        video.setVideoUrl(videoUrl);
        video.setVideoTime(new ReadVideo().readVideo(videoUrl));
        List<String> tagList = Arrays.asList(tags.trim().split("\\s+"));
        tagList = new StringOp().strDistinct(tagList);
        int flag = uploadService.uploadVideo(video);
        int videoId = video.getVideoId();
        VideoTag videoTag = new VideoTag();
        for (String tag : tagList) {
            videoTag.setTagName(tag);
            videoTag.setVideoId(videoId);
            flag = flag*videoTagService.addVideoTag(videoTag);
        }
        return flag;
    }
    @ResponseBody
    @RequestMapping(value = "/test")
    public String test(@RequestParam("name") String name) {
        String newFileName = "ok";
        return newFileName+name;
    }
}
