package org.lanqiao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class VideoComment {
    private Integer comId;

    private Integer videoId;

    private Integer userId;

    private String comment;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date sendTime;

    private UserInfo userInfo;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    @Override
    public String toString() {
        return "VideoComment{" +
                "comId=" + comId +
                ", videoId=" + videoId +
                ", userId=" + userId +
                ", comment='" + comment + '\'' +
                ", sendTime=" + sendTime +
                ", userInfo=" + userInfo +
                '}';
    }
}