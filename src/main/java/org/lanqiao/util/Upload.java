package org.lanqiao.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class Upload {
    public String upload(MultipartFile file, String path, HttpServletRequest request) throws IOException {
        String filePath = request.getSession().getServletContext().getRealPath("/") + path;
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        //String newFileName = originalFilename;
        String newFileName = UUID.randomUUID() + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);
        return path + "/" + newFileName;
    }
    public String upload(MultipartFile file, String path, String fileName, HttpServletRequest request) throws IOException {
        String filePath = request.getSession().getServletContext().getRealPath("/") + path;
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        //String newFileName = originalFilename;
       // String newFileName = UUID.randomUUID() + originalFilename;
        String newFileName = fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);
        return path + "/" + newFileName;
    }
}
