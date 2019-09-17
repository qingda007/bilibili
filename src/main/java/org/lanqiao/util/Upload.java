package org.lanqiao.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class Upload {

  //  private String rootPath = "E:/bilibili/";

    public String upload(MultipartFile file, String path, HttpServletRequest request) throws IOException {
        //上传到项目target路径
      //  String rootPath = request.getSession().getServletContext().getRealPath("/") + path;
        //上传到指定路径下的upload文件夹中
       // rootPath = rootPath + path;
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        String rootPath = path;
        // 获取原始图片的名字和扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = uuid + "_" + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(rootPath, newFileName);
        if( !targetFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            targetFile.getParentFile().mkdirs();
        }
        file.transferTo(targetFile);
        request.getSession(true).setAttribute("videoUrl", targetFile.getAbsolutePath());
        request.getSession(true).setAttribute("Uuid", uuid);
        return uuid;
    }
    public String uploadPic(MultipartFile file, String path, String fileName, HttpServletRequest request) throws IOException {
        String uuid = (String)request.getSession(false).getAttribute("Uuid");
        if(uuid==null){
            uuid = UUID.randomUUID().toString().replaceAll("-", "");
            request.getSession(true).setAttribute("Uuid", uuid);
        }
        String rootPath = path;
        // 获取原始图片的名字和扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = uuid + "_" + fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
        // 封装上传文件位置的全路径
        File targetFile = new File(rootPath, newFileName);
        if( !targetFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            targetFile.getParentFile().mkdirs();
        }
        file.transferTo(targetFile);
        return targetFile.getAbsolutePath();
    }
//    public String modifyPic(MultipartFile file, String path, String fileName, HttpServletRequest request) throws IOException {
//        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
//        String rootPath = path;
//        // 获取原始图片的名字和扩展名
//        String originalFilename = file.getOriginalFilename();
//        // 生成文件新的名字
//        String newFileName = uuid + "_" + fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
//        // 封装上传文件位置的全路径
//        File targetFile = new File(rootPath, newFileName);
//        if( !targetFile.getParentFile().exists()) {
//            // 如果目标文件所在的目录不存在，则创建父目录
//            targetFile.getParentFile().mkdirs();
//        }
//        file.transferTo(targetFile);
//        request.getSession(true).setAttribute("ModifyUuid", uuid);
//        return newFileName;
//    }
//    public String upload(MultipartFile file, String rootPath, String fileName, HttpServletRequest request) throws IOException {
//      //  String rootPath = request.getSession().getServletContext().getRealPath("/") + path;
//        String path = "/upload";
//        rootPath = rootPath + path;
//        // 获取原始图片的扩展名
//        String originalFilename = file.getOriginalFilename();
//        // 生成文件新的名字
//        String newFileName = fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
//        // 封装上传文件位置的全路径
//        File targetFile = new File(rootPath, newFileName);
//        if( !targetFile.getParentFile().exists()) {
//            // 如果目标文件所在的目录不存在，则创建父目录
//            targetFile.getParentFile().mkdirs();
//        }
//        file.transferTo(targetFile);
//        return path + "/" + newFileName;
//       // return targetFile.getAbsolutePath();
//    }
}
