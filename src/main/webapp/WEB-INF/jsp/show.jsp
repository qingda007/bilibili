<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://page.lanqiao.org/tag"  prefix="pager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="/images/main/bilibili.ico">
    <base href="/">
    <link rel="stylesheet" href="css/search/search.css?v=1">
    <link rel="stylesheet" href="css/main/bass.css" />
    <link rel="stylesheet" href="css/main/header.css" />
    <link rel="stylesheet" href="css/main/iconfont.css" />
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            //从登录界面登录成功后，跳到主界面并给vm.user.uid赋值
            $("#face").attr("src","images/main/akari.jpg");
            $node1=$("div.profile-m").detach();
            $node2=$("li.nipi").detach();
            var id= ${sessionScope.userInfo.userId};
            //导入用户信息
            if(id!=null){
                $.ajax({
                    url:"/getUserInfo",
                    type:"post",
                    dataType:"json",
                    data:{
                        "id":id,
                    },
                    success:function(data){
                        var img=data.userPicadress;
                        if(img!=null){
                            $("#face").attr("src",img);
                        }else{
                            $("#face").attr("src","images/main/akari.jpg");
                        }

                        $("#i-login").remove();
                        $("#fixed-app-download").remove();
                        $("#nipi").prepend($node1);
                        $("#nipi").after($node2);
                        if (data.userTele!=null){
                            $("#s1").text("已绑定");
                        }else {
                            $("#s1").text("未绑定");
                        }
                        if (data.userEmail!=null){
                            $("#s2").text("已绑定");
                        }else {
                            $("#s2").text("未绑定");
                        }
                        //vue
                        vm.user.uname=data.userName;
                        vm.user.coin=data.userCoin;
                    },
                });
                $("#nipi").hover(function () {
                    $(this).addClass("on");
                    $("div.profile-m").show();
                },function () {
                    $(this).removeClass("on");
                    $("div.profile-m").hide();
                });
                $(".tips").siblings().hover(function () {
                    $(this).siblings().show();
                },function () {
                    $(this).siblings().hide();
                });
                //登录退出按钮
            }
        })
    </script>
    <script>
        //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
        $(function () {
            $(window).scroll(function(){
                if ($(window).scrollTop()>100){
                    $("#back-to-top").fadeIn(500);
                }
                else
                {
                    $("#back-to-top").fadeOut(500);
                }
            });
            //当点击跳转链接后，回到页面顶部位置
            $("#back-to-top").click(function(){
                //$('body,html').animate({scrollTop:0},1000);
                if ($('html').scrollTop()) {
                    $('html').animate({ scrollTop: 0 }, 1000);
                    return false;
                }
                $('body').animate({ scrollTop: 0}, 1000);
                return false;
            });

            $("#search").click(function () {
                var videoTitle=$("#search-keyword").val();

                $.ajax({
                    url: "/video/show",
                    data : {"videoTitle":videoTitle},
                    type : "post",
                    dataType: "text",
                    success: function (r) {
                        window.location="/video/show?videoTitle="+videoTitle;
                        console.log(r)
                    },
                    error : function () {
                        alert(0);
                    }
                })
            });
        });
    </script>
