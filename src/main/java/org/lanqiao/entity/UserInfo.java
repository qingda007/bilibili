package org.lanqiao.entity;

import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class UserInfo {
    private Video video;

    private VideoDanmu videoDanmu;

    private Integer userId;

    private String userName;

    private String userPassw;

    private String userEmail;

    private Date userBirthday;

    private String userSex;

    private Date userRegtime;

    private String userTele;

    private String userType;

    private String userPicadress;

    private Integer userCoin;

    private String userRole;

    public VideoDanmu getVideoDanmu() {
        return videoDanmu;
    }

    public void setVideoDanmu(VideoDanmu videoDanmu) {
        this.videoDanmu = videoDanmu;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassw() {
        return userPassw;
    }

    public void setUserPassw(String userPassw) {
        this.userPassw = userPassw == null ? null : userPassw.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public Date getUserRegtime() {
        return userRegtime;
    }

    public void setUserRegtime(Date userRegtime) {
        this.userRegtime = userRegtime;
    }

    public String getUserTele() {
        return userTele;
    }

    public void setUserTele(String userTele) {
        this.userTele = userTele == null ? null : userTele.trim();
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    public String getUserPicadress() {
        return userPicadress;
    }

    public void setUserPicadress(String userPicadress) {
        this.userPicadress = userPicadress == null ? null : userPicadress.trim();
    }

    public Integer getUserCoin() {
        return userCoin;
    }

    public void setUserCoin(Integer userCoin) {
        this.userCoin = userCoin;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole == null ? null : userRole.trim();
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "video=" + video +
                ", videoDanmu=" + videoDanmu +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassw='" + userPassw + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userBirthday=" + userBirthday +
                ", userSex='" + userSex + '\'' +
                ", userRegtime=" + userRegtime +
                ", userTele='" + userTele + '\'' +
                ", userType='" + userType + '\'' +
                ", userPicadress='" + userPicadress + '\'' +
                ", userCoin=" + userCoin +
                ", userRole='" + userRole + '\'' +
                '}';
    }
}