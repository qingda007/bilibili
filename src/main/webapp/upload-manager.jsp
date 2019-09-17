<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://page.lanqiao.org/tag"  prefix="pager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
  Created by IntelliJ IDEA.
  User: gosick39
  Date: 2019/9/15
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创作中心 - 哔哩哔哩弹幕视频网 - ( ゜- ゜)つロ 乾杯~</title>
    <link rel="stylesheet" href="/css/upload/upload_menu.css" type="text/css">
    <link rel="stylesheet" href="/css/main/header.css" />
    <link rel="stylesheet" href="/css/upload/upload_manager.css">
    <link rel="stylesheet" href="/css/main/iconfont.css">
    <script src="/js/jquery-3.4.1.js"></script>
    <script>
        function getVideo(isReview) {
            $('#flushDIV').html("");
            $.ajax({
                url: "http://localhost:8888/video/managerVideo",
                type: "post",
                data: {"isReview": isReview},
                dataType: "html",
                cache: false,
                success: function (data) {
                    var Obj = $("#flushDIV").append($(data));
                    //需要获取的对应块
                    var $html = $("#flushDIV", Obj);
                    //获取对应块中的内容
                    $('#flushDIV').html($html.html());
                }
            });
        }
        function getTime(d1) {
            var d2=new Date("1970/01/01 08:00:00");
            var d3=d1-d2;
            var h=Math.floor(d3/3600000);
            var m=Math.floor((d3-h*3600000)/60000);
            var s=(d3-h*3600000-m*60000)/1000;
            var time = "相差"+h+"小时"+m+"分"+s+"秒";
            $(".duration").html(time);
            return time;
        }
        $(function () {
            $menu_left=$(".left a");
            $menu_left.click(function () {
                $(this).addClass("current");
                $(this).siblings().removeClass("current");
            })
        })
    </script>
