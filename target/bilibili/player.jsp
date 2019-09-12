<%--
  Created by IntelliJ IDEA.
  User: 10198
  Date: 2019/9/11
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://page.lanqiao.org/tag"  prefix="pager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>播放</title>

    <!--    顶部导航-->
    <style>
        /*全局*/
        a, abbr, acronym, address, applet, article, aside, audio, b, big, blockquote, body, canvas, caption, center, cite, code, dd, del, details, dfn, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, html, i, iframe, img, ins, kbd, label, legend, li, mark, menu, nav, object, ol, output, p, pre, q, ruby, s, samp, section, small, span, strike, strong, sub, summary, sup, table, tbody, td, tfoot, th, thead, time, tr, tt, u, ul, var, video {
            vertical-align: baseline;
        }
        a, abbr, acronym, address, applet, article, aside, audio, b, big, blockquote, body, canvas, caption, center, cite, code, dd, del, details, dfn, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, html, i, iframe, img, ins, kbd, label, legend, li, mark, menu, nav, object, ol, output, p, pre, q, ruby, s, samp, section, small, span, strike, strong, sub, summary, sup, table, tbody, td, tfoot, th, thead, time, tr, tt, u, ul, var, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            vertical-align: baseline;
            font-style: normal;
        }
        div {
            display: block;
        }
        body {
            font-family: -apple-system,BlinkMacSystemFont,Helvetica Neue,Helvetica,Arial,PingFang SC,Hiragino Sans GB,Microsoft YaHei,sans-serif;
            line-height: 1.5;
            color: #222;
        }

        * {
            margin: 0;
            padding: 0;
        }
        li {
            list-style: none;
            float: left
        }
        a{
            text-decoration: none;
        }
        ul {
            list-style: none;
            outline: none;
        }
        /*导航*/
        .header{
            height: 50px;
            font: 12px 'Helvetica Neue', Helvetica, Arial, 'Microsoft Yahei', 'Hiragino Sans GB', 'Heiti SC', 'WenQuanYi Micro Hei', sans-serif;

        }
        .nav-wrapper{
            height: 54px;

        }

        /*导航左边*/
        .nav-con.fl{
            width: 537px;
            height: 54px;
            float: left;
        }
        .nav-item{
            line-height: 50px;
            height: 50px;
            float: left;
            text-align: center;
            position: relative;
        }
        .logo{
            width: 80px;
            height: 42px;
            padding-top: 3px;
        }
        .home{
            width: 62.34px;
            height: 50px;
        }
        .mbili{
            width: 38px;
            height: 50px;
        }
        .game{
            width: 62px;
            height: 50px;
        }
        .live{
            width: 38px;
            height: 50px;
        }
        .buy{
            width: 50px;
            height: 50px;
        }
        .manga{
            width: 38px;
            height: 50px;
        }
        .loc-menu{
            width: 33.34px;
            height: 50px;
        }
        .mobile{
            width: 84px;
            height: 50px;
        }
        /*导航右边投稿*/
        .up-load.fr{
            width: 68px;
            height: 54px;
            float: right;
        }
        /*投稿*/
        .u-link{
            display: block;
            width: 100%;
            height: 54px;
            line-height: 48px;
            text-align: center;
            font-size: 14px;
            color: #fff;
            background-color: #f45a8d;
            border-radius: 0 0 6px 6px;
        }
        /*动态 历史*/
        .nav-con.fr{
            width: 122px;
            height: 54px;
            float: right;
        }
        .profile-info{
            width: 46px;
            margin-top: 10px;
        }
        .t{
            color: #222;
            height: 100%;
            display: block;
            padding: 0 7px;
        }

        /*搜索框*/
        .nav-search{
            width: 420px;
            height: 54px;
            float: right;
            padding-right: 60px;
        }
        .showSearch{
            width: 420px;
            height: 34px;
            margin-top: 8px;
            border-radius: 2px;
            background-color: #f4f4f4;
            border: 1px solid #e7e7e7;
        }
        .nav-search-keyword{
            height: 32px;
            line-height: 32px;
            width: 420px;
            opacity: 1;
            color: #999;
            font-size: 12px;
            overflow: hidden;
            border: none;
            box-shadow: none;
            background-color: transparent;
            transition: all 0.2s;

        }
        .nav-search-submit {
            top: 7px;
            color: #999;
            font-size: 18px;
            right: 7px;
            position: absolute;
            cursor: pointer;
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            transition: all 0.2s;
        }

        /*=================*/
        #video-page-app{
            width: 1519px;
            height: 1px;
            background-color: #999999;
        }

    </style>
    <!--    中间部分-->
    <style>
        .v-wrap{
            max-width: 1660px;
            min-width: 988px;
            margin: 20px auto;
            display: flex;
            justify-content: space-between;
        }
        /*    左边*/
        /*    视频信息*/
        #viewbox_report{
            width: 638px;
            height: 81px;
        }
        .video-title{
            font-size: 18px;
            font-weight: 500;
            color: #212121;
            line-height: 26px;
            height: 26px;
            margin-bottom: 12px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            background-color: white;
        }
        .tit{
            vertical-align: middle;
        }
        .video-data {
            margin-top: 11px;
            font-size: 12px;
            height: 16px;
            color: #999;
            display: flex;
            align-items: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            background-color: white;
        }
        .a-crumbs a {
            color: #999;
        }
        .a-crumbs {
            margin-right: 16px;
        }
        .video-data span {
            display: inline-block;
            height: 16px;
        }
        .v-wrap .video-info {
            margin-bottom: 16px;
        }
        #bofqi {
            z-index: 10;
        }
        /*播放器*/

        /*点赞、银币*/
        .video-toolbar {
            position: relative;
            margin-top: 16px;
            line-height: 30px;
            height: 28px;
            font-size: 14px;
            color: #505050;
            border-bottom: 1px solid #e5e9f0;
            padding-bottom: 12px;
        }
        .ops {
            float: left;
            height: 24px;
        }
        .ops span {
            width: 92px;
            margin-right: 8px;
            cursor: pointer;
            transition: all .3s;
            display: inline-block;
            white-space: nowrap;
            color: #505050;
            position: relative;
        }
        .appeal-text {
            float: right;
            cursor: pointer;
            font-size: 12px;
            margin-right: 16px;
            color: #505050;
            transition: color .3s;
        }

        /*视频来源*/
        .video-desc {
            margin-top: 16px;
            position: relative;
        }
        .info.open{
            height: auto;
        }
        .info {
            white-space: pre-line;
            transition: all .3s;
            font-size: 12px;
            color: #212121;
            letter-spacing: 0;
            line-height: 18px;
            width: 573px;
            overflow: hidden;
        }

        /*视频标签*/
        .s_tag {
            position: relative;
            clear: both;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e5e9ef;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: rgb(229, 233, 239);
            margin-top: 16px;
            height: 30px;
        }
        .s_tag .tag-area>li{
            position: relative;
            height: 22px;
            transition: all .3s;
        }
        .s_tag .tag-area>li {
            float: left;
            margin: 0 10px 8px 0;
            background: #f4f4f4;
            border-radius: 100px;
            padding: 0 12px;
            font-size: 12px;
            border: 1px solid #f4f4f4;
        }
        /*评论区*/
        #comment {
            margin-top: 20px;
            z-index: 0;
            position: relative;
        }
        .comment-m .b-head {
            font-size: 18px;
            line-height: 24px;
            color: #222;
            margin: 0 0 20px;
        }
        .comment-m .b-head .results {
            margin-right: 10px;
        }
        .bb-comment{
            font-family: Microsoft YaHei,Arial,Helvetica,sans-serif;
            font-size: 0;
            zoom: 1;
            min-height: 100px;
            background: #fff;
        }
        .bb-comment .reply-notice{
            margin-bottom: 10px;
        }
        .bb-comment *{
            box-sizing: content-box;
        }
        .bb-comment .comment-header{
            margin: 0 0 24px;
            border-bottom: 1px solid #e5e9ef;
        }
        .bb-comment .comment-header .tabs-order l{
            background-color: transparent;
            border-radius: 0;
            border: 0;
            padding: 8px 0;
            margin-right: 16px;
            border-bottom: 1px solid transparent;
            position: relative;
            float: left;
            cursor: pointer;
            line-height: 20px;
            height: 20px;
            font-size: 14px;
            font-weight: 700;
            color: #222;
        }
        .bb-comment li, .bb-comment ul{
            margin: 0;
            list-style: none;
        }
        .bb-comment *{
            box-sizing: content-box;
        }
        .bb-comment .comment-header .tabs-order li.on{
            border-bottom: 1px solid #00a1d6;
            color: #00a1d6;
        }
        .bb-comment .comment-header .tabs-order li:last-child {
            margin: 0 16px;
        }
        .bb-comment .no-login{
            position: relative;
        }
        .bb-comment .comment-send .user-face{
            float: left;
            margin: 7px 0 0 5px;
            position: relative;
        }
        .bb-comment img{
            border: none;
            vertical-align: middle;
        }
        .bb-comment .comment-send .user-face .user-head{
            width: 48px;
            height: 48px;
            border-radius: 50%;
        }
        .bb-comment img{
            border: none;
            vertical-align: middle;
        }
        .bb-comment .comment-send .textarea-container{
            position: relative;
            margin-left: 85px;
            margin-right: 80px;
        }
        .bb-comment .no-login .textarea-container .ipt-arrow{
            background-position: -395px -538px;
        }
        .bb-comment .no-login .textarea-container textarea{
            background-color: #e5e9ef;
        }
        .bb-comment .comment-send .textarea-container textarea{
            font-size: 12px;
            display: inline-block;
            box-sizing: border-box;
            background-color: #f4f5f7;
            border: 1px solid #e5e9ef;
            overflow: auto;
            border-radius: 4px;
            color: #555;
            width: 100%!important;
            height: 65px;
            transition: 0s;
            padding: 5px 10px;
            line-height: normal;
        }
        .bb-comment textarea{
            outline: none;
            resize: none;
        }
        .bb-comment .no-login .comment-submit{
            cursor: default;
            background-color: #e5e9ef!important;
            border-color: #e5e9ef!important;
            color: #b8c0cc!important;
        }
        .bb-comment .comment-send .comment-submit{
            width: 70px;
            height: 64px;
            position: absolute;
            right: -80px;
            top: 0;
            padding: 4px 15px;
            font-size: 14px;
            color: #fff;
            border-radius: 4px;
            text-align: center;
            min-width: 60px;
            vertical-align: top;
            cursor: pointer;
            background-color: #00a1d6;
            border: 1px solid #00a1d6;
            transition: .1s;
            user-select: none;
            outline: none;
        }
        .bb-comment button{
            box-sizing: border-box;
        }
        .bb-comment .no-login .comment-emoji{
            background-color: #e5e9ef;
        }
        .bb-comment .comment-send .comment-emoji{
            padding: 0;
            width: 66px;
            height: 24px;
            color: #99a2aa;
            border: 1px solid #e5e9ef;
            border-radius: 4px;
            position: relative;
            z-index: 101;
            font-size: 12px;
            text-align: center;
            line-height: 23px;
            margin-left: 86px;
            margin-top: 3px;
            cursor: pointer;
            display: inline-block;
        }
        .bb-comment .comment-send .comment-emoji .face{
            display: inline-block;
            vertical-align: middle;
            line-height: 1;
            width: 16px;
            height: 16px;
            margin-right: 5px;
            background: url(https://static.hdslb.com/phoenix/dist/images/icons-comment.png) no-repeat -408px -24px;
        }
        .bb-comment .comment-send .comment-emoji .text{
            display: inline-block;
            vertical-align: middle;
            line-height: 1;
            font-size: 12px!important;
        }
        .bb-comment .comment-list .list-item .user-face{
            float: left;
            margin: 24px 0 0 5px;
            position: relative;
        }
        .bb-comment .comment-list .list-item .user-face img{
            width: 48px;
            height: 48px;
            border-radius: 50%;
        }
        .bb-comment img{
            border: none;
            vertical-align: middle;
        }
        .bb-comment .comment-list .list-item .con{
            position: relative;
            margin-left: 85px;
            padding: 22px 0 14px;
            border-top: 1px solid #e5e9ef;
        }
        .list-item .user{
            font-size: 12px;
            font-weight: 700;
            line-height: 18px;
            padding-bottom: 4px;
            display: block;
            word-wrap: break-word;
        }
        .bb-comment .comment-list .list-item .user .name{
            color: #6d757a;
        }
        .list-item .text{
            line-height: 20px;
            padding: 2px 0;
            font-size: 14px;
            text-shadow: none;
            overflow: hidden;
            word-wrap: break-word;
            word-break: break-word;
        }
        .bb-comment p{
            margin: 0;
            padding: 0;
        }
        .bb-comment .comment-list .list-item .info{
            color: #99a2aa;
            line-height: 26px;
            font-size: 12px;
        }
        .bb-comment .comment-list .list-item .info span{
            margin-right: 20px;

        }
        .bb-comment .comment-list .list-item .info .time{
            float: left;
        }
        .bb-comment .comment-list .list-item .info .like{
            cursor: pointer;
            float: left;
        }
        .bb-comment .comment-list .list-item .info .like i{
            display: inline-block;
            width: 14px;
            height: 14px;
            vertical-align: text-top;
            margin-right: 5px;
            background: url(https://static.hdslb.com/phoenix/dist/images/icons-comment.png) no-repeat;
            background-position: -153px -25px;
        }
        .bb-comment .bottom-page{
            margin: 20px 0;
        }
    </style>
    <!--右边部分-->
    <style>

        .v-wrap .r-con {
            width: 320px;
            -ms-flex: none;
            flex: none;
            margin-left: 30px;
        }
        .v-wrap .up-info{
            margin-bottom: 16px;
        }
        .up-info .u-face{
            position: relative;
            left: -8px;
        }
        .up-info .u-face {
            float: left;
            width: 48px;
            height: 48px;
            position: relative;
        }
        .up-info .u-info {
            margin-left: 16px;
            float: left;
        }
        .up-info .u-info .name {
            font-size: 14px;
            color: #00a1d6;
        }
        .up-info .u-info .name .username {
            font-size: 14px;
            color: #212121;
            font-weight: 500;
            display: inline-block;
            max-width: 180px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: top;
        }
        #v_upinfo .u-info .desc {
            max-width: 360px;
        }
        .up-info .u-info .desc {
            margin-top: 4px;
            width: 256px;
            font-size: 12px;
            line-height: 16px;
            height: 16px;
            color: #999;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        /*关注按钮*/
        .up-info .btn-panel {
            clear: both;
            display: -ms-flexbox;
            display: flex;
            margin-left: 63px;
            white-space: nowrap;
        }
        .up-info .btn-panel .default-btn {
            box-sizing: border-box;
            padding: 0;
            line-height: 32px;
            height: 32px;
            border-radius: 2px;
            font-size: 14px;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: center;
            justify-content: center;
            cursor: pointer;
        }
        .up-info .btn-panel .not-follow i {
            width: 16px;
            height: 16px;
            font-size: 16px;
            margin-right: 8px;
        }

        /*    弹幕列表*/
        .v-wrap .danmaku-box {
            margin-bottom: 20px;
        }
        .v-wrap .danmaku-wrap {
            min-height: 46px;
            background: #f4f4f4;
        }
    </style>
    <!--视频播放按钮-->
    <style>
        .video_player {
            position: relative;
            margin: 0 auto;
            overflow: hidden;
            width: 638px;
            height: 443px;
        }

        .video_player video {
            width: 100%;
            height: 100%;
        }

        .video_player .menu {
            position: absolute;
            width: 100%;
            height: 50px;
            background-color: rgba(0, 0, 0, 0.5);
            bottom: 0;
            left: 0;
        }

        .video_player .menu .play {
            position: absolute;
            width: 50px;
            height: 30px;
            border: 1px solid white;
            border-radius: 10px;
            color: white;
            text-align: center;
            line-height: 30px;
            top: 50%;
            left: 30px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .video_player .menu .play:hover {
            background-color: rgb(219, 74, 74);
        }

        .vi-time {
            position: absolute;
            width: 100px;
            height: 30px;
            color: white;
            text-align: center;
            line-height: 30px;
            top: 50%;
            left: 100px;
            transform: translateY(-50%);
        }

        /* 进度条 */
        .progress_bar {
            position: absolute;
            top: -6px;
            left: 0;
            width: 100%;
            height: 6px;
            background-color: #ccc;
            transition: height .2s linear, top .2s linear;
        }

        .progress_bar>div {
            width: 0px;
            height: 100%;
            background-color: rgb(250, 139, 12);
        }

        .progress_bar>i {
            position: absolute;
            top: -2px;
            left: 0px;
            transform: translateX(-50%);
            width: 10px;
            height: 10px;
            background-color: red;
            border-radius: 20px;
            transition: height .2s linear, top .2s linear, width .2s linear;
        }

        /* 倍数 */
        li {
            list-style: none;
        }

        .speed {
            position: absolute;
            top: 50%;
            right: 150px;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            line-height: 30px;
        }

        .speed div {
            width: 50px;
            height: 30px;
            border: 1px solid white;
            border-radius: 10px;
            cursor: pointer;
        }

        .speed ul {
            position: absolute;
            top: -170px;
            left: -4px;
            padding-bottom: 25px;
            display: none;
        }

        .speed ul li {
            padding: 0 10px;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .speed ul li:nth-of-type(1) {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .speed ul li:nth-last-of-type(1) {
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .speed ul li:hover {
            background-color: rgb(219, 74, 74);
        }

        .speed div:hover {
            background-color: rgb(219, 74, 74);
        }

        /* 音量 */
        .volume {
            position: absolute;
            top: 50%;
            right: 80px;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            line-height: 30px;
        }

        .volume>span {
            display: block;
            width: 50px;
            height: 30px;
            border: 1px solid white;
            border-radius: 10px;
            cursor: pointer;
        }

        .volume>span:hover {
            background-color: rgb(219, 74, 74);
        }

        .volume .Controller {
            position: absolute;
            top: -170px;
            width: 50px;
            height: 150px;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
        }

        .volume .Controller div {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateY(-50%) translateX(-50%);
            width: 5px;
            height: 100px;
            background-color: #ccc;

        }

        .volume .Controller div::before {
            position: absolute;
            content: '';
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 5px;
            height: 100px;
            background-color: rgb(250, 139, 12);
        ;
        }

        .volume .Controller div::after {
            position: absolute;
            content: '';
            bottom: 100px;
            left: 50%;
            transform: translateX(-50%) translateY(4px);
            width: 8px;
            height: 8px;
            background-color: white;
            border-radius: 10px;
        }
        /* 全屏 */
        .full {
            position: absolute;
            width: 50px;
            height: 30px;
            border: 1px solid white;
            border-radius: 10px;
            color: white;
            text-align: center;
            line-height: 30px;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
<%--    <script>--%>

<%--        $(function () {--%>
<%--            $.ajax({--%>
<%--                url:"http://localhost:8888/video/videoInfo",--%>
<%--                data:{"userId":${video.uderId}},--%>
<%--                type:"post",--%>
<%--                datatype:"json",--%>
<%--                success:function (data) {--%>
<%--                    alert(data);--%>

<%--                }--%>


<%--            })--%>
<%--        })--%>

<%--    </script>--%>
</head>
<body>
<!--顶部导航-->
<div class="header">
    <div class="nav-wrapper">
        <div class="nav-con fl">
            <ul>
                <li class="logo"><img src="/images/video/logo.PNG" rel="logo" width="80px" height="42px"></li>
                <li class="nav-item home">主站</li>
                <li class="nav-item mbili">音频</li>
                <li class="nav-item game">游戏中心</li>
                <li class="nav-item live">直播</li>
                <li class="nav-item buy">会员购</li>
                <li class="nav-item manga">漫画</li>
                <li class="nav-item loc-menu">BW</li>
                <li class="nav-item loc-menu">70年</li>
                <li class="nav-item mobile">下载APP</li>
            </ul>
        </div>
        <div class="up-load fr">
            <a href="" class="u-link">投稿</a>
        </div>
        <div class="nav-con fr">
            <ul>
                <li class="nav-item profile-info">
                    <img src="/images/video/akari.jpg" width="32px" height="32px">
                </li>
                <li class="nav-item ">
                    <a href="" class="t">动态</a>
                </li>
                <li class="nav-item">
                    <a href="" class="t">历史</a>
                </li>
            </ul>
        </div>
        <div class="nav-search">
            <div class="nav-search showSearch" >
                <input type="text" class="nav-search-keyword">
                <button type="submit" class="header-icon-general_search nav-search-submit">
                </button>
            </div>
        </div>
    </div>
</div>
<div id="video-page-app"></div>
<!--中间部分-->
<div id="app">
    <div class="v-wrap" style="width: 988px;padding: 0px">
        <!--左边部分-->
        <div class="l-con" style="width: 638px">
            <!--视频信息-->
            <div id="viewbox_report" class="video-info" >
                <h1 title="视频名" class="video-title">
                    <span class="tit">${video.videoTitle}</span>
                </h1>
                <div class="video-data">
                    <span class="a-crumbs">
                        <a target="_blank" href="#">国创</a>
                        <i class="fuhao">></i>
                        <a target="_blank" href="#">国产动画</a>
                    </span>
                    <span><fmt:formatDate pattern="yyyy-MM-dd" value="${video.upTime}"></fmt:formatDate></span>

                </div>
                <div class="video-data">
                    <span title="总播放数" class="view">${video.playNum}评论&nbsp;&nbsp;</span>
                    <span title="弹幕数" class="dm">654弹幕</span>
                </div>
            </div>
            <!--视频播放器-->
            <div id="playerWrap" class="player-wrap" style="height: auto">
                <div id="bofqi" style="width: 638px;height: 493px;position: static">
                    <div class="video_player" >
                        <video src="${video.videoUrl}" width="638px" height="381px"></video>
                        <div class="menu">
                            <div class="play">播放</div>
                            <div class="vi-time"></div>
                            <div class="progress_bar">
                                <div></div>
                                <i></i>
                            </div>
                            <div class="speed">
                                <div>倍数</div>
                                <ul>
                                    <li>0.5x</li>
                                    <li>1.0x</li>
                                    <li>1.5x</li>
                                    <li>1.25x</li>
                                    <li>2.0x</li>
                                </ul>
                            </div>
                            <div class="volume">
                                <span>音量</span>
                                <div class="Controller">
                                    <div></div>
                                    <i></i>
                                </div>
                            </div>
                            <div class="full">全屏</div>
                        </div>
                    </div>
                </div>
            </div>
            <!--点赞、硬币-->
            <div id="arc_toolbar_report" class="video-toolbar">
                <div class="ops">
                    <span title="点赞数" class="like">${video.likeNum}</span>
                    <span title="硬币数" class="coin">${video.coinNum}</span>
                    <span title="收藏数" class="collect">${video.collectionNum}</span>
                    <span title="分享" class="share">955</span>
                </div>
                <div class="appeal-text">稿件投诉</div>
            </div>
            <!--视频来源-->
            <div id="v_desc" class="video-desc">
                <div class="info open">${video.videoDesc}</div>
            </div>
            <!--视频标签-->
            <div id="v_tag" class="s_tag">
                <ul class="tag-area ">
                    <li class="tag">${video.videoTitle}</li>
                    <li class="tag">片花</li>
                    <li class="tag">动漫化</li>
                    <li class="tag">视美</li>
                    <li class="tag">国漫崛起</li>
                </ul>
            </div>
            <!--评论区-->
            <div id="comment" class="comment-m">
                <div class="common">
                    <div class="b-head">
                        <span class="b-head results">1350</span>
                        <span class="b-head-t">评论</span>
                    </div>
                    <div class="comment" style="position: relative">
                        <div class="bb-comment">
                            <div class="reply-notice"></div>
                            <!--头-->
                            <div class="comment-header">
                                <div class="tabs-order">
                                    <ul class="clearfix">
                                        <li class="default-sort" data-sort="0" style="display: none;">全部评论</li>
                                        <li data-sort="2" class="hot-sort  on">按热度排序</li>
                                        <li data-sort="0" class="new-sort" style="display: list-item;">按时间排序</li>
                                    </ul>
                                </div>
                            </div>
                            <!--输入框-->
                            <div class="comment-send no-login">
                                <div class="user-face">
                                    <img class="user-head" src="//static.hdslb.com/images/member/noface.gif">
                                </div>
                                <div class="textarea-container">
                                    <div class="baffle-wrap">
                                        <div class="baffle">您的等级不足，升级至Lv2可参与评论
                                        </div>
                                    </div>
                                    <i class="ipt-arrow"></i>
                                    <textarea cols="80" name="msg" rows="5" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" class="ipt-txt">

                                    </textarea>
                                    <button type="submit" class="comment-submit" disabled="disabled">发表评论</button>
                                </div>
                                <div class="comment-emoji">
                                    <i class="face"></i>
                                    <span class="text">表情</span>
                                </div>
                            </div>
                            <!--评论信息-->
                            <div class="comment-list">
                                <div class="list-item reply-wrap ">
                                    <!--用户头像-->
                                    <div class="user-face">
                                        <img src="/images/video/akari.jpg">
                                    </div>
                                    <!--评论内容-->
                                    <div class="con">
                                        <!--用户名-->
                                        <div class="user">
                                            <span class="name">狸猫浣太子</span>
                                        </div>
                                        <!--内容-->
                                        <p class="text">我家坐车几分钟就是视美基地，当时我很小的时候就看着视美的动画过来。觉得视美真的是我的童年。<br>而现在我长大了许些，我又喜欢上了叶不羞，喜欢上了荣耀，喜欢上了全职。我觉得能看到视美做全职的动画真的很开心。我也期待视美把全职做好！做出我心中的那个。<br><br>最后说一句：这个渲染好好看(｀・ω・´)</p>
                                        <!--信息-->
                                        <div class="info">
                                            <span class="time">2016-07-29 18:44</span>
                                            <span class="like">
                                                <i></i>
                                                <span>322</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-item reply-wrap ">
                                    <!--用户头像-->
                                    <div class="user-face">
                                        <img src="/images/video/akari.jpg">
                                    </div>
                                    <!--评论内容-->
                                    <div class="con">
                                        <!--用户名-->
                                        <div class="user">
                                            <span class="name">狸猫浣太子</span>
                                        </div>
                                        <!--内容-->
                                        <p class="text">我家坐车几分钟就是视美基地，当时我很小的时候就看着视美的动画过来。觉得视美真的是我的童年。<br>而现在我长大了许些，我又喜欢上了叶不羞，喜欢上了荣耀，喜欢上了全职。我觉得能看到视美做全职的动画真的很开心。我也期待视美把全职做好！做出我心中的那个。<br><br>最后说一句：这个渲染好好看(｀・ω・´)</p>
                                        <!--信息-->
                                        <div class="info">
                                            <span class="time">2016-07-29 18:44</span>
                                            <span class="like">
                                                <i></i>
                                                <span>322</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-item reply-wrap ">
                                    <!--用户头像-->
                                    <div class="user-face">
                                        <img src="/images/video/akari.jpg">
                                    </div>
                                    <!--评论内容-->
                                    <div class="con">
                                        <!--用户名-->
                                        <div class="user">
                                            <span class="name">狸猫浣太子</span>
                                        </div>
                                        <!--内容-->
                                        <p class="text">我家坐车几分钟就是视美基地，当时我很小的时候就看着视美的动画过来。觉得视美真的是我的童年。<br>而现在我长大了许些，我又喜欢上了叶不羞，喜欢上了荣耀，喜欢上了全职。我觉得能看到视美做全职的动画真的很开心。我也期待视美把全职做好！做出我心中的那个。<br><br>最后说一句：这个渲染好好看(｀・ω・´)</p>
                                        <!--信息-->
                                        <div class="info">
                                            <span class="time">2016-07-29 18:44</span>
                                            <span class="like">
                                                <i></i>
                                                <span>322</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-item reply-wrap ">
                                    <!--用户头像-->
                                    <div class="user-face">
                                        <img src="/images/video/akari.jpg">
                                    </div>
                                    <!--评论内容-->
                                    <div class="con">
                                        <!--用户名-->
                                        <div class="user">
                                            <span class="name">狸猫浣太子</span>
                                        </div>
                                        <!--内容-->
                                        <p class="text">我家坐车几分钟就是视美基地，当时我很小的时候就看着视美的动画过来。觉得视美真的是我的童年。<br>而现在我长大了许些，我又喜欢上了叶不羞，喜欢上了荣耀，喜欢上了全职。我觉得能看到视美做全职的动画真的很开心。我也期待视美把全职做好！做出我心中的那个。<br><br>最后说一句：这个渲染好好看(｀・ω・´)</p>
                                        <!--信息-->
                                        <div class="info">
                                            <span class="time">2016-07-29 18:44</span>
                                            <span class="like">
                                                <i></i>
                                                <span>322</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--分页-->
                            <div class="bottom-page"></div>
                            <!--输入框-->
                            <div class="comment-send no-login">
                                <div class="user-face">
                                    <img class="user-head" src="/images/video/akari.jpg">
                                </div>
                                <div class="textarea-container">
                                    <div class="baffle-wrap">
                                        <div class="baffle">您的等级不足，升级至Lv2可参与评论
                                        </div>
                                    </div>
                                    <i class="ipt-arrow"></i>
                                    <textarea cols="80" name="msg" rows="5" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" class="ipt-txt">

                                    </textarea>
                                    <button type="submit" class="comment-submit" disabled="disabled">发表评论</button>
                                </div>
                                <div class="comment-emoji">
                                    <i class="face"></i>
                                    <span class="text">表情</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!--右边部分-->
        <div class="r-con">
            <div id="v_upinfo" class="up-info">
                <!--头像-->
                <div class="u-face">
                    <img src="/images/video/akari.jpg" width="48" height="48" class="up-face">
                </div>
                <!--信息-->
                <div class="u-info">
                    <!--名字-->
                    <div class="name" style="line-height:20px;height:20px;">
                        <a href="" target="_blank" class="username">千夏Simple</a>
                    </div>
                    <!--标签-->
                    <div title="标签" class="desc">
                        逢魔降临历还有86页
                    </div>

                </div>
                <!--关注按钮-->
                <div class="btn-panel">
                    <div class="default-btn follow-btn b-gz not-follow">
                        <span class="">
                            <i class="van-icon-general_addto_s"></i>关注
                            <span>1.2万</span>
                        </span>
                    </div>
                </div>
            </div>
            <!--弹幕列表-->
            <div id="danmukuBox" class="danmaku-box" style="height: auto">
                <div class="danmaku-wrap">
                    <div id="playerAuxiliary" class="player-auxiliary">

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>
<!--按钮-->
<script>

    var video = document.getElementsByTagName('video')[0];
    var play = document.getElementsByClassName('play')[0];
    var time = document.getElementsByClassName('vi-time')[0];
    var bar = document.getElementsByClassName('progress_bar')[0];
    var Current = bar.getElementsByTagName('div')[0];
    var Dot = bar.getElementsByTagName('i')[0];
    var speed = document.getElementsByClassName('speed')[0].getElementsByTagName('div')[0];
    var ul = document.getElementsByClassName('speed')[0].getElementsByTagName('ul')[0];
    var Controller = document.getElementsByClassName('Controller')[0];
    var volume = document.getElementsByClassName('volume')[0].getElementsByTagName('span')[0];
    var full = document.getElementsByClassName('full')[0];
    var video_player = document.getElementsByClassName('video_player')[0]
    var timer = null;
    var lock = true;
    play.onclick = function () {
        if (video.paused) {  //判断是否已经播放了，如果还没播放，返回true
            video.play();  //触发方法，播放视频
            play.innerHTML = "暂停";    //修改 文字。
        } else {
            video.pause(); //暂停播放。
            play.innerHTML = "播放";
        }
    }
    video.onloadedmetadata = function () {// 视频加载完成触发,然后我们把时间添加到time标签上去。
        time.innerHTML = parseInt(video.currentTime / 60) + ":" + parseInt(video.currentTime % 60) + "/" + parseInt(video.duration / 60) + ":" + parseInt(video.duration % 60);
    }

    setInterval(function () { //每隔 1秒，刷新一下时间。
        time.innerHTML = parseInt(video.currentTime / 60) + ":" + parseInt(video.currentTime % 60) + "/" + parseInt(video.duration / 60) + ":" + parseInt(video.duration % 60);
        Current.style.width = video.currentTime / video.duration * parseInt(window.getComputedStyle(video, null).width) + "px";
        Dot.style.left = video.currentTime / video.duration * parseInt(window.getComputedStyle(video, null).width) + "px";
    }, 1000)

    bar.onmouseover = function () {  //鼠标进入的时候，进度条变大
        this.style.top = '-10px';
        this.style.height = '10px';
        Dot.style.width = '18px';
        Dot.style.height = '18px';
        Dot.style.top = '-5px';
    }
    bar.onmouseout = function () {
        this.style.top = '-6px';
        this.style.height = '6px';
        Dot.style.width = '10px';
        Dot.style.height = '10px';
        Dot.style.top = '-2px';
    }

    bar.onmousedown = function (e) { // 鼠标点击的时候，跳转
        Current.style.width = e.layerX + 'px'; //e.layerX 是点击的时候的位置。
        Dot.style.left = e.layerX + 'px';
        video.currentTime = e.layerX / parseInt(window.getComputedStyle(video, null).width) * video.duration; //计算出点击的位置在总时间里面占多少。
        time.innerHTML = parseInt(video.currentTime / 60) + ":" + parseInt(video.currentTime % 60) + "/" + parseInt(video.duration / 60) + ":" + parseInt(video.duration % 60);
    }

    // 倍数
    speed.onclick = function () {
        ul.style.display = 'block';
        this.style.backgroundColor = 'rgb(219, 74, 74)';
    }

    speed.onmouseout = function () {
        ul.style.display = 'none';
        this.style.backgroundColor = '';
    }

    ul.onmouseover = function () {
        ul.style.display = 'block';
        speed.style.backgroundColor = 'rgb(219, 74, 74)';
    }
    ul.onmouseout = function () {
        ul.style.display = 'none';
        speed.style.backgroundColor = '';
    }

    var lis = ul.getElementsByTagName('li');
    for (var i = 0; i < lis.length; i++) {
        lis[i].onclick = function () {
            video.playbackRate = parseFloat(this.innerHTML); //调节倍数 0 到正无穷
            speed.innerHTML = this.innerHTML;
        }
    }

    // 音量
    volume.onclick = function () {
        Controller.style.display = 'block';
        this.style.backgroundColor = 'rgb(219, 74, 74)';
    }

    Controller.getElementsByTagName('div')[0].onmousedown = function (e) {
        this.onmousemove = function (e) {
            if (100 - e.offsetY > 100) {  // 这里为什么要减100 是因为，Y的顶点是0， 但是我们日常是用顶点是100，把数倒了而已。
                document.styleSheets[0].addRule('.volume .Controller div::before', 'height: 100px'); // 修改伪元素。 因为我用的是伪元素做音量条
                document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: 100px');
                video.volume = 1;       // 修改音量。 0-1 之间， 1是默认音量
            } else if (100 - e.offsetY < 0) {
                document.styleSheets[0].addRule('.volume .Controller div::before', 'height: 0px');
                document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: 0px');
                video.volume = 0;
            } else {
                document.styleSheets[0].addRule('.volume .Controller div::before', 'height: ' + (100 - e.offsetY) + 'px');
                document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: ' + (100 - e.offsetY) + 'px');
                video.volume = (100 - e.offsetY) * 0.01;
            }

        }
        this.onmouseout = function () {
            Controller.onmousemove = function (e) {
                if (150 - e.offsetY - 25 > 100) {
                    document.styleSheets[0].addRule('.volume .Controller div::before', 'height: 100px');
                    document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: 100px');
                    video.volume = 1;
                } else if (150 - e.offsetY - 25 < 0) {
                    document.styleSheets[0].addRule('.volume .Controller div::before', 'height: 0px');
                    document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: 0px');
                    video.volume = 0;
                } else {
                    document.styleSheets[0].addRule('.volume .Controller div::before', 'height: ' + (150 - e.offsetY - 25) + 'px');
                    document.styleSheets[0].addRule('.volume .Controller div::after', 'bottom: ' + (150 - e.offsetY - 25) + 'px');
                    video.volume = (150 - e.offsetY - 25) * 0.01;
                }
                Controller.getElementsByTagName('div')[0].onmouseover = function () {
                    Controller.onmousemove = false;
                    Controller.getElementsByTagName('div')[0].onmousemove = false;
                }

            }
        }
        document.body.onmouseup = function () {
            Controller.onmousemove = false;
            Controller.getElementsByTagName('div')[0].onmousemove = false;
            Controller.getElementsByTagName('div')[0].onmouseout = false;
            Controller.style.display = 'none';
            volume.style.backgroundColor = '';
        }
    }

    // 全屏
    full.onclick = function () {
        if (lock) {  //声明一个变量来当状态。
            lock = false;
            video_player.style.height = window.screen.height + 'px'; //获取屏幕的宽高
            video_player.style.width = window.screen.width + 'px';
            document.documentElement.requestFullscreen();   //全屏模式
            full.innerHTML = '退出';
        } else {
            lock = true;
            video_player.style.height = 500 + 'px';
            video_player.style.width = 1000 + 'px';
            document.exitFullscreen();   //退出全屏
            full.innerHTML = '全屏';
        }
    }
</script>