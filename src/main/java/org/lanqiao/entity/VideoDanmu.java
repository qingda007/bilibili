package org.lanqiao.entity;

import java.util.Date;

public class VideoDanmu {
    private Integer danmuId;

    private Integer videoId;

    private String userName;

    private String danmu;

    private Date sentTime;

    public Integer getDanmuId() {
        return danmuId;
    }

    public void setDanmuId(Integer danmuId) {
        this.danmuId = danmuId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getDanmu() {
        return danmu;
    }

    public void setDanmu(String danmu) {
        this.danmu = danmu == null ? null : danmu.trim();
    }

    public Date getSentTime() {
        return sentTime;
    }

    public void setSentTime(Date sentTime) {
        this.sentTime = sentTime;
    }

    @Override
    public String toString() {
        return "VideoDanmu{" +
                "danmuId=" + danmuId +
                ", videoId=" + videoId +
                ", userName='" + userName + '\'' +
                ", danmu='" + danmu + '\'' +
                ", sentTime=" + sentTime +
                '}';
    }
}