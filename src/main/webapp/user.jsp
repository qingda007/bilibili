<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://page.lanqiao.org/tag" prefix="pager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        $(function () {
            //导航动态
            $("#nav-collect").click(function () {
                $(".col-1").css("display","none");
                $(".col-2").css("display","none");
                $(".col-full").css("display","block");
            });
            $("#nav-album").click(function () {
                $(".col-1").css("display", "none");
                $(".col-2").css("display", "none");
                $(".col-full").css("display", "none");
                $(".col-3").css("display", "block");
            });
            $("#nav-home").click(function () {
                $(".col-1").css("display","block");
                $(".col-2").css("display","block");
                $(".col-full").css("display","none");
            });
            $("#nav-home").hover(function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-active").hover(function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","86px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-album").hover(function () {
                $(".n-cursor").css("width","59px");
                $(".n-cursor").css("left","152px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-channel").hover(function () {
                $(".n-cursor").css("width","62px");
                $(".n-cursor").css("left","227px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-collect").hover(function () {
                $(".n-cursor").css("width","62px");
                $(".n-cursor").css("left","305px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-sub").hover(function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","383px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            $("#nav-setting").hover(function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","449px");
            },function () {
                $(".n-cursor").css("width","50px");
                $(".n-cursor").css("left","20px");
            });
            //顶置视频
            $("[name='strangeview']").click(function () {
                $("#fans").removeClass("is-active");
                $("#strange").addClass("is-active");
                $(".be-cursor").css("transform","translateX(114px)");
                $(".be-cursor").css("width","72px");
                $(".i-pin-empty").css("background-image","url(images/dbz-hint-22.png)");
            })
            $("[name='fansview']").click(function () {
                $("#strange").removeClass("is-active");
                $("#fans").addClass("is-active");
                $(".be-cursor").css("transform","translateX(0px)");
                $(".be-cursor").css("width","84px");
                $(".i-pin-empty").css("background-image","url(images/dbz-hint-33.png)");
            })
            //后端
            $.ajax({
                url:"http://localhost:8888/getUserInfo",
                type:"post",
                data:{"id":2},
                datatype:"json",
                success:function (data) {
                    console.log(data);
                    $("#h-gender").before("<span id=\"h-name\">"+data.userName+"</span>");
                    $(".h-ava").prepend("<img src=\""+data.userPicadress+"\" id=\"h-avatar\">");
                    $("#fav-name").append("<span class=\"fav-up-name\">创建者："+data.userName+"</span>\n")
                }
            })
            $.ajax({
                url:"http://localhost:8888/getFansCount",
                type:"post",
                data:{"userId":1},
                datatype:"json",
                success:function (data) {
                    $(".n-gz").append("<p id=\"n-gz\" class=\"n-data-v spacing-attention\">"+data+"</p>");
                }
            })
            $.ajax({
                url:"http://localhost:8888/getBeFansCount",
                type:"post",
                data:{"fansId":1},
                datatype:"json",
                success:function (data) {
                    $(".n-fs").append("<p id=\"n-fs\" class=\"n-data-v spacing-fans\">"+data+"</p>");
                }
            })
            $.ajax({
                url: "http://localhost:8888/getVideoUpload",
                type: "post",
                data: {"userId": 2},
                datatype: "json",
                success: function (data) {
                    alert(data);
                    console.log(data);
                }
            })
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
                <li id="game"class="content">
                    <a title="游戏" class="t">游戏</a>
                </li>
                <li id="live"class="content">
                    <a title="直播" class="t">直播</a>
                </li>
                <li id="buy"class="content">
                    <a title="会员购" class="t">会员购</a>
                </li>
                <li id="manga"class="content">
                    <a title="漫画" class="t">漫画</a>
                </li>
                <li id="BW"class="content">
                    <a title="BW" class="t">BW</a>
                </li>
                <li id="years"class="content">
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
                        <img src="images/user/head.webp" class="face">
                    </div>
                </li>
                <li id="big-vip"class="info"><a title="大会员" class="t">大会员</a></li>
                <li id="message"class="info"><a title="消息" class="t">消息</a></li>
                <li id="item"class="info"><a title="动态" class="t">动态</a></li>
                <li id="watchlater"class="info"><a title="稍后再看" class="t">稍后再看</a></li>
                <li id="collection"class="info"><a title="收藏" class="t">收藏</a></li>
                <li id="history"class="info"><a title="历史" class="t">历史</a></li>
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
                            <span title="年度大会员"class="user-vip"></span>
                        </div>
                        <div class="h-basic">
                            <div>
                                <span id="h-gender" class="male icon"></span>
                                <a class="h-lvl"></a>
                                <a class="h-viptype">年度大会员</a>
                            </div>
                            <div class="h-spacing">
                                <input id="h-sign" type="text" placeholder="人间岂能安得双全法"maxlength="60">
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
                    <a class="n-btn active"id="nav-home">
                        <span class="ic-home">
                            <dt id="house"></dt>
                        </span>
                        <span class="n-text">主页</span>
                    </a>
                    <a class="n-btn active"id="nav-active">
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
                        <span class="n-num">0</span>
                    </a>
                    <a class="n-btn active"id="nav-channel">
                        <span class="ic-home">
                            <dt id="channel"></dt>
                        </span>
                        <span class="n-text">频道</span>
                        <span class="n-num">0</span>
                    </a>
                    <a class="n-btn active"id="nav-collect">
                        <span class="ic-home">
                           <dt id="collect"></dt>
                        </span>
                        <span class="n-text">收藏</span>
                        <span class="n-num">0</span>
                    </a>
                    <a class="n-btn active"id="nav-sub">
                        <span class="ic-home">
                            <dt id="sub"></dt>
                        </span>
                        <span class="n-text">订阅</span>
                    </a>
                    <a class="n-btn active"id="nav-setting">
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
            <div class="n-cursor"style="width: 50px;left: 20px"></div>
        </div>
    </div>
    <div id="s-space" class="h">
        <div id="page-index" class="wrapper">
            <div class="col-1">
                <div class="section">
                    <div class="b-tab">
                        <ul class="b-tab-inner">
                            <li class="b-tab-item is-active"id="fans">
                                <input type="radio" class="b-tab-input" value="top"name="fansview">
                                <span>我的粉丝会看到</span>
                            </li>
                            <li class="b-tab-item" id="strange">
                                <input type="radio" class="b-tab-input" value="masterpiece"name="strangeview">
                                <span>新访客会看到</span>
                            </li>
                        </ul>
                        <div class="be-cursor"style="transform: translateX(0px); width: 84px;">
                        </div>
                    </div>
                    <div class="i-pin-part">
                        <div class="i-pin-empty"style="background-image: url(images/user/dbz-hint-33.png)">
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
                                <textarea rows="4" type="textare" placeholder="编辑我的公告空间" maxlength="150"class="be-textarea-inner"></textarea>
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
                                    <div class="cur">
                                        <span class="icon iconfont"></span>
                                        <a class="text text-router">默认收藏夹</a>
                                        <span class="num">${pageInfo.total}</span>
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
                                    <img src="${pageInfo.list.get(0).video.videoPic}">
                                </a>
                                <div class="favinfo-details">
                                    <a class="fav-name">默认收藏夹</a>
                                    <div class="fav-meta" id="fav-name">
                                    </div>
                                    <div class="fav-meta">
                                        <span>${pageInfo.total}个内容</span>
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
                                            <div>当前<i class="icon icon-arrow"></i> </div>
                                        </div>
                                        <div class="search-input search-container">
                                            <input type="text"placeholder="输入关键词" class="search-fav-input">
                                            <span class="icon icon-search"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="fav-content section">
                            <ul class="fav-video-list">
                                <c:forEach var="videoCollection" items="${pageInfo.list}">
                                <li class="small-item">
                                    <a class="cover-normal">
                                        <img src="${videoCollection.video.videoPic}"alt="测试专用AR-15">
                                        <span class="lenth">08:30</span>
                                        <div class="meta-mask">
                                            <div class="meta-info">
                                                <p class="view">播放：${videoCollection.video.playNum}</p>
                                                <p class="favorite">收藏：${videoCollection.video.collectionNum}</p>
                                                <p class="author">UP:${videoCollection.userId}</p>
                                                <p class="pubdate">投稿时间：<fmt:formatDate value="${videoCollection.video.upTime}" pattern="yyyy-MM-dd"/></p>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="title">${videoCollection.video.videoTitle}</a>
                                    <div class="meta pubdate">收藏于：<fmt:formatDate value="${videoCollection.collectTime}" pattern="yyyy-MM-dd"/> </div>
                                    <div class="be-dropdown video-edit">
                                        <div class="be-dropdown-tigger">
                                            <i class="icon icon-ic-more"></i>
                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>

                            <ul class="be-page">
                                <li class="be-page-item be-page-prev be-page-disabled"><a>上一页</a></li>
                                <li class="be-page-item be-page-active"><a>1</a></li>
                                <li class="be-page-item"><a>2</a></li>
                                <li class="be-page-item"><a>3</a></li>
                                <li class="be-page-item-jump-next"></li>
                                <li class="be-page-item"><a>7</a></li>
                                <li class="be-page-item be-page-next"><a>下一页</a></li>
                                <span class="be-page-total">共7页</span>
                                <span class="be-page-option">跳至<input type="text">页</span>
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
                            <div class="submit-video"></div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>
</div>
</body>
</html>