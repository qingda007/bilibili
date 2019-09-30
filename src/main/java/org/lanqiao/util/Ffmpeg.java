package org.lanqiao.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.oro.text.regex.*;

import java.io.*;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

public class Ffmpeg {

    //ffmpeg安装目录
    public static String FFMPEG_PATH ="/usr/local/bilibili/ffmpeg.exe";
    private final static String rootPath = "/usr/local/bilibili";
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
            transfer(videoPath,imageUrl,i*((second-1)/5));
        }
        getVideoTime(videoPath);
        File file = new File(imagePath+"4.jpg");
        while(!file.exists());
        return uuid + "_";
    }
    // 视频缩略图截取
    // inFile  输入文件(包括完整路径)
    // outFile 输出文件(可包括完整路径)
    public boolean transfer(String inFile, String outFile, int timePoint) { //用于linux
       // inFile = inFile.replace("%20", " ");
        String command = "ffmpeg -ss "+ timePoint  + " -i " + inFile + " -y -f image2 -t 00:00:01 -s 1920x1080 " + outFile;
        return createCommand(command);
    }
    public void transferMp4(String infile) {
        String outfile = rootPath + "/(转码)"+new File(infile).getName();
        final String videoCommand = "ffmpeg -i " + infile + " -vcodec libx264 -vprofile baseline " + outfile;
        new Thread(){
            public void run(){
                 createCommand(videoCommand);
            }
        }.start();
    }
    private boolean createCommand(String command){
        try {
            Runtime rt = Runtime.getRuntime();
            Process proc = rt.exec(command);
            InputStream stderr = proc.getErrorStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line = null;
            while ((line = br.readLine()) != null)
                System.out.println(line);
            isr.close();
            br.close();
            proc.waitFor();
        } catch (Throwable t) {
            t.printStackTrace();
            return false;
        }
        return true;
    }
    public Date getVideoTime(String filePath){
//        String result = processFLV(filePath);
        String time = "00:01:23";
//        PatternCompiler compiler =new Perl5Compiler();
//        try {
//            String regexDuration ="Duration: (.*?)";
//            Pattern patternDuration = compiler.compile(regexDuration, Perl5Compiler.CASE_INSENSITIVE_MASK);
//            PatternMatcher matcherDuration = new Perl5Matcher();
//            if(matcherDuration.contains(result, patternDuration)){
//                MatchResult re = matcherDuration.getMatch();
//                time = re.group(1).substring(0,8);
//            }
//        } catch (MalformedPatternException e) {
//            e.printStackTrace();
//        }
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        ParsePosition pos = new ParsePosition(0);
        Date videoTime = formatter.parse(time, pos);
        return videoTime;
    }
    private StringBuffer getDuration(String result){
        StringBuffer stringBuffer = new StringBuffer();
        PatternCompiler compiler =new Perl5Compiler();
        try {
            String regexDuration ="Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
            Pattern patternDuration = compiler.compile(regexDuration, Perl5Compiler.CASE_INSENSITIVE_MASK);
            PatternMatcher matcherDuration = new Perl5Matcher();
            if(matcherDuration.contains(result, patternDuration)){
                MatchResult re = matcherDuration.getMatch();
                stringBuffer.append("提取出播放时间：" +re.group(1));
                stringBuffer.append("\r\n开始时间：" +re.group(2));
                stringBuffer.append("\r\nbitrate码率[单位(kb)]：" +re.group(3));
            }
        } catch (MalformedPatternException e) {
            e.printStackTrace();
        }
        return stringBuffer;
    }
    private void createVideoInfo(String filePath){
        String result = processFLV(filePath);
        StringBuffer stringBuffer = new StringBuffer();
        PatternCompiler compiler =new Perl5Compiler();
        stringBuffer.append(getDuration(result));
        try {
            String regexVideo ="Video: (.*?), (.*?), (.*?)[,\\s]";
            Pattern patternVideo = compiler.compile(regexVideo,Perl5Compiler.CASE_INSENSITIVE_MASK);
            PatternMatcher matcherVideo = new Perl5Matcher();
            if(matcherVideo.contains(result, patternVideo)){
                MatchResult re = matcherVideo.getMatch();
                stringBuffer.append("\r\n编码格式：" +re.group(1));
                stringBuffer.append("\r\n视频格式：" +re.group(2));
                stringBuffer.append("\r\n分辨率：" +re.group(3));
                if(!re.group(1).contains("h264")) transferMp4(filePath);
            }
            String regexAudio ="Audio: (.*?), (\\d*) Hz";
            Pattern patternAudio = compiler.compile(regexAudio,Perl5Compiler.CASE_INSENSITIVE_MASK);
            PatternMatcher matcherAudio = new Perl5Matcher();
            if(matcherAudio.contains(result, patternAudio)){
                MatchResult re = matcherAudio.getMatch();
                stringBuffer.append("\r\n音频编码：" +re.group(1));
                stringBuffer.append("\r\n音频采样频率：" +re.group(2));
            }
        } catch (MalformedPatternException e) {
            e.printStackTrace();
        }

        FileWriter writer;
        try {
            String fileName = new File(filePath).getName();
            fileName = fileName.substring(0,fileName.lastIndexOf("."));
            writer = new FileWriter(rootPath+"/videoInfo/"+fileName+"_Info.txt");
            writer.write(stringBuffer.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void testFun() {
        File file = new File(rootPath + "/videoData");
        File[] files = file.listFiles();
        for (File f : files) {
            if(f.getName().contains(".mp4")){
                createVideoInfo(f.getAbsolutePath());
            }
        }
    //    createVideoInfo("/videoData/2824dd7f733a40258fcfe170e56bf0b0_[DMG][Dimension_W][OVA][720P][GB].mp4");
    }

    public static String getBitrate(String filePath) {
    //    String cmd = "ffmpeg -v quiet -print_format json -show_format -i " + filePath;
        String cmd = "ffmpeg -v quiet -print_format json -show_format -i " + filePath;
        System.out.println(cmd);
        try {
            Runtime run = Runtime.getRuntime();
            Process p = run.exec(cmd);
            BufferedInputStream in = new BufferedInputStream(p.getInputStream());
            BufferedReader inBr = new BufferedReader(new InputStreamReader(in));
            StringBuffer sb = new StringBuffer();
            String lineStr;
            while ((lineStr = inBr.readLine()) != null)
                sb.append(lineStr);
            if (p.waitFor() != 0) {
                if (p.exitValue() == 1)
                    System.err.println("命令执行失败!");
            }
            inBr.close();
            in.close();
            return analyseInfo(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "失败了";
    }
    private static String analyseInfo(String json) throws IOException {
        return json;
//        ObjectMapper mapper = new ObjectMapper();
//        HashMap map = mapper.readValue(json, HashMap.class);
//        Map format = (Map) map.get("format");
//        String bitrate = (String) format.get("bit_rate");
//        return  bitrate;
    }
    //  ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
    private static String processFLV(String inputPath) {
        List<String> commend=new java.util.ArrayList<String>();
        commend.add("ffmpeg");
        commend.add("-i");
        commend.add(inputPath);
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commend);
            builder.redirectErrorStream(true);
            Process p= builder.start();
            //1. start
            BufferedReader buf = null; // 保存ffmpeg的输出结果流
            String line = null;
            //read the standard output
            buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
            StringBuffer sb= new StringBuffer();
            while ((line = buf.readLine()) != null) {
                System.out.println(line);
                sb.append(line);
                continue;
            }
            int ret = p.waitFor();//这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
            buf.close();
            //1. end
            return sb.toString();
        } catch (Exception e) {
//            System.out.println(e);
            return null;
        }
    }
    public boolean ffmpegToImage(String videoPath,String imagePath,int timePoint){ //用于windows
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
        //    builder.directory(new File("/usr/local//"));//切换工作目录，不加这一句还真不行，此目录为你ffmpeg文件夹的存放目录
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
        File file = new File(rootPath + dataPath);
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
        return rootPath + relDir;
    }
    public String getPhyDir(String absDir){
        File file = new File(absDir);
        String relDir = rootPath + "/teporary/" + file.getName();
        return relDir;
    }
    public String moveFile(String path1){
        File file = new File(path1);
        String path2 = rootPath + "/videoData/";
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
        File file = new File(rootPath + "/teporary");
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
        if(!file.isDirectory()) delFile(file);
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
