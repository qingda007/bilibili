package org.lanqiao.controller;

import org.lanqiao.util.Upload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/video")
public class UploadController {

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
    @RequestMapping(value = "/test")
    public String test(@RequestParam("name") String name) {
        String newFileName = "ok";
        return newFileName+name;
    }
}
