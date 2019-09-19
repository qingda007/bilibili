
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <base href="/">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/login/jigsaw.js"></script>
    <link href="css/login/login.css" rel="stylesheet">
    <link href="css/login/jigsaw.css" rel="stylesheet">
    <style>
        .container {
            width: 310px;
            height: 360px;
            margin: 100px auto;
        }
        input {
            display: block;
            width: 290px;
            line-height: 40px;
            margin: 10px 0;
            padding: 0 10px;
            outline: none;
            border:1px solid #c8cccf;
            border-radius: 4px;
            color:#6a6f77;
        }
        #msg {
            width: 100%;
            line-height: 40px;
            font-size: 14px;
            text-align: center;
        }
        a:link,a:visited,a:hover,a:active {

            color: #0366D6;
        }

    </style>
</head>
<body>
<div id="login-app">
    <div class="login-app">
        <!--            头部header-->
        <div class="bili-header-m">
            <div class="nav-menu">
                <div class="blur-bg" style="background-image: url(images/main/header.png);"></div>
                <div class="nav-mask"></div>
                <div class="bili-wrapper clearfix nav-wraper">
                    <div class="nav-con fl">
                        <ul>
                            <li class="nav-item home">
                                <a href="/bilibili" class="t">
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
                        <a class="u-link" href="/user/toLogin">投稿</a>
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
        <!--            bilibili图标，登陆上边的-->
        <div class="top-banner">
            <img src="images/login/rl_top.png">
        </div>
        <!--            登录二字-->
        <div class="title-line">
            <span class="tit" style="font-size: 38px;">登录</span>
        </div>
        <!--            登录部分-->
        <div class="login-box">
            <!--  左边二维码部分登录部分 -->
            <div class="login-left">
                <!--  左边二维码部分登录部分 -->
                    <div class="container">
                        <div id="captcha" style="position: relative"></div>
                        <div id="msg"></div>
                    </div>
                    <script>
                        jigsaw.init(document.getElementById('captcha'),function () {
                            document.getElementById('msg').innerHTML = '验证通过！';
                            $("#submit").attr("disabled",false).css("background-color","#00a1d6").css("color","#fff").css("cursor","pointer");
                        },function () {
                            document.getElementById('msg').innerHTML = '验证失败！'
                            $("#submit").attr("disabled",true).css("background-color","#f5f5f5")
                        });
                    </script>
<%--                <div class="qrcode-login">--%>
<%--                    <div class="qrcode-con">--%>
<%--                        <i class="tv-icon"></i>--%>
<%--                        <div class="qrcode-box">--%>
<%--                            <div>--%>
<%--                                <img src="images/login/qrcode.png" style="display: block;">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="qrcode-footer">--%>
<%--                        <p class="status-txt">扫描二维码登录</p>--%>
<%--                        <p class="app-link">请使用--%>
<%--                            <a>哔哩哔哩客户端</a>--%>
<%--                            <br>--%>
<%--                            扫码登录--%>
<%--                            <br>--%>
<%--                            或扫码下载APP--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <div class="line">
            </div>
            <form action="${pageContext.request.contextPath}/user/checkLogin" method="post">
                <div class="login-right">
                    <div class="form-login">
                        <div class="input-box">
                            <ul style="list-style-type:none">
                                <li class=" item status-box">
                                    <input type="text" placeholder="请输入用户名" id="userName" name="userName" maxlength="50" autocomplete="off">
                                    <span class="status"></span>
                                    <div class="text">
                                        <p class="tips"></p>
                                    </div>
                                </li>
                                <li class="item status-box">
                                    <input type="password" placeholder="密码"  id="userPassw" name="userPassw">
                                    <span class="status"></span>
                                    <div class="text clearfix"></div>
                                </li>
                                <li class="remember">
                                    <label >
                                        <input type="checkbox" class="move"style="width: 13px">记住我
                                        <span>不是自己的电脑上不要勾选此项</span>
                                        <a target="_blank" class="forget-password">忘记密码？</a>
                                        <a target="_blank" class="not-checkout">无法验证</a>
                                    </label>

                                </li>
                                <li class="btn-box">
                                    <input type="submit" id="submit" disabled="disabled" class="btn btn-login"  value="登录" style="cursor: not-allowed">
                                    <a class="btn btn-reg" href="/user/toRegister">注册</a>
                                </li>
                                <li class="sns">
                                    <a class="btn weibo" style="color: #717171">
                                        微博账号登陆
                                    </a>
                                    <a class="btn qq" style="color: #717171">
                                        QQ账号登陆
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--            用户协议部分-->
        <p data-v-3e357e28>登录即代表你同意
            <a data-v-3e357e28 >用户协议</a>和
            <a data-v-3e357e28>隐私政策</a>
        </p>
        <!--            尾部-->

    </div>
</div>
</body>
</html>
