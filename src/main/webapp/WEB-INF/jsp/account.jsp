<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/16
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<%
    Object userInfo=session.getAttribute("userInfo");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="/images/main/bilibili.ico">
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/main/bass.css" />
    <link rel="stylesheet" href="css/main/header.css" />
    <link rel="stylesheet" href="css/main/iconfont.css" />
    <script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
    <script type="text/javascript" src="laydate/laydate.js"></script>
    <script type="text/javascript">
    </script>
    <style type="text/css">
    </style>
    <script>
        $(function () {
            $("div.el-radio-group label.el-radio-button").click(function () {
                // $(this).addClass("is-active");
                $(this).children("span.el-radio-button__inner").addClass("is-active");
                $(this).siblings().children("span.el-radio-button__inner").removeClass("is-active");
            })
            var $sec_menu=$("#ul1 li");
            $sec_menu.click(function () {
                $(this).addClass("is-active");
                $(this).children("span.security-nav-name").css("color","#ffffff");
                $(this).siblings().removeClass("is-active");
                $(this).siblings().children("span.security-nav-name").css("color","#222");
                var sindex=$sec_menu.index($(this));
                $("div.security-right").eq(sindex).show();
                $("div.security-right").eq(sindex).siblings().hide();
            });
            //转换日期
            function getdate(t) {
                var _time = new Date(t);
                var year = _time.getFullYear();//2017
                var month = _time.getMonth() + 1;//7
                var date = _time.getDate();//10
                return year + "-" + month + "-" + date;
            }

            //用户信息
            $.ajax({
                url: "/getUserInfo",
                type: "post",
                data: {"id":${sessionScope.userInfo.userId}},
                datatype: "json",
                success: function (data) {

                    $("#el-name").append("<input class=\"el-input__inner\" type=\"text\"autocomplete=\"off\" placeholder=\"你的昵称\"value=\""+data.userName+"\" name=\"userName\"/>\n");
                    $("#el-id").prepend("<input name=\"userId\"style='border: none' readonly=\"readonly\" value='"+data.userId+"'/>\n");
                    $("#el-phone").append("<input class=\"el-input__inner\" type=\"text\"autocomplete=\"off\" name='userTele' placeholder=\""+data.userTele+"\"/>\n");
                    $("#el-email").append("<input class=\"el-input__inner\" type=\"text\"autocomplete=\"off\" name='userEmail' placeholder=\""+data.userEmail+"\"/>\n");
                    $("#date").append("<input id=\"date1\" class=\"el-input__inner\"value=\""+getdate(data.userBirthday)+"\">\n");
                    laydate.render({
                        elem: '#date1'
                    });
                }
            });

        })
    </script>
</head>

<body>

<div id="app">
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
    <div class="top-banner">
        <img src="images/main/rl_top.png" />
    </div>
    <div class="security_content">
        <div class="security-left">
            <span class="security-title">个人中心</span>
            <ul id="ul1" class="security-ul">
                <li class="security-list is-active">
                    <i class="security-icon icon-3"></i>
                    <span class="security-nav-name"style="color: #FFFFFF">我的信息</span>
                </li>
            </ul>
            <ul class="security-ul ">
                <li class="security-list-jump">
                    <a class="security-list-link-jump" href="/index">
                        个人空间
                        <i class="security-list-jump-icon"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div>
            <div class="security-right">
                <div class="security-right-title">
                    <span class="security-right-title-icon"></span>
                    <span class="security-right-title-text">我的信息</span>
                </div>
                <div class="user-setting-warp">
                    <div>
                        <form class="el-form clearfix" action="/account/changeuserinfo">
                            <div class="el-form-item user-nick-name">
                                <label class="el-form-item__label">昵称：</label>
                                <div class="el-form-item__content">
                                    <div class="el-input"id="el-name">
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-nick-rel-name">
                                <label class="el-form-item__label">用户名：</label>
                                <div class="el-form-item__content" id="el-id">
                                </div>
                            </div>
                            <div class="el-form-item user-my-sex">
                                <label class="el-form-item__label">性别：</label>
                                <div class="el-form-item__content">
                                    <div class="el-radio-group">
                                        <label class="el-radio-button">
                                            <input type="radio" class="el-radio-button__orig-radio" value="男">
                                            <span  class="el-radio-button__inner is-active">男</span>
                                        </label>
                                        <label class="el-radio-button ">
                                            <input type="radio" class="el-radio-button__orig-radio" value="女">
                                            <span class="el-radio-button__inner">女</span>
                                        </label>
                                        <label class="el-radio-button">
                                            <input type="radio" class="el-radio-button__orig-radio" value="保密">
                                            <span class="el-radio-button__inner">保密</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-my-sex">
                                <label class="el-form-item__label">出生日期：</label>
                                <div class="el-form-item__content">
                                    <div class="el-date-editor el-input el-date-editor--date"id="date">

                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-nick-name">
                                <label class="el-form-item__label">更换密码：</label>
                                <div class="el-form-item__content">
                                    <div class="el-input">
                                        <input class="el-input__inner" type="text" name="userPassw" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-nick-name">
                                <label class="el-form-item__label">更换手机：</label>
                                <div class="el-form-item__content">
                                    <div class="el-input" id="el-phone">
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-nick-name">
                                <label class="el-form-item__label">更换邮箱：</label>
                                <div class="el-form-item__content">
                                    <div class="el-input" id="el-email">
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-my-btn">
                                <div class="el-form-item__content">
                                    <div class="padding-dom"></div>
                                    <div class="user-my-btn-warp">
                                        <button class="el-button"type="submit">
                                            <span>保存</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div></div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>

</html>