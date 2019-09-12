package org.lanqiao.controller;

import org.lanqiao.service.StatusService;
import org.lanqiao.util.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/video")
public class UploadController {
    @Autowired
    StatusService statusService;

    @ResponseBody
    @RequestMapping(value = "/upload")
    public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "/upload";
        String newFileName = new Upload().upload(file, filePath, request);
        // 保存到数据库

        return newFileName;
    }
    @ResponseBody
    @RequestMapping(value = "/uploadVideoPic")
    public String uploadVideoPic(@RequestParam("cover") MultipartFile file, HttpServletRequest request) throws IOException {
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "/upload";
        String newFileName = new Upload().upload(file, filePath, request);
        // 保存到数据库

        return newFileName;
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
    @RequestMapping(value = "/test")
    public String test(@RequestParam("name") String name) {
        String newFileName = "ok";
        return newFileName+name;
    }
}
