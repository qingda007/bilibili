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
    <style>
        form {
            margin: 0;
        }
        h3{
            text-align:center;
        }
        textarea {
            display: block;
        }
        form .ke-container {
            margin: 0 auto;
        }
    </style>

    <script src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/main/iconfont.css" />
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

            float: right;
            margin: 5px 60px 0 0;

        }
        .showSearch{
            width: 350px;
            height: 34px;
            border-radius: 2px;
            background-color: #f4f4f4;
            border: 1px solid #e7e7e7;
            right: 20px;
        }
        .nav-search-keyword, .nav-search-submit:focus{
            outline: none;
        }
        .nav-search-keyword{
            height: 32px;
            line-height: 32px;
            width: 92%;
            opacity: 1;
            color: #999;
            font-size: 14px;
            overflow: hidden;
            border: none;
            box-shadow: none;
            background-color: transparent;
            transition: all 0.2s;
            float: left;
            padding-left: 8px;
        }
        .nav-search-submit {
            float: left;
            top: 7px;
            color: #999;
            font-size: 18px;
            right: 7px;
            position: relative;
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
        .ops span:hover {
            color: #00A1D6!important;
        }
        .ops span i{
            font-size: 20px;
            vertical-align: top;
            margin-right: 6px;
            width: 20px;
            height: 20px;
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

        /*分页*/
        .be-page{
            margin-bottom: 50px;
            text-align: center;
            clear: both;
        }
        .be-page li{
            margin-top: 40px;
        }
        .be-page-disabled{
            display: none;
        }
        .be-page-next,.be-page-prev{
            padding: 0 14px;
            border: 1px solid #d7dde4;
            border-radius: 4px;
            background-color: #fff;
        }

        .be-page-item{
            display: inline-block;
            line-height: 38px;
            padding: 0 15px;
            margin-right: 4px;
            text-align: center;
            list-style: none;
            background-color: #fff;
            -ms-user-select: none;
            user-select: none;
            cursor: pointer;
            font-family: Arial;
            font-size: 14px;
            border: 1px solid #d7dde4;
            border-radius: 4px;
            transition: all .2s ease-in-out;
        }
        .be-page-active{
            background-color: #00a1d6;
            border-color: #00a1d6;
        }
        .be-page-item a{
            text-decoration: none;
            color: #657180;
        }
        .be-page-active:hover a,.be-page-active a{
            color: #fff;
        }

        .be-page-item:hover{
            border-color: #00a1d6;
        }
        .be-page-item-jump-next{
            display: inline-block;
            font-size: 14px;
            line-height: 38px;
            list-style: none;
            text-align: center;
            cursor: pointer;
            color: #666;
            font-family: Arial;
            transition: all .2s ease-in-out;
            margin-right: 4px;
            padding: 0 5px;
        }
        .be-page-next{
            padding: 0 14px;
            border: 1px solid #d7dde4;
            border-radius: 4px;
            background-color: #fff;
        }
        .be-page-next{
            display: inline-block;
            font-size: 14px;
            line-height: 38px;
            list-style: none;
            text-align: center;
            cursor: pointer;
            color: #666;
            font-family: Arial;
            transition: all .2s ease-in-out;
        }
        .be-page-total{
            display: inline-block;
            height: 32px;
            line-height: 32px;
            margin-left: 30px;
            color: #99a2aa;
        }
        .be-page-option{
            display: inline-block;
            height: 32px;
            line-height: 32px;
            color: #99a2aa;
        }
        .be-page-option input{
            border-radius: 4px;
            margin: 0 8px;
            width: 50px;
        }
        .be-page-item-jump-next, .be-page-next, .be-page-prev {
            display: inline-block;
            font-size: 14px;
            line-height: 38px;
            list-style: none;
            text-align: center;
            cursor: pointer;
            color: #666;
            font-family: Arial;
            transition: all .2s ease-in-out;
        }
        .be-page-item-jump-next{
            margin-right: 4px;
        }
        .be-page-item-jump-next{
            padding: 0 5px;
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
        .up-info .u-info .name .message{
            margin-left: 12px;
            font-size: 12px;
            color: #505050;
            display: inline-block;
            vertical-align: middle;
        }
        .up-info .u-info .name .message i{
            color: #999;
            font-size: 16px;
            margin-right: 4px;
            height: 16px;
            width: 16px;
            vertical-align: text-bottom;
        }
        .up-info .u-info .name .message:hover i {

            color: #00a1d6;
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
        .up-info .btn-panel .not-follow{
            background-color: #00a1d6;
            color: #FFFFFF;
            width: 156px;
        }
        .up-info .btn-panel .following {
            color: #999;
            border: 1px solid #e7e7e7;
            background: #e7e7e7;
            width: 123px;
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
        .bui-collapse-wrap {
            width: 100%;
        }
        .bui-collapse-wrap .bui-collapse-header {
            position: relative;
            height: 46px;
            width: 100%;
            background: #f4f4f4;
            color: #222;
            border-radius: 2px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            cursor: pointer;
        }
        .bui-collapse-wrap .bui-collapse-header .bui-collapse-arrow {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            vertical-align: middle;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            height: 14px;
            position: absolute;
            right: 14px;
            top: 0;
            bottom: 0;
            margin: auto;
            color: #505050;
        }
        .bui-collapse-wrap .bui-collapse-header .bui-collapse-arrow span {
            font-size: 12px;
        }
        .player-auxiliary-filter {
            width: 90px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            position: relative;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            z-index: 2;
            background: #f4f5f7;
            height: 46px;
            line-height: 46px;
            border: none;
            border-radius: 2px;
            padding: 0 10px 0 16px;
            zoom: 1;
        }
        .player-auxiliary-filter span{
            font-size: 16px;
            color: #222;
        }
        .player-auxiliary-wraplist {
            display: block;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            overflow: hidden;
        }
        .player-auxiliary-danmaku {
            overflow: hidden;
        }
        .player-auxiliary-danmaku .player-auxiliary-danmaku-function {
            background-color: #fff;
            position: relative;
            overflow: hidden;
            z-index: 1;
            zoom: 1;

        }
        .player-auxiliary-danmaku .player-auxiliary-danmaku-function [class*="player-auxiliary-danmaku-btn-"] {
            float: left;
            font-size: 12px;
            color: #6d757a;
            background: #fff;
            height: 32px;
            border: 0;
            padding: 0 6px;
            padding-right: 6px;
            padding-left: 6px;
            line-height: 32px;
            cursor: pointer;
            display: inline-block;
            *display: inline;
            *zoom: 1;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            position: relative;
        }
        .player-auxiliary-danmaku-btn-time {
            width: 60px;
            text-align: left;
            padding-left: 16px;
            padding-right: 0;
        }
        .player-auxiliary-danmaku .player-auxiliary-danmaku-function .player-auxiliary-danmaku-btn-time {
            width: 60px;
            text-align: left;
            padding-left: 16px;
            padding-right: 0;
            margin-right: 0px;
        }
        .player-auxiliary-danmaku-btn-danmaku {
            width: 170px;
            text-align: left;
        }
        .player-auxiliary-danmaku-btn-date{
            width: 78px;
            text-align: left;
        }
        .player-auxiliary-danmaku-contaner {
            height: 100%;
            overflow-y:scroll;
        }
        .player-auxiliary-bscrollbar {
            position: relative;
        }
        .bpui-selectable {
            position: relative;

        }
        .player-auxiliary-danmaku-list .danmaku-info-row {

            line-height: 24px;
            height: 24px;
            font-size: 12px;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            color: #6d757a;
            background-color: #FFFFFF;

        }
        .player-auxiliary-danmaku-list .danmaku-info-row span {

            vertical-align: top;
            padding: 0 6px;
            padding-left: 6px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            display: inline-block;
            *display: inline;
            *zoom: 1;

        }
        .player-auxiliary-danmaku-list .danmaku-info-row span.danmaku-info-time {

            width: 60px;
            position: relative;
            text-align: left;
            overflow: hidden;
            padding-left: 16px;

        }
        .player-auxiliary-danmaku-list .danmaku-info-row span.danmaku-info-danmaku {

            color: #222;
            width: 145px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }
        .player-auxiliary-danmaku-list .danmaku-info-row span.danmaku-info-date {

            width: 88px;
            white-space: nowrap;
            overflow: hidden;

        }
    </style>
    <!--视频播放按钮-->
    <style>
        .video_player {
            background-color: black;
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
<%--    /*弹幕格式*/--%>
    <style>
        /*视频下面的弹幕按钮所在框*/

        .video-bottom {
            width: 606px;
            height: 46px;
            position: relative;
            background-color: #FFFFFF;
            padding: 0px 12px 0px 20px;
        }

        .video-bottom-info {
            width: 400px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-flex: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            position: relative;
            height: 30px;
            line-height: 30px;
            background: #f4f4f4;
            color: #999;
            border-radius: 2px;
        }

        .video-bottom-danmu-root {
            height: 34px;
            width: 100px;
            float: right;
            right: 0px;
            top: 0px;
            position: absolute;
        }
        /*弹幕按钮*/

        .danmu-trigger {
            position: relative;
            width: 30px;
            height: 30px;
            line-height: 30px;
            margin-right: 11px;
            cursor: pointer;
        }
        .off .bui-body{
            background-color: #757575;
        }
        .off .bui-dot{
            color: #757575;
            left: 2px;
        }


        .bui-body {
            margin: 0;
            display: inline-block;
            position: relative;
            width: 100%;
            height: 20px;
            outline: none;
            border-radius: 10px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            background: #00A1D6;
            cursor: pointer;
            vertical-align: middle;
            pointer-events: none;
        }

        .bui-dot {
            position: absolute;
            top: 2px;
            left: 12px;
            border-radius: 100%;
            width: 16px;
            height: 16px;
            background-color: #fff;
            color: #00A1D6;
            fill: #757575;
            line-height: 16px;
            text-align: center;
            box-shadow: 0 3px 1px 0 rgba(0, 0, 0, .05), 0 2px 2px 0 rgba(0, 0, 0, .1), 0 3px 3px 0 rgba(0, 0, 0, .05);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bui-dot span {
            display: inline-block;
            width: 10px;
            height: 10px;
            font-size: 10px;
            line-height: 10px;
        }
        .dm {
            width: 638px;
            height: 377px;
            position: absolute;
            top: 20px;
        }
        .dm_show{
            position: relative;
        }
        .dm_show div{
            position: absolute;
            right: 0px;
            line-height: 50px;
            float: left;

        }
        /*发送弹幕文本框*/
        .s_btn{
            z-index: 13;
            height: 30px;
            width: 60px;
            min-width: 60px;
            line-height: 30px;
            text-align: center;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 0 2px 2px 0;
            background-color: #00a1d6;
            color: #fff;
        }
        .s_txt{
            color: #212121;
            -webkit-box-flex: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            border: 0;
            height: 30px;
            line-height: 30px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            z-index: 12;
            padding: 0 5px;
            background: none;
            font-size: 12px;
            min-width: 115px;
            width: 100%;
        }
        .s_box{
            width: 200px;
            border-radius: 2px 0 0 2px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            border: 1px solid #e7e7e7;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .slide-gg {
            position: relative;
            width: 320px;
            height: 186px;
            overflow: hidden;
            border-radius: 2px;
            background: #eee;
        }
        .slide-gg .item-box {
            z-index: 1;
        }
        .van-slide > div {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: inline-block;
            overflow: hidden;
            z-index: 0;
        }
        .slide-gg .item-box .item .link {
            display: inline-block;
            height: 100%;
            width: 100%;
        }
        .slide-gg .gg-pic {
            position: absolute;
            left: 3px;
            bottom: 3px;
        }
        .bili-dialog-m {
            background: rgba(0,0,0,.65);
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            z-index: 10102;
        }
        .bili-dialog-m .bili-dialog-bomb {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(-50%) translateY(-50%);
            -ms-transform: translateX(-50%) translateY(-50%);
            box-sizing: border-box;
            margin-bottom: 50px;
        }
        .coin-operated-m {
            width: 360px;
            background: #fff;
            border-radius: 4px;
            overflow: hidden;
        }
        .coin-operated-m .close {
            position: absolute;
            width: 20px;
            height: 20px;
            right: 16px;
            top: 16px;
            cursor: pointer;
            background-position: -470px -534px;
        }
        .bili-icon, .icon {
            display: inline-block;
            background-image: url("images/main/icons.png");
        }
        .coin-operated-m .coin-title {
            font-size: 16px;
            margin-top: 20px;
            color: #222;
            text-align: center;
        }
        .coin-operated-m .coin-title span {
            font-size: 30px;
            color: #00a1d6;
        }
        .coin-operated-m .mc {
            text-align: center;
        }
        .coin-operated-m .mc-box.on.left-con {
            background-size: 122px;
            /*background-image: url("images/video/22.gif");*/
        }
        .coin-operated-m .mc-box.on {
            border-style: solid;
            border-color: #02a0d8;
        }
        .coin-operated-m .mc-box.on .c-num {
            color: #00a1d6;
        }
        .coin-operated-m .mc-box .c-num {
            color: #99a2aa;
            text-align: left;
            font-size: 14px;
            line-height: 40px;
            position: absolute;
            left: 15px;
        }
        .coin-operated-m .mc-box.left-con {
            margin-left:30%;
            background-image: url(//s1.hdslb.com/bfs/static/jinkela/video/asserts/22-gray.png);
        }
        .coin-operated-m .mc-box {
            position: relative;
            display: inline-block;
            margin-right: 30px;
            margin-top: 35px;
            width: 160px;
            height: 230px;
            border: 2px dashed #ccd0d6;
            border-top-color: rgb(204, 208, 214);
            border-top-style: dashed;
            border-right-color: rgb(204, 208, 214);
            border-right-style: dashed;
            border-bottom-color: rgb(204, 208, 214);
            border-bottom-style: dashed;
            border-left-color: rgb(204, 208, 214);
            border-left-style: dashed;
            border-radius: 5px;
            background-repeat: no-repeat;
            background-position: 50%;
        }
        .coin-operated-m .coin-bottom {
            text-align: center;
            padding: 25px 0;
        }
        .bi-btn {
            display: inline-block;
            background: #00a1d6;
            color: #fff;
            font-size: 14px;
            padding: 4px 18px;
            border-radius: 4px;
            transition: all .3s;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid #00a1d6;
            text-align: center;
            cursor: pointer;
        }
    </style>
<%--弹幕列展开--%>
    <script>

        $(function () {
            var flag0=1;
            $(".bui-collapse-header").click(function () {
                $(".bui-collapse-body").toggle();
                if(flag0==1){
                    $("#danmu-btn").text('展开');
                    flag0=0;
                }else{
                    $("#danmu-btn").text('收起');
                    flag0=1;
                }
            });
            var flag1=0;
            $(".ops span").click(function () {
                if(!flag1){
                    $(this).css("color","#00A1D6");
                    flag1=1;
                }else{
                    $(this).css("color","#505050");
                    flag1=0;
                }
            })
        })
    </script>
<%--总的方法--%>
    <script>

        $(function () {

            //视频信息
            $.ajax({
                url: "/video/videoInfo",
                data: {
                    "videoId": 1,
                },
                type: "post",
                datatype: "json",
                success: function (data) {
                    $("#viewbox_report").prepend(" <h1 title=\"视频名\" class=\"video-title\">\n" +
                        "                    <span class=\"tit\">" + data.videoTitle + "</span>\n" +
                        "                </h1>");
                    $(".a-crumbs").after("<span>" + data.upTime + "</span>");
                    $("#videodata").prepend("<span title=\"总播放数\" class=\"view\">" + data.playNum + "播放&nbsp;&nbsp;</span>\n");
                    // $(".video_player").prepend("<video src=\""+data.videoUrl+"\" width=\"638px\" height=\"381px\"></video>")
                    $(".videos").prepend("<source src=\"" + data.videoUrl + "\" type=\"video/mp4\">")
                    // $(".ops").prepend("<span title=\"点赞数\" class=\"like\">\n" +
                    //     "                        <i class=\"iconfont icon-dianzan-copy\"></i>"+data.likeNum+"\n" +
                    //     "                    </span>\n" +
                    //     "                    <span title=\"硬币数\" class=\"coin\">\n" +
                    //     "                        <i class=\"iconfont icon-toubi\"></i>"+data.coinNum+"\n" +
                    //     "                    </span>\n" +
                    //     "                    <span title=\"收藏数\" class=\"collect\"><i class=\"iconfont icon-shoucang\"></i>"+data.collectionNum+"</span>\n" +
                    //     "                    <span title=\"分享\" class=\"share\"><i class=\"iconfont icon-zhuanfa\"></i>955</span>");

                    $("#v_desc").prepend("<div class=\"info open\">" + data.videoDesc + "</div>");
                    $(".tag-area").prepend("<li class=\"tag\">" + data.videoTitle + "</li>");
                    vm.likes.likeNum = data.likeNum;
                    vm.likes.coinNum = data.coinNum;
                }
            });

            function showDanmu() {
                //弹幕信息
                $.ajax({
                    url: "/video/danmuInfo",
                    data: {
                        "videoId": 1
                    },
                    type: "post",
                    datatype: "json",
                    success: function (data2) {
                        for (var j = 0; j < data2.length; j++) {
                            $("#danmusss").prepend("<li class=\"danmaku-info-row\">\n" +
                                "                                                         <span class=\"danmaku-info-time\">" + data2[j].userInfo.userName + "</span>" +
                                "                                                        <span class=\"danmaku-info-danmaku\">" + data2[j].danmu + "</span>\n" +
                                "                                                        <span class=\"danmaku-info-date\">" + data2[j].sentTime + "</span>\n" +
                                "                                                    </li>")
                        }
                    }
                });
            }
            function showComment(){
                $.ajax({
                    url:"/video/commentInfo",
                    data:{
                        "videoId":1
                    },
                    type: "post",
                    datatype: "json",
                    success:function (data1) {
                        for (var i=0;i<data1.length;i++){
                            $(".comment-list").prepend(" <div class=\"list-item reply-wrap \">\n" +
                                "                                        <div class=\"user-face\">\n" +
                                "                                            <img src=\""+data1[i].userInfo.userPicadress+"\">\n" +
                                "                                        </div>\n" +
                                "                                        <div class=\"con\">\n" +
                                "                                            <div class=\"user\">\n" +
                                "                                                <span class=\"name\">"+data1[i].userInfo.userName+"</span>\n" +
                                "                                            </div>\n" +
                                "                                            <p class=\"text\">"+data1[i].comment+"</p>\n" +
                                "                                            <div class=\"info\">\n" +
                                "                                                <span class=\"time\">"+data1[i].sendTime+"</span>\n" +
                                "                                            </div>\n" +
                                "                                        </div>\n" +
                                "                                    </div>")
                        }
                    }

                });
            }

            // 评论和评论人信息
            $.ajax({
                url:"/video/commentInfo",
                data:{
                    "videoId":1
                },
                type: "post",
                datatype: "json",
                success:function (data1) {
                    for (var i=0;i<data1.length;i++){
                        $(".comment-list").prepend(" <div class=\"list-item reply-wrap \">\n" +
                            "                                        <div class=\"user-face\">\n" +
                            "                                            <img src=\""+data1[i].userInfo.userPicadress+"\">\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"con\">\n" +
                            "                                            <div class=\"user\">\n" +
                            "                                                <span class=\"name\">"+data1[i].userInfo.userName+"</span>\n" +
                            "                                            </div>\n" +
                            "                                            <p class=\"text\">"+data1[i].comment+"</p>\n" +
                            "                                            <div class=\"info\">\n" +
                            "                                                <span class=\"time\">"+data1[i].sendTime+"</span>\n" +
                            "                                            </div>\n" +
                            "                                        </div>\n" +
                            "                                    </div>")
                    }
                }

            });

            //弹幕信息
            $.ajax({
                url: "/video/danmuInfo",
                data: {
                    "videoId": 1
                },
                type: "post",
                datatype: "json",
                success: function (data2) {
                    for (var j = 0; j < data2.length; j++) {
                        $("#danmusss").prepend("<li class=\"danmaku-info-row\">\n" +
                            "                                                         <span class=\"danmaku-info-time\">" + data2[j].userInfo.userName + "</span>" +
                            "                                                        <span class=\"danmaku-info-danmaku\">" + data2[j].danmu + "</span>\n" +
                            "                                                        <span class=\"danmaku-info-date\">" + data2[j].sentTime + "</span>\n" +
                            "                                                    </li>");
                        $("#danmushow").append("<div>" + data2[j].danmu + "<div>")
                    }
                }
            });

            //up主信息
            $.ajax({
                url: "/video/upInfo",
                data: {
                    "videoId": 1
                },
                type: "post",
                datatype: "json",
                success: function (data3) {
                    $("#upface").prepend("<img src=\"" + data3.userInfo.userPicadress + "\" width=\"48\" height=\"48\" class=\"up-face\">");
                    $("#upname").prepend("<a href=\"\" target=\"_blank\" class=\"username\">" + data3.userInfo.userName + "</a>")
                    vm.likes.userId = data3.userId;
                },
                error: function () {
                    alert("up主信息失败")
                }
            });

            //评论数
            $.ajax({
                url: "/video/commentCount",
                data: {
                    "videoId": 1
                },
                type: "post",
                datatype: "json",
                success: function (data4) {
                    $("#commentNum").text(data4);
                }
            });

            //弹幕数
            $.ajax({
                url: "/video/danmuCount",
                data: {
                    "videoId": 1
                },
                type: "post",
                datatype: "json",
                success: function (data5) {
                    $("#videodata").append("<span title=\"弹幕数\" class=\"view-dm\">" + data5 + "弹幕</span>");
                    $("#danmutime").after("<div class=\"player-auxiliary-danmaku-btn-danmaku\">\n" +
                        "                                                弹幕内容\n" +
                        "                                            </div>")
                    // $("#danmutime").after("<div class=\"player-auxiliary-danmaku-btn-danmaku\">\n" +
                    //     "                                                弹幕内容（<span>"+data5+"</span>）\n" +
                    //     "                                            </div>")
                }
            });

            //收藏数
            $.ajax({
                url: "/gerCollectionCount",
                data: {
                    "videoId": 1
                },
                type: "post",
                datatype: "json",
                success: function (data) {
                    vm.likes.collectionNum = data;
                }
            });

            //获取登录用户信息
            $.ajax({
                url: "http://localhost:8888/getUserInfo",
                type: "post",
                data: {"id": 2},
                datatype: "json",
                success: function (data) {
                    console.log(data);
                    $("#userface").prepend("<img src=\"" + data.userPicadress + "\" width=\"32px\" height=\"32px\">");
                    $("#firstface").prepend("<img class=\"user-head\" src=\"" + data.userPicadress + "\">");
                    $("#secondface").prepend("<img class=\"user-head\" src=\"" + data.userPicadress + "\">")
                    vm.likes.userCoinNum = data.userCoin;
                }
            });

            //发表评论
            $(".comment-submit").click(function () {

                //插入评论
                var tit = $(".ipt-txt").val();
                var time = new Date();
                $.ajax({
                    url: "/video/insertComment",
                    type: "post",
                    async: false,
                    data: {
                        "userId": 2,
                        "videoId": 1,
                        "comment": tit,
                        "sendTime": time
                    },
                    datatype: "json",
                    success: function (data) {

                        showComment();
                        $.ajax({
                            url: "/video/commentCount",
                            data: {
                                "videoId": 1
                            },
                            async: false,
                            type: "post",
                            datatype: "json",
                            success: function (data4) {
                                $("#commentNum").text(data4);
                            }
                        });
                    },
                    error: function () {
                        alert("失败")
                    }
                })


            });

            //发送弹幕
            $("#s_btn").click(function () {
                var tit = $(".s_txt").val();
                var time = new Date();
                $.ajax({
                    url: "/video/insertDanmu",
                    type: "post",
                    data: {
                        "userId": 2,
                        "videoId": 1,
                        "danmu": tit,
                        "sentTime": time
                    },
                    datatype: "json",
                    success: function (data) {
                        showDanmu();
                    },
                    error: function () {
                        alert("失败")
                    }
                })
            })

            //获取是否收藏
            var collectd = false;
            $.ajax({
                url: "/getCollectionCount",
                type: "post",
                data: {
                    "videoId": 1,
                    "userId": 2
                },
                datatype: "text",
                success: function (data) {
                    if (data == 1) {
                        collectd = true;
                    } else if (data == 0) {
                        collectd = false;
                    }
                },
                error: function () {
                    alert("是否收藏失败")
                }
            });
            $(".collect").click(function () {
                if (collectd == true) {
                    quxiaoconllect();
                } else if (collectd == false) {
                    shoucang();
                }
            });

            //点击收藏
            function shoucang() {
                vm.likes.collectionNum += 1;
                $.ajax({
                    url: "/insertCollection",
                    type: "post",
                    data: {
                        "videoId": 1,
                        "userId": 2
                    },
                    datatype: "json",
                    success: function (data) {
                        collectd = true;
                    },
                    error: function () {
                        alert("收藏失败");
                    }

                })

            };

            //点击取消收藏
            function quxiaoconllect() {

                vm.likes.collectionNum -= 1;
                $.ajax({
                    url: "/deleteCollection",
                    type: "post",
                    data: {
                        "videoId": 1,
                        "userId": 2
                    },
                    datatype: "json",
                    success: function (data) {
                        collectd = false;
                    },
                    error: function () {
                        alert("取消收藏失败");
                    }

                })

            };

            //获取是否已关注
            var userIds = vm.likes.userId;
            var flag = false;
            $.ajax({
                url: "/selectFans",
                type: "post",
                data: {
                    "userId": userIds,
                    "fansId": 2
                },
                datatype: "text",
                success: function (data) {
                    if (data == 1) {
                        flag = true;
                        $("#guanzhu").hide();
                        $("#quguan").show();
                        quxiaota();
                        guanzhuta();
                    } else if (data == 0) {
                        flag = false;
                        $("#guanzhu").show();
                        $("#quguan").hide();
                        guanzhuta();
                        quxiaota();
                    }
                },
                error: function (data) {
                    alert("粉丝失败")

                }
            });

            //点击关注
            function guanzhuta() {
                $("#guanzhu").click(function () {
                    $("#guanzhu").hide();
                    $("#quguan").show();
                    //关注
                    $.ajax({
                        url: "/insertFans",
                        type: "post",
                        data: {
                            "userId": userIds,
                            "fansId": 2
                        },
                        datatype: "json",
                        success: function (data) {
                            flag = true;

                        },
                        error: function () {
                            alert("关注失败")
                        }

                    });
                })
            }

            //点击取关
            function quxiaota() {
                $("#quguan").click(function () {
                    $("#guanzhu").show();
                    $("#quguan").hide();
                    //关注
                    $.ajax({
                        url: "/deleteFans",
                        type: "post",
                        data: {
                            "userId": userIds,
                            "fansId": 2
                        },
                        datatype: "json",
                        success: function (data) {
                            flag = false;
                        },
                        error: function () {
                            alert("取消失败")
                        }

                    });
                })
            }

            //投币
            $(".bi-btn").click(function () {
                coinAdd();
                coinSub();
            });

            //videoCoin加一
            function coinAdd() {
                vm.likes.coinNum+=1;
                $.ajax({
                    url: "/video/coin",
                    type: "post",
                    data: {
                        "coinNum": vm.likes.coinNum,
                        "videoId": 1
                    },
                    datatype: "json",
                    success: function (data) {
                    },
                    error: function () {
                        alert("投币失败")
                    }
                })
            }
            //userCoin减一
            function coinSub() {
                vm.likes.userCoinNum-=1;
                $.ajax({
                    url: "/userCoin",
                    type: "post",
                    data: {
                        "userCoin": vm.likes.userCoinNum,
                        "userId": 2
                    },
                    datatype: "json",
                    success: function (data) {
                    },
                    error: function () {
                        alert("减币失败")
                    }
                })
            }
            //点赞
            var likeStatus = false;
            $(".like").click(function () {
                if (likeStatus == false) {
                    addlike();
                }
                else if (likeStatus == true) {
                    sublike();
                }
            });
            //点击加赞
            function addlike() {
                vm.likes.likeNum += 1;
                $.ajax({
                    url: "/video/like",
                    type: "post",
                    data: {
                        "likeNum": vm.likes.likeNum,
                        "videoId": 1
                    },
                    datatype: "json",
                    success: function (data) {
                        likeStatus = true;
                    },
                    error: function () {
                        alert("点赞失败")
                    }
                })
            }
            function sublike() {

                vm.likes.likeNum -= 1;
                $.ajax({
                    url: "/video/like",
                    type: "post",
                    data: {
                        "likeNum": vm.likes.likeNum,
                        "videoId": 1
                    },
                    datatype: "json",
                    success: function (data) {
                        likeStatus = false;
                    },
                    error: function () {
                        alert("取消点赞失败")
                    }
                });
            }

            //视频标签
            $.ajax({
                url: "/video/videoStatus",
                type: "post",
                data: {
                    "videoId": 1
                },
                datatype: "json",
                success: function (data) {

                    $("#video_status").prepend("<span class=\"a-crumbs\">\n" +
                        "                        <a target=\"_blank\" href=\"#\">"+data.status.statusAlias1+"</a>\n" +
                        "                        <i class=\"fuhao\">></i>\n" +
                        "                        <a target=\"_blank\" href=\"#\">"+data.status.statusAlias2+"</a>\n" +
                        "                    </span>")
                }
            })

        });


    </script>
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
                <li class="nav-item mobile">
                    <i class="iconfont icon-contextphone" style="color: deepskyblue"></i>
                    下载APP
                </li>
            </ul>
        </div>
        <div class="up-load fr">
            <a href="" class="u-link">投稿</a>
        </div>
        <div class="nav-con fr">
            <ul>
                <li class="nav-item profile-info" id="userface">
<%--                    <img src="/images/video/akari.jpg" width="32px" height="32px">--%>
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
                <button type="submit" class="header-icon-general_search nav-search-submit iconfont icon-sousuo">
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
<%--                <h1 title="视频名" class="video-title">--%>
<%--                    <span class="tit">${video.videoTitle}</span>--%>
<%--                </h1>--%>
                <div class="video-data" id="video_status">
<%--                    <span class="a-crumbs">--%>
<%--                        <a target="_blank" href="#">国创</a>--%>
<%--                        <i class="fuhao">></i>--%>
<%--                        <a target="_blank" href="#">国产动画</a>--%>
<%--                    </span>--%>
<%--                    <span><fmt:formatDate pattern="yyyy-MM-dd" value="${video.upTime}"></fmt:formatDate></span>--%>

                </div>
                <div class="video-data" id="videodata">
<%--                    <span title="总播放数" class="view">${video.playNum}评论&nbsp;&nbsp;</span>--%>
<%--                    <span title="弹幕数" class="view-dm">654弹幕</span>--%>
                </div>
            </div>
            <!--视频播放器-->
            <div id="playerWrap" class="player-wrap" style="height: auto">
                <div id="bofqi" style="width: 638px;height: 453px;position: static">
                    <div class="video_player" >
                        <video controls class="videos" width="638px" height="381px">
<%--                            <source src="hangge.mp4" type="video/mp4">--%>
                        </video>
<%--                        <video src="${video.videoUrl}" width="638px" height="381px"></video>--%>
                        <!--                弹幕窗口-->
                        <div class="dm" style="display: none">
                            <div class="dm_show" id="danmushow">
                                <div>这是一条弹幕</div>
                                <div>这也是</div>
                                <div>这还是</div>
                                <div>这是最后一条</div>
                                <div>这真的是最后一条</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--       按钮和弹幕发送     -->
            <div class="video-bottom">
                <div class="video-bottom-info">
                    <div class="s_box">
                        <input type="text" placeholder="发个弹幕见证当下" class="s_txt" width="188px" height="32px">
                    </div>

                    <div  id="s_btn" class="s_btn" >发送</div>
                </div>
                <div class="video-bottom-danmu-root">
                    <div class="danmu-trigger off">
                        <span class="bui-body">
                            <span class="bui-dot">
										<span >弹</span>
								</span>
                        </span>
                    </div>
                </div>
            </div>
            <!--点赞、硬币-->
            <div id="arc_toolbar_report" class="video-toolbar">
                <div class="ops">
                    <span title="点赞数" class="like">
                        <i class="iconfont icon-dianzan-copy"></i>{{likes.likeNum}}
                    </span>
                    <span title="硬币数" class="coin">
                        <i class="iconfont icon-toubi"></i>{{likes.coinNum}}
                    </span>
                    <span title="收藏数" class="collect"><i class="iconfont icon-shoucang"></i>{{likes.collectionNum}}</span>
                    <span title="分享" class="share"><i class="iconfont icon-zhuanfa"></i>955</span>
                </div>
                <div class="appeal-text">稿件投诉</div>
            </div>
            <!--视频来源-->
            <div id="v_desc" class="video-desc">
<%--                <div class="info open">${video.videoDesc}</div>--%>
            </div>
            <!--视频标签-->
            <div id="v_tag" class="s_tag">
                <ul class="tag-area ">
<%--                    <li class="tag">${video.videoTitle}</li>--%>
                    <li class="tag">片花</li>
                    <li class="tag">动漫化</li>
                    <li class="tag">视美</li>
                    <li class="tag">国漫崛起</li>
                </ul>
            </div>
            <!--评论区-->
            <div id="comment" class="comment-m">
                <div class="common">
<%--                    评论数--%>
                    <div class="b-head" id="commentcount">
                        <span class="b-head results" id="commentNum">1350</span>
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
                                <div class="user-face" id="firstface">
                                    <%--   <img class="user-head" src="/images/video/akari.jpg">--%>
                                </div>
                                <div class="textarea-container">
                                    <div class="baffle-wrap">
                                        <div class="baffle">您的等级不足，升级至Lv2可参与评论
                                        </div>
                                    </div>
                                    <i class="ipt-arrow"></i>
                                    <textarea cols="80" name="msg" rows="5" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" class="ipt-txt">

                                    </textarea>
                                    <button type="submit" class="comment-submit" >发表评论</button>
                                </div>

                            </div>
                            <!--评论信息-->
                            <div class="comment-list">
<%--                                    <div class="list-item reply-wrap ">--%>
<%--                                        <!--用户头像-->--%>
<%--                                        <div class="user-face">--%>
<%--                                            <img src="${comment.userPicadress}">--%>
<%--                                        </div>--%>
<%--                                        <!--评论内容-->--%>
<%--                                        <div class="con">--%>
<%--                                            <!--用户名-->--%>
<%--                                            <div class="user">--%>
<%--                                                <span class="name">${comment.userName}</span>--%>
<%--                                            </div>--%>
<%--                                            <!--内容-->--%>
<%--                                            <p class="text">${comment.comment}</p>--%>
<%--                                            <!--信息-->--%>
<%--                                            <div class="info">--%>
<%--                                                <span class="time"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.sendTime}"></fmt:formatDate></span>--%>
<%--                                                <span class="like">--%>
<%--                                                <i></i>--%>
<%--                                                <span>322</span>--%>
<%--                                            </span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                            </div>

<%--                            <!--分页-->--%>
<%--                            <div class="bottom-page">--%>
<%--                                <ul class="be-page">--%>
<%--                                    <li class="be-page-item be-page-prev be-page-disabled" id="last"><a>上一页</a></li>--%>
<%--                                    <li class="be-page-item be-page-active"><a>1</a></li>--%>
<%--                                    <li class="be-page-item"><a>2</a></li>--%>
<%--                                    <li class="be-page-item"><a>3</a></li>--%>
<%--                                    <li class="be-page-item-jump-next"></li>--%>
<%--                                    <li class="be-page-item"><a>7</a></li>--%>
<%--                                    <li class="be-page-item be-page-next" id="next"><a>下一页</a></li>--%>
<%--                                    <span class="be-page-total">共7页</span>--%>
<%--                                    <span class="be-page-option">跳至<input type="text"id="page-size">页</span>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                            <!--输入框-->
                            <div class="comment-send no-login">
                                <div class="user-face" id="secondface">
<%--                                    <img class="user-head" src="/images/video/akari.jpg">--%>
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
                <div class="u-face" id="upface"></div>
                <!--信息-->
                <div class="u-info">
                    <!--名字-->
                    <div class="name" style="line-height:20px;height:20px;" id="upname">
<%--                        <a href="" target="_blank" class="username">千夏Simple</a>--%>
                        <a class="message">
                            <i class="iconfont icon-xinfeng"></i>发消息
                        </a>
                    </div>
                    <!--标签-->
                    <div title="标签" class="desc">
                        逢魔降临历还有86页
                    </div>

                </div>
                <!--关注按钮-->
                <div class="btn-panel">
                    <div class="default-btn follow-btn b-gz not-follow" id="guanzhu">
                        <span class="guanzhu" style="display: block">
                            <i class="van-icon-general_addto_s"></i>+关注
                            <span>1.2万</span>
                        </span>
                    </div>
                    <div class="default-btn follow-btn b-gz following" style="display: none" id="quguan">
                        <span class="quxiao">
                            <i class="van-icon-general_addto_s"></i>已关注
                        </span>
                    </div>
                </div>
            </div>
            <!--弹幕列表-->
            <div id="danmukuBox" class="danmaku-box" style="height: auto">
                <div class="danmaku-wrap">
                    <div id="playerAuxiliary" class="player-auxiliary">
                        <div class="bui-collapse-wrap">
                            <div class="bui-collapse-header">
                                <div class="bui-collapse-arrow">
                                    <span id="danmu-btn">收起</span>
                                </div>
                                <div class="player-auxiliary-filter">
                                    <span>弹幕列表</span>
                                </div>
                            </div>
                            <div class="bui-collapse-body">
                                <div class="player-auxiliary-wraplist">
                                    <div class="player-auxiliary-filter-wrap player-auxiliary-danmaku"style="height: 398px;">
                                        <div class="clearfix"></div>
                                        <div class="player-auxiliary-danmaku-function">
                                            <div class="player-auxiliary-danmaku-btn-time" id="danmutime">用户</div>
<%--                                            <div class="player-auxiliary-danmaku-btn-danmaku">--%>
<%--                                                弹幕内容（<span>1000</span>）--%>
<%--                                            </div>--%>
                                            <div class="player-auxiliary-danmaku-btn-date">发送时间</div>
                                        </div>
                                        <div class="player-auxiliary-danmaku-contaner player-auxiliary-bscrollbar">
                                            <ul class="player-auxiliary-danmaku-list bpui-component bpui-undefined bpui-selectable" id="danmusss">
<%--                                                    <li class="danmaku-info-row" id="dammu-lists">--%>
<%--&lt;%&ndash;                                                        <span class="danmaku-info-danmaku">${danmu.danmu}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <span class="danmaku-info-date">${danmu.sentTime}</span>&ndash;%&gt;--%>
<%--                                                    </li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--广告-->
            <div id="slide_ad">
                <div class="slide-gg">
                    <div class="van-slide item-box" style="width: 320px;height: 186px;">
                        <div class="item">
                            <a>
                                <img src="images/video/guanggao.jpg"style="height: 100%;width: 100%;">
                            </a>
                            <img class="gg-pic" src="images/video/cm_2.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bili-dialog-m">
            <div class="bili-dialog-bomb">
                <div class="coin-operated-m">
                    <i id="close" class="icon close"></i>
                    <div class="coin-title">
                        为up主投上
                        <span>1</span>
                        枚硬币
                    </div>

                    <div class="mc clearfix"></div>
                    <div class="mc-box left-con on">
                        <span class="c-num">1硬币</span>
                    </div>
                    <div class="coin-bottom">
                        <span class="bi-btn">确定</span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script src="js/vue.min.js"></script>
<%--//vue--%>
<script>
    var vm = new Vue({
        el:"div.ops",
        data:{
            likes:{
                likeNum:1,
                coinNum:1,
                collectionNum:1,
                userId:1,
                userCoinNum:1
            }
        }


    })
</script>
</html>

<%--//弹幕开关按钮--%>
<script>
    $(function () {
        //投币窗口
        $("#close").click(function () {
            $("div.bili-dialog-m").detach();
         })
        $(".bi-btn").click(function () {
            $("div.bili-dialog-m").detach();
         })

        $toubi=$("div.bili-dialog-m").detach();
        $(".coin").click(function () {
            $(".v-wrap").prepend($toubi);
        })

        //弹幕开关按钮
        var flag=0;
        $(".danmu-trigger").click(function(){
            if(flag){
                $("div.danmu-trigger").addClass("off");
                $(".dm").fadeOut();
                flag=0;
            }else{
                $("div.danmu-trigger").removeClass("off");
                $(".dm").fadeIn();
                flag=1;
            }
            init_screen();
        });
        init_screen();
        $(".s_btn").click(function () {
            var value = $(".s_txt").val();
            var tmpDiv = $("<div>"+value+"<div>");
            $(".dm_show").append((tmpDiv));
            init_screen();
        });
        //初始化屏幕
        function init_screen() {
            var _top=0;
            $(".dm_show").find("div").show().each(function () {
                _top = _top+20;
                if (_top>=$(".dm").height()-20){
                    _top=0;
                }
                //div的left
                var _left = $(".dm").width()-$(this).width();
                //设置文字初始位置颜色
                $(this).css({left:_left,top:_top,color:getRandomColor()});
                //每个时间不同
                var time = Math.ceil(800+Math.random()*10000);
                //动起来
                $(this).animate({left:"-"+_left+"px"},time,function () {
                    $(this).remove();
                })

            })
        }
    });
    function getRandomColor() {
        var str= Math.ceil(Math.random()*16777215).toString(16);
        while (str.length<6) {
            str ='0'+str;
        }
        return "#"+str;

    }

</script>
