<%--
  Created by IntelliJ IDEA.
  User: gosick39
  Date: 2019/9/18
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>创作中心 - 哔哩哔哩弹幕视频网 - ( ゜- ゜)つロ 乾杯~</title>
    <link rel="shortcut icon" href="/images/main/bilibili.ico">
    <link rel="stylesheet" href="/css/upload/upload_home.css">
    <link rel="stylesheet" href="/css/upload/header.css" />
    <link rel="stylesheet" href="/css/main/bass.css"/>
    <link rel="stylesheet" href="/css/upload/upload_menu.css">
    <link rel="stylesheet" href="/css/main/iconfont.css">
    <script src="/js/jquery-3.4.1.js"></script>
    <script src="/js/upload/upload-home.js"></script>
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
</head>
<body>
    <div class="bili-header">
        <div class="nav-menu">
            <div class="blur-bg" style="background-image: url(/images/main/header.png);"></div>
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
                                    <img id="d1" src="/images/main/danmu1.png" />
                                    <img id="d2" src="/images/main/danmu1.png" style="left: 320px;" />
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
    <div class="cc-nav-wrp">
        <div class="cc-nav">
            <a href="#/home" class="logo" id="nav_home"></a>
            <div class="nav-upload-btn"><a href="/video/uploadVideo" class="active" id="nav_upload_btn">投稿</a></div>
            <ul class="nav-wrp">
                <li id="nav_upload_home">
                    <a href="/video/homeVideo" class="nav-item">
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
                <%--            <li id="nav_upload_income">--%>
                <%--                <a href="/video/managerVideo" class="nav-item">--%>
                <%--                    <i class="fontvt icon-ic_income"></i>--%>
                <%--                    <span>收益管理</span>--%>
                <%--                </a>--%>
                <%--            </li>--%>
            </ul>
        </div>
    </div>
    <div class="cc-body">
    <div class="home-wrap">
        <div class="home-wrap cc-content-body">
            <div class="row1">
                <div class="chief-recommend-module report-scroll-module clearfix card">
                    <div class="carousel-box"style="width: 620px">
                        <div class="more_wrap">
                            <div class="more_wrap__bg"></div>
                            <a>更多活动</a>
                        </div>
                        <div id="scroll" class="carousel-module">
                            <div class="panel">
                                <ul id="ul" class="pic" style="width: 500%;">
                                    <li class=" scrollx off ">
                                        <img src="/images/upload/lunbo5.png"  />
                                        <a class="more-text" style="z-index: 200;">更多</a>
                                    </li>
                                    <li class="scrollx off ">
                                        <img src="/images/upload/lunbo1.jpg"  />
                                        <a class="more-text" style="z-index: 200;">更多</a>
                                    </li>
                                    <li class="scrollx off ">
                                        <img src="/images/upload/lunbo2.jpg"  />
                                        <a class="more-text" style="z-index: 200;">更多</a>
                                    </li>
                                    <li class="scrollx off ">
                                        <img src="/images/upload/lunbo3.png"  />
                                        <a class="more-text" style="z-index: 200;">更多</a>
                                    </li>
                                    <li class="scrollx off ">
                                        <img src="/images/upload/lunbo4.jpg"  />
                                        <a class="more-text" style="z-index: 200;">更多</a>
                                    </li>
                                </ul>

                                <ul class="trig ">
                                    <span index="1" class="on"></span>
                                    <span index="2" class=""></span>
                                    <span index="3" class=""></span>
                                    <span index="4" class=""></span>
                                    <span index="5" class=""></span>
                                </ul>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="high-wrapper funcDialog">
                <div class="high-wrapper__body">

                </div>
            </div>
            <div class="row2">
                <div class="data-card card">
                    <div class="data-wrp">
                        <div class="tab clearfix"style="width: 100%;">
                            <div class="videoFirst fl">
                                <a class="data-tab current">视频数据</a>
                            </div>
                        </div>
                        <div class="section video clearfix">
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    播放总量
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(0)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    点赞总量
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(1)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    弹幕总量
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(2)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    收藏总量
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(3)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    硬币总量
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(4)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="section-item vedio fl">
                                <div class="data-name">
                                    粉丝数
                                </div>
                                <div class="text-content">
                                    <span>${videoInfo.get(5)}</span>
                                </div>
<%--                                <div class="diff-wrp">--%>
<%--                                    <span class="improve">昨日增量</span>--%>
<%--                                    <span class="no-improve"></span>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