</head>
<body>
<div class="bili-header">
    <div class="nav-menu">
        <div class="blur-bg" style="background-image: url(images/main/header.png);"></div>
        <div class="nav-mask"></div>
        <div class="bili-wrapper clearfix nav-wraper" style="min-width: 1500px; margin-left: 80px;">
            <div class="nav-con fl">
                <ul>
                    <li class="nav-item home">
                        <a class="t">
                            <i class="iconfont icon-bilibili" style="color: #00A1D6;"></i> 主站
                        </a>
                    </li>
                    <li class="nav-item mbili">
                        <a class="t">音频</a>
                    </li>
                    <li class="nav-item game">
                        <a class="t">游戏中心</a>
                    </li>
                    <li class="nav-item live">
                        <a class="t">直播</a>
                    </li>
                    <li class="nav-item buy">
                        <a class="t">会员购</a>
                    </li>
                    <li class="nav-item manga">
                        <a class="t">漫画</a>
                    </li>
                    <li class="nav-item loc-menu">
                        <a class="t">BW</a>
                    </li>
                    <li class="nav-item loc-menu">
                        <a class="t">70年</a>
                    </li>
                    <li class="nav-item moblie">
                        <a class="t">
                            <i class="iconfont icon-contextphone" style="color: #00A1D6;"></i>下载APP
                        </a>
                    </li>
                </ul>
            </div>
            <div class="up-load fr">
                <a class="u-link">投稿</a>
            </div>
            <div class="nav-con fr">
                <ul class="fr">
                    <li id="nipi" class="nav-item profile-info" >
                        <a class="t">
                            <i class="i-face">
                                <img id="face" class="face">
                                <img class="pendant"  />
                            </i>
                        </a>
                        <div id="i-login" class="i_menu i_menu_login" style="display: none;">
                            <p class="tip">登录后你可以：</p>
                            <div class="img">
                                <img id="d1" src="images/main/danmu1.png" />
                                <img id="d2" src="images/main/danmu1.png" style="left: 320px;" />
                            </div>
                            <a class="login-btn">登录</a>
                            <p class="reg">首次使用？
                                <a>点我去注册</a>
                            </p>
                        </div>
                        <div class="profile-m dd-bubble"style="display: none">
                            <div class="header-u-info">
                                <div class="header-uname">
                                    <b class="big-vip-red">{{user.uname}}</b>
                                    <p class="vip-type">
                                        <a>
                                            <span class="big-vip-red">会员</span>
                                        </a>
                                    </p>
                                </div>
                                <div class="btns-profile clearfix">
                                    <div class="coin fl">
                                        <a>
                                            <i class="bili-icon bi"></i>
                                            <span class="num">{{user.coin}}</span>
                                        </a>
                                    </div>
                                    <div class="ver phone fr verified">
                                        <a>
                                            <i class="bili-icon"></i>
                                            <span id="s1" class="tips"></span>
                                        </a>
                                    </div>
                                    <div class="ver email fr verified">
                                        <a>
                                            <i class="bili-icon"></i>
                                            <span id="s2" class="tips"></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="member-menu">
                                    <ul class="clearfix">
                                        <li>
                                            <a class="account">
                                                <i class="bili-icon b-icon-p-account"></i>
                                                个人中心
                                            </a>
                                        </li>
                                        <li>
                                            <a class="number">
                                                <i class="bili-icon b-icon-p-member"></i>
                                                投稿管理
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="member-bottom">
                                    <a class="logout">退出</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item nipi">
                        <a class="t">
                            稍后再看
                        </a>
                    </li>
                    <li class="nav-item nipi">
                        <a class="t">
                            收藏
                        </a>
                    </li>
                    <li class="nav-item nipi">
                        <a class="t">
                            消息
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="t">
                            动态
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="t">
                            历史
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="cc-nav-wrp">
    <div class="cc-nav">
        <a href="#/home" class="logo" id="nav_home"></a>
        <div class="nav-upload-btn"><a href="/video/uploadVideo" class="active" id="nav_upload_btn">投稿</a></div>
        <ul class="nav-wrp">
            <li id="nav_upload_home">
                <a href="/video/uploadVideo" class="nav-item">
                    <i class="fontvt icon-ic_home"></i>
                    <span>首页管理</span>
                </a>
            </li>
            <li id="nav_upload_manager">
                <a href="/video/managerVideo" class="nav-item">
                    <i class="fontvt icon-ic_gaojian_manger"></i>
                    <span>内容管理</span>
                </a>
            </li>
            <li id="nav_upload_income">
                <a href="/video/managerVideo" class="nav-item">
                    <i class="fontvt icon-ic_income"></i>
                    <span>收益管理</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<div id="upload-manager-container">
    <div class="cc-body cc-body-link-tag-height">
        <div class="cc-content-body">
            <div class="page-wrp is-article cc-article-wrp">
                <div class="article-header clearfix">
                    <div class="left">
                        <a href="javascript:getVideo(-1)" class="bili-tab current">全部稿件（${length}）</a>
                        <a href="javascript:getVideo(0)" class="bili-tab">待审核（${waitReview}）</a>
                        <a href="javascript:getVideo(1)" class="bili-tab">已通过（${isPass}）</a>
                        <a href="javascript:getVideo(2)" class="bili-tab">未通过（${noPass}）</a>
                    </div>
                </div>
                <div class="info-wrp"style="display: none">
                    <div class="text">你还没有投过一个稿件("▔□▔)</div>
                    <img src="/images/upload/weitougao.png">
                    <a class="cc-btn is-main">
                        <span class="icon-text">投稿</span>
                    </a>
                </div><!--未投稿状态-->
                <div id="flushDIV">
                    <c:forEach var="video" items="${pageInfo.list}">
                        <div class="article-card clearfix" id="${video.videoId}">
                            <a class="cover-wrp">
                                <img src="${video.videoPic}">
                                <div class="duration"><fmt:formatDate pattern="HH:mm:ss" value="${video.videoTime}"></fmt:formatDate></div><!--时长-->
                                <div class="tag-wrapper">${videos.size()}</div>
                            </a>
                            <div class="meta-wrp">
                                <div class="meta-title">
                                    <span class="typename">${video.status.statusAlias1}</span>
                                    <a class="name1 ellipsis">${video.videoTitle}</a>
                                </div>
                                <div class="meta-status">
                                    <div class="status hint--rounded hint--bottom is-pubdate">
                                        <span class="shenhe">审核中</span>
                                    </div>
                                    <span class="pubdate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${video.upTime}"></fmt:formatDate></span><!--上传时间-->
                                </div>

                                <form name='form${video.videoId}' action='/video/selectVideo' method='post'>
                                    <input type='hidden' id="videoId" name="videoId" value='${video.videoId}'/>
                                    <div class="meta-view">
                                        <a href="javascript:document.form${video.videoId}.submit();" class="bili-btn ok">编辑</a>
                                    </div>
                                </form>
                                <div class="meta-footer clearfix">
                                    <div class="click view-stat">
                                        <i class="iconfont icon-bofang"></i>
                                        <span class="icon-text click-text">${video.playNum}</span>
                                    </div>
                                    <div class="danmu view-stat">
                                        <i class="iconfont icon-danmu"></i>
                                        <span class="icon-text click-text">${video.danmuNum}</span>
                                    </div>
                                        <%--                            <div class="comment view-stat">--%>
                                        <%--                                <i class="iconfont icon-chatcommentmessa"></i>--%>
                                        <%--                                <span class="icon-text click-text">0</span>--%>
                                        <%--                            </div>--%>
                                    <div class="coin view-stat">
                                        <i class="iconfont icon-toubi"></i>
                                        <span class="icon-text click-text">${video.coinNum}</span>
                                    </div>
                                    <div class="favorite view-stat">
                                        <i class="iconfont icon-shoucang"></i>
                                        <span class="icon-text click-text">${video.collectionNum}</span>
                                    </div>
                                    <div class="like view-stat">
                                        <i class="iconfont icon-dianzan-copy"></i>
                                        <span class="icon-text click-text">${video.likeNum}</span>
                                    </div>
                                        <%--                            <div class="share view-stat">--%>
                                        <%--                                <i class="iconfont icon-zhuanfa"></i>--%>
                                        <%--                                <span class="icon-text click-text">${video.playNum}</span>--%>
                                        <%--                            </div>--%>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="page">
                        <pager:page pageNo="${pageInfo.pageNum}" totalRecord="${pageInfo.total}" pageSize="${pageInfo.pageSize}" url="/video/managerVideo"></pager:page>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
