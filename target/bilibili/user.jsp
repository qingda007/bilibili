<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://page.lanqiao.org/tag" prefix="pager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/12
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="css/user/user.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js" rel="script"></script>
    <script>
        //全局变量
        //总数
        var up_num = 0;
        var coll_num = 0
        //每页数
        var per_page = 5;
        //当前页
        var up_cur_page = 1;
        var coll_cur_page = 1;
        //总页
        var up_last_page = 0;
        var coll_last_page = 0
        var up_item_num = 0;
        var coll_item_num = 0;
        var up_list = [];
        var coll_list = [];
        $(function () {
            //导航动态
            $("#nav-collect").click(function () {
                $(".col-1").css("display", "none");
                $(".col-2").css("display", "none");
                $(".col-full").css("display", "block");
                $(".col-3").css("display", "none");
            });
            $("#nav-album").click(function () {
                $(".col-1").css("display", "none");
                $(".col-2").css("display", "none");
                $(".col-full").css("display", "none");
                $(".col-3").css("display", "block");

            });
            $("#nav-home").click(function () {
                $(".col-1").css("display", "block");
                $(".col-2").css("display", "block");
                $(".col-full").css("display", "none");
                $(".col-3").css("display", "none");


            });
            $("#nav-home").hover(function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });

            $("#nav-active").hover(function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "86px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            $("#nav-album").hover(function () {
                $(".n-cursor").css("width", "63px");
                $(".n-cursor").css("left", "152px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            $("#nav-channel").hover(function () {
                $(".n-cursor").css("width", "62px");
                $(".n-cursor").css("left", "232px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            $("#nav-collect").hover(function () {
                $(".n-cursor").css("width", "64px");
                $(".n-cursor").css("left", "312px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            $("#nav-sub").hover(function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "394px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            $("#nav-setting").hover(function () {
                $(".n-cursor").css("width", "52px");
                $(".n-cursor").css("left", "463px");
            }, function () {
                $(".n-cursor").css("width", "50px");
                $(".n-cursor").css("left", "20px");
            });
            //顶置视频
            $("[name='strangeview']").click(function () {
                $("#fans").removeClass("is-active");
                $("#strange").addClass("is-active");
                $(".be-cursor").css("transform", "translateX(114px)");
                $(".be-cursor").css("width", "72px");
                $(".i-pin-empty").css("background-image", "url(images/user/dbz-hint-22.png)");
            });
            $("[name='fansview']").click(function () {
                $("#strange").removeClass("is-active");
                $("#fans").addClass("is-active");
                $(".be-cursor").css("transform", "translateX(0px)");
                $(".be-cursor").css("width", "84px");
                $(".i-pin-empty").css("background-image", "url(images/user/dbz-hint-33.png)");
            });

            //用户信息
            $.ajax({
                url: "http://localhost:8888/getUserInfo",
                type: "post",
                data: {"id": 2},
                datatype: "json",
                success: function (data) {
                    console.log(data);
                    $("#h-gender").before("<span id=\"h-name\">" + data.userName + "</span>");
                    $(".h-ava").prepend("<img src=\"" + data.userPicadress + "\" id=\"h-avatar\">");
                    $("#fav-name").append("<span class=\"fav-up-name\">创建者：" + data.userName + "</span>\n")
                }
            });

            //取关注数
            $.ajax({
                url: "http://localhost:8888/getFansCount",
                type: "post",
                data: {"userId": 1},
                datatype: "json",
                success: function (data) {
                    $(".n-gz").append("<p id=\"n-gz\" class=\"n-data-v spacing-attention\">" + data + "</p>");
                }
            });

            //取粉丝数
            $.ajax({
                url: "http://localhost:8888/getBeFansCount",
                type: "post",
                data: {"fansId": 1},
                datatype: "json",
                success: function (data) {
                    $(".n-fs").append("<p id=\"n-fs\" class=\"n-data-v spacing-fans\">" + data + "</p>");
                }
            });

            //取出上传视频
            $.ajax({
                url: "http://localhost:8888/getVideoUpload",
                type: "post",
                data: {"userId": 2},
                datatype: "json",
                success: function (data) {
                    console.log(data);
                    //总数
                    up_num = data.length;
                    //总页
                    up_last_page = Math.ceil(up_num / per_page);
                    up_list = data;
                    $("#nav-album").append("<span class=\"n-num\">"+up_num+"</span>\n")
                    if (up_last_page == 1) {
                        page(up_num);
                    } else {
                        page(per_page);
                    }
                }
            });

            //生成上传视频界面
            function page(item) {
                $(".submit-video").empty();
                for (var i = 0; i < item; i++, up_item_num++) {
                    $(".submit-video").prepend("<li class=\"small-item\">\n" +
                        "                                    <a class=\"cover-normal\">\n" +
                        "                                        <img src=\"" + up_list[up_item_num].videoPic + "\"alt=\"测试专用AR-15\">\n" +
                        "                                        <span class=\"lenth\">" + gettime(up_list[up_item_num].videoTime) + "</span>\n" +
                        "                                    </a>\n" +
                        "                                    <a class=\"title\">" + up_list[up_item_num].videoTitle + "</a>\n" +
                        "                                    <div class=\"meta pubdate\">上传于:" + getdate(up_list[up_item_num].upTime) + "</div>\n" +
                        "                                    <div class=\"be-dropdown video-edit\">\n" +
                        "                                        <div class=\"be-dropdown-tigger\">\n" +
                        "                                            <i class=\"icon icon-ic-more\"></i>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </li>")
                }
            }

            //上一页
            $("#last").click(function () {
                if (up_cur_page > 1) {
                    up_cur_page--;
                    up();
                }
            });

            //下一页
            $("#next").click(function () {
                if (up_cur_page != up_last_page) {
                    up_cur_page++;
                    up();
                }
            });

            //跳页
            $("#page-size").bind("keypress", function (event) {
                if (event.keyCode == 13) {
                    up_cur_page = $("#page-size").val();
                    up();
                }
            });

            //跳页绑定
            $(".be-page-now").click(function () {
                $(".be-page-now").css("color", "#000");
                $(".be-page-now").css("background-color", "#fff");
                $(".be-page-now").css("border-color", "#d7dde4");
                $(this).css("color", "#fff");
                $(this).css("background-color", "#00a1d6");
                $(this).css("border-color", "#00a1d6");
                up_cur_page = $(this).html();
                up_item_num = (up_cur_page - 1) * per_page;
                if (up_num - up_item_num < per_page) {
                    page(up_num - up_item_num);
                } else {
                    page(per_page);
                }
            });

            //上传更改样式
            function up(){
                $(".be-page-now").css("color", "#000");
                $(".be-page-now").css("background-color", "#fff");
                $(".be-page-now").css("border-color", "#d7dde4");
                for (var i = 0; i < up_last_page; i++) {
                    if (up_cur_page == $(".be-page-click:eq(" + i + ")").html()) {
                        up_item_num = (up_cur_page - 1) * per_page;
                        $(".be-page-now:eq(" + i + ")").css("color", "#fff");
                        $(".be-page-now:eq(" + i + ")").css("background-color", "#00a1d6");
                        $(".be-page-now:eq(" + i + ")").css("border-color", "#00a1d6");
                        if (up_num - up_item_num < per_page) {
                            page(up_num - up_item_num);
                        } else {
                            page(per_page);
                        }
                    }
                }
            }

            //取出收藏视频
            $.ajax({
                url: "http://localhost:8888/getVideoCollection",
                type: "post",
                data: {"userId": 2},
                datatype: "json",
                success: function (data) {
                    console.log(data);
                    //总数
                    coll_num = data.length;
                    //总页
                    coll_last_page = Math.ceil(coll_num / per_page);
                    coll_list = data;
                    $(".favinfo-cover").append("<img src=\"" + data[0].video.videoPic + "\">\n");
                    $("#coll-num").append("<span class=\"num\">" + coll_num + "</span>\n");
                    $("#fav-num").prepend("<span>" + coll_num + "个内容</span>\n");
                    $("#nav-collect").append("<span class=\"n-num\">"+coll_num+"</span>\n");
                    if (coll_last_page == 1) {
                        coll_page(coll_num);
                    } else {
                        coll_page(per_page);
                    }
                    page_num(coll_last_page);
                }
            });

            //生成收藏界面
            function coll_page(item) {
                $(".fav-video-list").empty();
                for (var i = 0; i < item; i++, coll_item_num++) {
                    $(".fav-video-list").prepend("<li class=\"small-item\">\n" +
                        "                                    <a class=\"cover-normal\">\n" +
                        "                                        <img src=\"" + coll_list[coll_item_num].video.videoPic + "\"alt=\"测试专用AR-15\">\n" +
                        "                                        <span class=\"lenth\">" + gettime(coll_list[coll_item_num].video.videoTime) + "</span>\n" +
                        "                                        <div class=\"meta-mask\">\n" +
                        "                                            <div class=\"meta-info\">\n" +
                        "                                                <p class=\"view\">播放：" + coll_list[coll_item_num].video.playNum + "</p>\n" +
                        "                                                <p class=\"favorite\">收藏：" + coll_list[coll_item_num].video.collectionNum + "</p>\n" +
                        "                                                <p class=\"author\">UP：" + coll_list[coll_item_num].video.userInfo.userName + "</p>\n" +
                        "                                                <p class=\"pubdate\">投稿时间：" + getdate(coll_list[coll_item_num].video.upTime) + "</p>\n" +
                        "                                            </div>\n" +
                        "                                        </div>\n" +
                        "                                    </a>\n" +
                        "                                    <a class=\"title\">" + coll_list[coll_item_num].video.videoTitle + "</a>\n" +
                        "                                    <div class=\"meta pubdate\">收藏于:" + getdate(coll_list[coll_item_num].collectTime) + "</div>\n" +
                        "                                    <div class=\"be-dropdown video-edit\">\n" +
                        "                                        <div class=\"be-dropdown-tigger\">\n" +
                        "                                            <i class=\"icon icon-ic-more\"></i>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </li>")
                }
            }

            //生成页面
            function page_num(data) {
                for (var i = 2; i < data + 1; i++) {
                    $("#coll-next").before("<li class=\"be-page-item be-page-click\">" + i + "</li>\n")
                }
                $("#coll-next").after("<span class=\"be-page-total\">共" + data + "页</span>\n");
                $(".be-page-click").bind("click", jump);
            }

            // 上一页
            $("#coll-last").click(function () {
                if (coll_cur_page > 1) {
                    coll_cur_page--;
                    coll();
                }
            });

            //下一页
            $("#coll-next").click(function () {
                if (coll_cur_page != coll_last_page) {
                    coll_cur_page++;
                    coll();
                }
            });

            //跳页
            $("#jump-page").bind("keypress", function (event) {
                if (event.keyCode == 13) {
                    coll_cur_page = $("#jump-page").val();
                    coll();
                }
            });

            //跳页绑定
            var jump = function () {
                $(".be-page-click").css("color", "#000");
                $(".be-page-click").css("background-color", "#fff");
                $(".be-page-click").css("border-color", "#d7dde4");
                $(this).css("color", "#fff");
                $(this).css("background-color", "#00a1d6");
                $(this).css("border-color", "#00a1d6");
                coll_cur_page = $(this).html();
                coll_item_num = (coll_cur_page - 1) * per_page;
                if (coll_num - coll_item_num < per_page) {
                    coll_page(coll_num - coll_item_num);
                } else {
                    coll_page(per_page);
                }
            }

            //收藏更改样式
            function coll() {
                $(".be-page-click").css("color", "#000");
                $(".be-page-click").css("background-color", "#fff");
                $(".be-page-click").css("border-color", "#d7dde4");
                for (var i = 0; i < coll_last_page; i++) {
                    if (coll_cur_page == $(".be-page-click:eq(" + i + ")").html()) {
                        coll_item_num = (coll_cur_page - 1) * per_page;
                        $(".be-page-click:eq(" + i + ")").css("color", "#fff");
                        $(".be-page-click:eq(" + i + ")").css("background-color", "#00a1d6");
                        $(".be-page-click:eq(" + i + ")").css("border-color", "#00a1d6");
                        if (coll_num - coll_item_num < per_page) {
                            coll_page(coll_num - coll_item_num);
                        } else {
                            coll_page(per_page);
                        }
                    }
                }
            }

            //转换日期
            function getdate(t) {
                var _time = new Date(t);
                var year = _time.getFullYear();//2017
                var month = _time.getMonth() + 1;//7
                var date = _time.getDate();//10
                return year + "-" + month + "-" + date;
            }

            //转化时长
            function gettime(t) {
                var _time = new Date(t);
                var hour = _time.getHours();//10
                var minute = _time.getMinutes();//56
                var second = _time.getSeconds();//15
                if(hour<10){
                    hour="0"+hour;
                }
                if(minute<10){
                    minute="0"+minute;
                }
                if(second<10){
                    second="0"+second;
                }
                return hour + ":" + minute + ":" + second;
            }

        })
    </script>
</head>
<body>
<div class="top-menu">
    <div class="top-mask"></div>
    <div class="top-wrapper">
        <div class="top-cont">
            <ul>
                <li id="main">
                    <a title="主站" class="t">
                        <dt id="tv"></dt>
                        主站
                    </a>
                </li>
                <li id="audio" class="content">
                    <a title="音频" class="t">音频</a>
                </li>
                <li id="game" class="content">
                    <a title="游戏" class="t">游戏</a>
                </li>
                <li id="live" class="content">
                    <a title="直播" class="t">直播</a>
                </li>
                <li id="buy" class="content">
                    <a title="会员购" class="t">会员购</a>
                </li>
                <li id="manga" class="content">
                    <a title="漫画" class="t">漫画</a>
                </li>
                <li id="BW" class="content">
                    <a title="BW" class="t">BW</a>
                </li>
                <li id="years" class="content">
                    <a title="years" class="t">70年</a>
                </li>
                <li id="download">
                    <a title="download" class="t">
                        <dt id="phone"></dt>
                        下载APP
                    </a>
                </li>
            </ul>
        </div>
        <div class="up-load">
            <a>投稿</a>
        </div>
        <div class="nav-cont">
            <ul>
                <li id="account" class="info">
                    <div class="i-face">
                        <a href="/account/account">
                        <img src="images/user/head.webp" class="face">
                        </a>
                    </div>
                </li>
                <li id="big-vip" class="info"><a title="大会员" class="t">大会员</a></li>
                <li id="message" class="info"><a title="消息" class="t">消息</a></li>
                <li id="item" class="info"><a title="动态" class="t">动态</a></li>
                <li id="watchlater" class="info"><a title="稍后再看" class="t">稍后再看</a></li>
                <li id="collection" class="info"><a title="收藏" class="t">收藏</a></li>
                <li id="history" class="info"><a title="历史" class="t">历史</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="app" class="owner">
    <div class="h">
        <div class="wrapper">
            <div class="h-inner">
                <div class="h-grad"></div>
                <div class="h-user">
                    <div class="h-info">
                        <div class="h-ava">
                            <a target="_blank" class="avatar-cover">更换头像</a>
                            <span title="年度大会员" class="user-vip"></span>
                        </div>
                        <div class="h-basic">
                            <div>
                                <span id="h-gender" class="male icon"></span>
                                <a class="h-lvl"></a>
                                <a class="h-viptype">年度大会员</a>
                            </div>
                            <div class="h-spacing">
                                <input id="h-sign" type="text" placeholder="人间岂能安得双全法" maxlength="60">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="navigator" class="n">
        <div class="wrapper">
            <div class="n-inner">
                <div class="n-table">
                    <a class="n-btn active" id="nav-home">
                        <span class="ic-home">
                            <dt id="house"></dt>
                        </span>
                        <span class="n-text">主页</span>
                    </a>
                    <a class="n-btn active" id="nav-active">
                        <span class="ic-home">
                            <dt id="active"></dt>
                        </span>
                        <span class="n-text">动态</span>
                    </a>
                    <a class="n-btn active" id="nav-album">
                        <span class="ic-home">
                            <dt id="album"></dt>
                        </span>
                        <span class="n-text">投稿</span>
                    </a>
                    <a class="n-btn active" id="nav-channel">
                        <span class="ic-home">
                            <dt id="channel"></dt>
                        </span>
                        <span class="n-text">频道</span>
                        <span class="n-num">0</span>
                    </a>
                    <a class="n-btn active" id="nav-collect">
                        <span class="ic-home">
                           <dt id="collect"></dt>
                        </span>
                        <span class="n-text">收藏</span>
                    </a>
                    <a class="n-btn active" id="nav-sub">
                        <span class="ic-home">
                            <dt id="sub"></dt>
                        </span>
                        <span class="n-text">订阅</span>
                    </a>
                    <a class="n-btn active" id="nav-setting">
                        <span class="ic-home">
                            <dt id="setting"></dt>
                        </span>
                        <span class="n-text">设置</span>
                    </a>
                </div>
                <div class="search-box">
                    <input type="text" placeholder="搜索视频">
                    <span class="search-btn"></span>
                </div>
                <div class="n-static">
                    <a class="n-data n-gz">
                        <p class="n-data-k">关注数</p>
                    </a>
                    <a class="n-data n-fs">
                        <p class="n-data-k">粉丝数</p>
                    </a>
                </div>
            </div>
            <div class="n-cursor" style="width: 50px;left: 20px"></div>
        </div>
    </div>
    <div id="s-space" class="h">
        <div id="page-index" class="wrapper">
            <div class="col-1">
                <div class="section">
                    <div class="b-tab">
                        <ul class="b-tab-inner">
                            <li class="b-tab-item is-active" id="fans">
                                <input type="radio" class="b-tab-input" value="top" name="fansview">
                                <span>我的粉丝会看到</span>
                            </li>
                            <li class="b-tab-item" id="strange">
                                <input type="radio" class="b-tab-input" value="masterpiece" name="strangeview">
                                <span>新访客会看到</span>
                            </li>
                        </ul>
                        <div class="be-cursor" style="transform: translateX(0px); width: 84px;">
                        </div>
                    </div>
                    <div class="i-pin-part">
                        <div class="i-pin-empty" style="background-image: url(images/user/dbz-hint-33.png)">
                            <div class="i-pin-empty-set list-create">
                                <div class="i-create ">
                                    <div class="i-icon icon"></div>
                                    <div class="text">设置顶置视频</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section video">
                    <h3 class="section-title">
                        <a class="t">我的视频</a>
                        <div class="sec-empty-hint">你还没上传视频哦~
                            <a>立即上传</a>
                        </div>
                    </h3>
                </div>
                <div class="section article">
                    <h3 class="section-title">
                        <a class="t">我的频道</a>
                    </h3>
                </div>
                <div class="section fav">
                    <h3 class="section-title">
                        <a class="t">我的收藏夹</a>
                        <a class="more icon">更多</a>
                    </h3>
                    <div class="fav-content">
                        <div class="fav-item">
                            <a class="fav-cover">
                                <img src="images/user/test.png">

                            </a>
                            <span class="fav-count">124</span>
                            <div class="m">
                                <span class="stat">公开</span>
                                <a class="name">默认收藏夹</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div>
                    <div class="section" id="renzheng">
                        <div class="no-auth">
                            <img src="images/user/icon-auth.png" class="icon-auth">
                            <div class="no-auth-title">
                                <a class="goto-auth">
                                    点击申请bilibili认证
                                </a>
                                <span>获得 bilibili 认证，享受多重认证福利！</span>
                            </div>
                        </div>
                    </div>
                    <div class="section i-m">
                        <div class="i-m-r1">
                            <a class="i-m-title">
                                <span class="icon-i-title"></span>
                                <span class="icon-m-r"></span>
                            </a>
                        </div>
                        <div class="i-m-r2">
                            <a class="i-m-btn i-m-x">
                                <span class="i-m-u icon"></span>
                                <span class="i-m-text">视频投稿</span>
                            </a>
                            <a class="i-m-btn i-m-x">
                                <span class="i-m-v icon"></span>
                                <span class="i-m-text">内容管理</span>
                            </a>
                        </div>
                    </div>
                    <div class="section i-ann">
                        <h3 class="section-title">公告</h3>
                        <div class="content1">
                            <div content="be-input">
                                <textarea rows="4" type="textare" placeholder="编辑我的公告空间" maxlength="150"
                                          class="be-textarea-inner"></textarea>
                                <div class="be-input-word-count">0/150</div>
                            </div>
                        </div>
                    </div>
                    <div class="section user">
                        <div class="information">
                            <div class="content1">
                                <div class="meta">
                                    <div class="row">
                                        <div class="item uid">
                                            <span class="icon"></span>
                                            <span class="text">5551281</span>
                                        </div>
                                        <div class="item birthday">
                                            <span class="icon"></span>
                                            <a class="text">09-01</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-full">
                <div class="col-cover">
                    <div class="fav-sidenav">
                        <div class="fav-container">
                            <div class="favlist-title">
                                <p>我的创建</p>
                                <i class="icon icon-arrow arrow-transform"></i>
                            </div>
                            <div style="display: block">
                                <div class="be-scrollbar ps" id="fav-container">
                                    <div class="nav-title">


                                        <span class="icon icon-add"></span>
                                        <span class="text">新建收藏夹</span>
                                    </div>
                                    <div class="cur" id="coll-num">
                                        <span class="icon iconfont"></span>
                                        <a class="text text-router">默认收藏夹</a>
                                        <div class="be-dropdown">
                                            <div class="be-dropdown-tigger">
                                                <i class="icon icon-ic-more"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="play-list">
                            <div class="fav-list-container">
                                <ul class="fav-list">
                                    <li class="cur">
                                        <span class="icon icon-private"></span>
                                        <a class="text">播单收藏夹</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="cur">
                                        <span class="icon icon-private"></span>
                                        <a class="text">话题收藏夹</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="cur">
                                        <span class="icon icon-private"></span>
                                        <a class="text">专栏收藏夹</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="cur">
                                        <span class="icon icon-private"></span>
                                        <a class="text">相簿收藏夹</a>
                                        <span class="num">0</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <a class="watch-later">稍后再看</a>
                    </div>
                    <div class="fav-main">
                        <div class="favlistinfo">
                            <div class="favinfo-box">
                                <a class="favinfo-cover">
                                </a>
                                <div class="favinfo-details">
                                    <a class="fav-name">默认收藏夹</a>
                                    <div class="fav-meta" id="fav-name">
                                    </div>
                                    <div class="fav-meta" id="fav-num">
                                        <span class="dot">·</span>
                                        <span>公开</span>
                                    </div>
                                    <div class="fav-option">
                                        <a class="fav-play">
                                            <i class="icon-bofang"></i>播放全部
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="fav-head">
                            <div class="fav-info">
                                <div class="fav-filter">
                                    <div class="filter-item">
                                        <span class="text">批量操作</span>
                                    </div>
                                    <div class="be-dropdown filter-item">
                                    <span class="text">全部分区
                                        <i class="icon icon-arrow"></i>
                                    </span>
                                    </div>
                                    <div class="be-dropdown filter-item">
                                    <span class="text">最近收藏
                                        <i class="icon icon-arrow"></i>
                                    </span>
                                    </div>
                                    <div class="filter-item search">
                                        <div class="be-dropdown search-types">
                                            <div>当前<i class="icon icon-arrow"></i></div>
                                        </div>
                                        <div class="search-input search-container">
                                            <input type="text" placeholder="输入关键词" class="search-fav-input">
                                            <span class="icon icon-search"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="fav-content section">
                            <ul class="fav-video-list">

                            </ul>

                            <ul class="be-page">
                                <li class="be-page-item be-page-prev be-page-disabled" id="coll-last"><a>上一页</a></li>
                                <li class="be-page-item be-page-click" id="first">1</li>
                                <li class="be-page-item be-page-next" id="coll-next"><a>下一页</a></li>
                                <span class="be-page-option">跳至<input type="text" id="jump-page">页</span>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="col-3-cover">
                    <div class="sidenav">
                        <div class="containlist">
                            <div class="list-container">
                                <ul class="contribution-list">
                                    <li class="contribution-item now">
                                        <a class="text text-router-link">视频</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="contribution-item">
                                        <a class="text">音频</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="contribution-item">
                                        <a class="text">专栏</a>
                                        <span class="num">0</span>
                                    </li>
                                    <li class="contribution-item">
                                        <a class="text">相簿</a>
                                        <span class="num">0</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="main-content">
                        <div class="row page-head">
                            <div class="breadcrumb">
                                <p class="item">我的视频</p>
                            </div>
                            <div class="submit-video">

                            </div>
                            <ul class="be-page">
                                <li class="be-page-item be-page-prev be-page-disabled" id="last"><a>上一页</a></li>
                                <li class="be-page-item be-page-now" id="second">1</li>
                                <li class="be-page-item be-page-now">2</li>
                                <li class="be-page-item be-page-now">3</li>
                                <li class="be-page-item be-page-next" id="next">下一页</li>
                                <span class="be-page-total">共7页</span>
                                <span class="be-page-option">跳至<input type="text" id="page-size">页</span>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>