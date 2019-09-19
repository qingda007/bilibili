<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://page.lanqiao.org/tag"  prefix="pager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String path=request.getContextPath();
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head><title data-vue-meta="true">
</title>
    <meta data-vue-meta="true" charset="UTF-8">
    <base href="${pageContext.request.contextPath}/">
    <link rel="shortcut icon" href="//static.hdslb.com/images/favicon.ico">
    <link rel="stylesheet" href="css/serach/serach.css">
    <script src="js/jquery-3.4.1.js"></script>
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
                //  alert(typeof (videoTitle));
                $.ajax({
                    url: "http://localhost:8888/video/show",
                    data : {"videoTitle":videoTitle},
                    type : "post",
                    dataType: "text",
                    success: function (r) {
                        window.location="http://localhost:8888/video/show?videoTitle="+videoTitle;
                        window.title = videoTitle+'- 搜索结果 - 哔哩哔哩弹幕视频网 - ( ゜- ゜)つロ 乾杯~ - bilibili';
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
                                <li class="v-switcher-header-item is-active"
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
                                <li class="video-item matrix"><a href="${video.videoUrl}"
                                                                 title="${video.videoTitle}" target="_blank"
                                                                 class="img-anchor">
                                    <div class="img">
                                        <div class="lazy-img"><img alt="" src="${video.videoPic}"></div>
                                        <span class="so-imgTag_rb">
                                         <fmt:formatDate value="${video.videoTime}" pattern="hh:mm：ss" />
                                    </span>
                                        <div class="watch-later-trigger watch-later"></div>
                                        <span class="mask-video"></span></div><!----></a>
                                    <div class="info">
                                        <div class="headline clearfix"><span class="type avid">${video.videoId}</span><span
                                                class="type hide">日常</span><a title="${video.videoTitle}"
                                                                              href="${video.videoUrl}"
                                                                              target="_blank" class="title">
                                                ${video.videoTitle}

                                        </a></div>
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
                        <div class="lazy-img"><img alt="" src=""></div>
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
</html>
