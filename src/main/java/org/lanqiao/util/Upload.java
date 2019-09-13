package org.lanqiao.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class Upload {
    public String upload(MultipartFile file, String path, HttpServletRequest request) throws IOException {
      //  String rootPath = request.getSession().getServletContext().getRealPath("/") + path;
        String rootPath = path;
        // 获取原始图片的名字和扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(rootPath, newFileName);
        if( !targetFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            targetFile.getParentFile().mkdirs();
        }
        file.transferTo(targetFile);
      //  return path + "/" + newFileName;
        return targetFile.getAbsolutePath();
    }
    public String upload(MultipartFile file, String path, String fileName, HttpServletRequest request) throws IOException {
      //  String rootPath = request.getSession().getServletContext().getRealPath("/") + path;
        String rootPath = path;
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
        // 封装上传文件位置的全路径
        File targetFile = new File(rootPath, newFileName);
        if( !targetFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            targetFile.getParentFile().mkdirs();
        }
        file.transferTo(targetFile);
       // return path + "/" + newFileName;
        return targetFile.getAbsolutePath();
    }
}
