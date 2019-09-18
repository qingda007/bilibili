package org.lanqiao.util;


import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;

import java.io.File;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

public class ReadVideo {
    /**
     * 读取视频时长
     * @param videoPath 视频路径
     * @return
     */
    //获取视频文件的时长 秒数long型
    public long readVideoSecond(String videoPath){
        File file = new File(videoPath);
        Encoder encoder = new Encoder();
        long sum = 0;
        try {
            MultimediaInfo m = encoder.getInfo(file);
            sum = m.getDuration()/1000; //时长sum单位：秒
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sum;
    }
    //获取视频文件的时长 date型
    public Date readVideo(String videoPath) {
        File file = new File(videoPath); //videoPath视频文件的绝对路径
        Encoder encoder = new Encoder();
        Calendar calendar = Calendar.getInstance();
        try {
            MultimediaInfo m = encoder.getInfo(file);
            calendar.setTimeInMillis(m.getDuration()+57600000); //增加16个小时，因为存在时区误差八小时
        } catch (Exception e) {
            e.printStackTrace();
        }
        return calendar.getTime();
    }

    /**
     * 将视频时长转换成"00:00:00.000"的字符串格式
     * @param duration 视频时长（单位：秒）
     * @return
     */
    public String durationFormatToString(BigDecimal duration)
    {
        BigDecimal nine = BigDecimal.valueOf(9);
        BigDecimal sixty = BigDecimal.valueOf(60);

        BigDecimal second = duration.divideAndRemainder(sixty)[1];
        BigDecimal minute = duration.subtract(second).divide(sixty).divideAndRemainder(sixty)[1];
        BigDecimal hour = duration.subtract(second).divideToIntegralValue(BigDecimal.valueOf(3600));

        String str = "";
        if (hour.compareTo(nine)>0)
        {
            str += hour.intValue() + ":";
        }
        else
        {
            str += "0" + hour.intValue() + ":";
        }
        if (minute.compareTo(nine)>0)
        {
            str += minute.intValue() + ":";
        }
        else
        {
            str += "0" + minute.intValue() + ":";
        }
        if (second.compareTo(nine)>0)
        {
            str += second.intValue() + ".000";
        }
        else
        {
            str +="0"+ second.intValue() + ".000";
        }
        return str;
    }

}