</head>
<body id="bili-search">
<div class="bili-header">
    <div class="nav-menu">
        <div class="blur-bg" style="background-image: url(images/main/header.png);"></div>
        <div class="nav-mask"></div>
        <div class="bili-wrapper clearfix nav-wraper">
            <div class="nav-con fl">
                <ul>
                    <li class="nav-item home">
                        <a href="/toZhuye" class="t">
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
                <a class="u-link"href="/video/uploadVideo">投稿</a>
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
                            <a class="login-btn" href="/user/toLogin">登录</a>
                            <p class="reg">首次使用？
                                <a href="/user/toRegister">点我去注册</a>
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
                                            <a class="account"href="/user">
                                                <i class="bili-icon b-icon-p-account"></i>
                                                个人中心
                                            </a>
                                        </li>
                                        <li>
                                            <a class="number"href="/video/uploadVideo">
                                                <i class="bili-icon b-icon-p-member"></i>
                                                投稿管理
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="member-bottom">
                                    <a class="logout"href="/logout">退出</a>
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
<div class="z-top-container" style="height:56px"></div>
<div id="search-app"></div>
<div id="server-search-app" data-server-rendered="true" class="bili-search">
    <div class="contain">
        <div class="head-contain">
            <div class="search-wrap">
                <div>
                    <div class="logo-input clearfix"><a href="javascript:void(0)" class="search-logo"></a>
                        <div class="search-block">
                            <div class="input-wrap"><input id="search-keyword" type="text" maxlength="100"
                                                           autocomplete="off">
                            </div>
                            <div class="search-button"><i class="icon-search-white" ></i>
                                <span class="search-text" id="search">搜索</span>
                            </div>
                            <div class="search-loupe"><i class="icon-loupe"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="navigator">
                <div class="v-switcher">
                    <div class="v-switcher-header-wrap" style="height:56px;">
                        <div class="v-switcher-header-before"></div>
                        <div class="v-switcher-header-after"></div>
                        <div class="v-switcher-header-tabs">
                            <ul class="v-switcher-header v-switcher-header-around v-switcher-header-translate">
                                <li class="v-switcher-header-item is-active1"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword
                                        class="router-link-exact-active router-link-active">
                                    综合
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+>
                                    视频
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    番剧
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    影视
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    直播
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    专栏
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    话题
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/video/show?videoTitle="+keyword>
                                    用户
                                    <!----></a></li>
                                <li class="v-switcher-header-item"
                                    style="height:56px;line-height:56px;width:11.11111111111111%;"><a
                                        href="/photo?keyword="+keyword>
                                    相簿
                                    <!----></a></li>
                                <li class="v-switcher-header-anchor"></li>
                            </ul>
                        </div>
                    </div>
                    <div style="display:none;"></div><!----></div>
            </div>
        </div>
        <div class="body-contain">
            <div id="all-list">
                <div class="flow-loader"><!---->
                    <div class="filter-wrap">
                        <ul class="filter-type clearfix" style="display:none;"></ul>
                        <ul class="filter-type clearfix" style="display:none;"><!----><!----></ul>
                        <a class="fold up" style="display:none;"><span>收起</span><i class="arrow-up"></i></a><a
                            class="fold down" style="display:none;"><span>更多筛选</span><i class="arrow-down"></i></a>
                        <div class="load-state"><span class="loading">正在加载...</span></div>
                    </div>
                    <div class="mixin-list"><!----><!----><!----><!----><!----><!----><!----><!---->
                        <ul type="video" class="video-list clearfix">

                            <c:forEach var="video" items="${pageInfo.list}">
                                <li class="video-item matrix"><a href="/player?videoId=${video.videoId}"
                                                                 title="${video.videoTitle}" target="_blank"
                                                                 class="img-anchor">
                                    <div class="img">
                                        <div class="lazy1-img"><img alt="" src="${video.videoPic}"></div>
                                        <span class="so-imgTag_rb">
                                            <fmt:formatDate pattern="HH:mm:ss" value="${video.videoTime}"></fmt:formatDate>
                                    </span>
                                        <div class="watch-later-trigger watch-later"></div>
                                        <span class="mask-video"></span></div><!----></a>
                                    <div class="info">
                                        <div class="headline clearfix"><span class="type avid" style="display: none;">${video.videoId}</span><span
                                                class="type hide">日常</span>
                                            <a href="${video.videoUrl}" target="_blank" class="title">${video.videoTitle}</a>
                                        </div>
                                        <div class="des hide">
                                                ${video.videoDesc}
                                        </div>
                                        <div class="tags"><span title="观看" class="so-icon watch-num"><i
                                                class="icon-playtime"></i>
        ${video.playNum}
      </span><span title="/弹幕" class="so-icon hide"><i class="icon-subtitle"></i>
        ${video.videoTitle}
      </span><span title="上传时间" class="so-icon time"><i class="icon-date"></i>
                                        <fmt:formatDate value="${video.upTime}" pattern="yyyy-MM-dd" />
      </span><span title="up主" class="so-icon"><i class="icon-uper"></i><a
                                                href="//space.bilibili.com/328472601?from=search" target="_blank"
                                                class="up-name">${video.userId}</a></span></div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div><!---->
                    <div class="page">
                        <pager:page pageNo="${pageInfo.pageNum}" totalRecord="${pageInfo.total}" pageSize="${pageInfo.pageSize}" url="/video/show"></pager:page>
                    </div><br>
                    <div class="flow-loader-state" style="text-align:center;"><!----></div>
                </div>
                <div class="video-info-module" style="display:none;">
                    <div class="v-title"></div>
                    <div class="v-info"><span class="name"></span><span class="line"></span><span class="time"></span>
                    </div>
                    <div class="v-preview clearfix">
                        <div class="lazy1-img"><img alt="" src=""></div>
                        <p class="txt"></p></div>
                    <div class="v-data"><span class="play"><i class="icon"></i>--</span><span class="danmu"><i
                            class="icon"></i>--</span><span class="star"><i class="icon"></i>--</span><span
                            class="coin"><i class="icon"></i>--</span></div>
                </div>
            </div>
        </div>
        <div class="rocket-con"id="back-to-top"style="display: none"></div>
    </div>
</div>
</body>
<script type="text/javascript" src="/js/vue.min.js"></script>
<script>
    var vm=new Vue({
        el:'#nipi',
        data:{
            user:{
                uid:null,
                uname:null,
                coin:null,
            }
        },
    })
    var vNum=new Vue({
        el:'div.online',
        data: {userNum:{
                Num:null
            }
        },
    })
</script>
</html>
