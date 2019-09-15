package org.lanqiao.entity;

import java.util.Date;

public class Video {
    private Integer videoId;

    private UserInfo userInfo;

    private String videoTitle;

    private String videoPic;

    private String videoDesc;

    private String videoUrl;

    private Date upTime;

    private Date videoTime;

    private Integer playNum;

    private Integer likeNum;

    private Integer collectionNum;

    private Integer coinNum;

    private String classType;

    private String isReview;

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle == null ? null : videoTitle.trim();
    }

    public String getVideoPic() {
        return videoPic;
    }

    public void setVideoPic(String videoPic) {
        this.videoPic = videoPic == null ? null : videoPic.trim();
    }

    public String getVideoDesc() {
        return videoDesc;
    }

    public void setVideoDesc(String videoDesc) {
        this.videoDesc = videoDesc == null ? null : videoDesc.trim();
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl == null ? null : videoUrl.trim();
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public Date getVideoTime() {
        return videoTime;
    }

    public void setVideoTime(Date videoTime) {
        this.videoTime = videoTime;
    }

    public Integer getPlayNum() {
        return playNum;
    }

    public void setPlayNum(Integer playNum) {
        this.playNum = playNum;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getCollectionNum() {
        return collectionNum;
    }

    public void setCollectionNum(Integer collectionNum) {
        this.collectionNum = collectionNum;
    }

    public Integer getCoinNum() {
        return coinNum;
    }

    public void setCoinNum(Integer coinNum) {
        this.coinNum = coinNum;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType == null ? null : classType.trim();
    }

    public String getIsReview() {
        return isReview;
    }

    public void setIsReview(String isReview) {
        this.isReview = isReview == null ? null : isReview.trim();
    }

    @Override
    public String toString() {
        return "Video{" +
                "videoId=" + videoId +
                ", userInfo=" + userInfo +
                ", videoTitle='" + videoTitle + '\'' +
                ", videoPic='" + videoPic + '\'' +
                ", videoDesc='" + videoDesc + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", upTime=" + upTime +
                ", videoTime=" + videoTime +
                ", playNum=" + playNum +
                ", likeNum=" + likeNum +
                ", collectionNum=" + collectionNum +
                ", coinNum=" + coinNum +
                ", classType='" + classType + '\'' +
                ", isReview='" + isReview + '\'' +
                '}';
    }
}