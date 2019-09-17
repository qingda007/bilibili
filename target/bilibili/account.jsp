<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/16
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <base href="/">
    <link rel="stylesheet" href="css/main/bass.css" />
    <link rel="stylesheet" href="css/main/header.css" />
    <link rel="stylesheet" href="css/main/iconfont.css" />
    <script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
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
            })
        })
    </script>
</head>

<body>
<div id="app">
    <div class="bili-header">
        <div class="nav-menu">
            <div class="nav-mask"></div>
            <div class="bili-wrapper clearfix nav-wraper">
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
                        <li class="nav-item profile-info">
                            <a class="t">
                                <i class="i-face">
                                    <img src="images/main/akari.jpg" class="face">
                                    <img class="pendant" />
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
                        </li>

                        <li class="nav-item">
                            <a class="t">
                                大会员
                            </a>
                        </li>

                        <li class="nav-item">
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
                                稍后再看
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="t">
                                收藏
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="t">
                                历史
                            </a>
                        </li>
                    </ul>
                    <div class="nav-search-box">
                        <div class="nav-search showSearch-media"style="right: 0px;">
                            <form id="nav_searchform">
                                <input type="text" class="nav-search-keyword"value="sssssssssssssssssss"/>
                                <button type="submit"class="iconfont icon-sousuo nav-search-submit">

                                </button>
                            </form>
                        </div>
                    </div>
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
                <li class="security-list">
                    <i class="security-icon icon-6"></i>
                    <span class="security-nav-name">账号安全</span>
                </li>
            </ul>
            <ul class="security-ul ">
                <li class="security-list-jump">
                    <a class="security-list-link-jump">
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
                        <form class="el-form clearfix">
                            <div class="el-form-item user-nick-name">
                                <label class="el-form-item__label">昵称：</label>
                                <div class="el-form-item__content">
                                    <div class="el-input">
                                        <input class="el-input__inner" type="text"autocomplete="off" placeholder="你的昵称"value="用户昵称(暂定)"/>
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-nick-rel-name">
                                <label class="el-form-item__label">用户名：</label>
                                <div class="el-form-item__content">
                                    <span class="">注：这里填入用户id</span>
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
                                    <div class="el-date-editor el-input el-date-editor--date">
                                        <i class="el-input__icon iconfont icon-rili"></i>
                                        <input autocomplete="off" placeholder="选择日期" readonly="readonly" type="text" rows="2" class="el-input__inner">
                                    </div>
                                </div>
                            </div>
                            <div class="el-form-item user-my-btn">
                                <div class="el-form-item__content">
                                    <div class="padding-dom"></div>
                                    <div class="user-my-btn-warp">
                                        <button class="el-button">
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
            <div class="security-right"style="display: none">
                <div class="security-right-title">
                    <span class="security-right-title-icon"></span>
                    <span class="security-right-title-text">账号安全</span>
                </div>
                <div class="user-setting-warp">
                    <div class="res-box">
                        <div class="safe-logo safe">
                            <div ></div>
                        </div>
                        <ul class="nav-list">
                            <li>
                                <div class="nav-container clearfix">
                                    <div class="list-title clearfix">
                                        <div class="list-title-text">
												<span class="normal">
												</span>
                                            <p>绑定手机</p>
                                        </div>

                                    </div>
                                    <div class="list-description">
                                        <p>"用户电话号码"</p>
                                    </div>
                                    <div class="list-link">
                                        <p><a>更换手机</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="nav-container clearfix">
                                    <div class="list-title clearfix">
                                        <div class="list-title-text">
												<span class="safe">
												</span>
                                            <p>设置密码</p>
                                        </div>

                                    </div>
                                    <div class="list-description">
                                        <p>"设置或未设置"</p>
                                    </div>
                                    <div class="list-link">
                                        <p><a>修改密码</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="nav-container clearfix">
                                    <div class="list-title clearfix">
                                        <div class="list-title-text">
												<span class="normal">
												</span>
                                            <p>绑定邮箱</p>
                                        </div>

                                    </div>
                                    <div class="list-description">
                                        <p>"用户邮箱号码"</p>
                                    </div>
                                    <div class="list-link">
                                        <p><a>更换邮箱</a></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>

</html>
