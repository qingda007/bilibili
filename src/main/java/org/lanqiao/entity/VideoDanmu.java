package org.lanqiao.entity;

import java.util.Date;

public class VideoDanmu {
    private UserInfo userInfo;

    private Integer danmuId;

    private Integer videoId;

    private int userId;

    private String danmu;

    private Date sentTime;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
                "userInfo=" + userInfo +
                ", danmuId=" + danmuId +
                ", videoId=" + videoId +
                ", userId=" + userId +
                ", danmu='" + danmu + '\'' +
                ", sentTime=" + sentTime +
                '}';
    }
}