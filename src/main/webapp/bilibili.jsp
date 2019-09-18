<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/17
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <base href="/">
    <link rel="stylesheet" href="css/main/bass.css" />
    <link rel="stylesheet" href="css/main/header.css" />
    <link rel="stylesheet" href="css/main/iconfont.css" />
    <link rel="stylesheet" href="css/main/head.css" />
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            var imgCount = 5;
            var index = 1;
            var intervalId;
            var buttonSpan = $('.trig')[0].children; //htmlCollection 集合
            //自动轮播功能 使用定时器
            autoNextPage();
            autoNextScroll();

            function autoNextPage() {
                intervalId = setInterval(function() {
                    nextPage(true);
                }, 3000);
            }
            //当鼠标移入 停止轮播
            $('.panel').hover(function() {
                console.log('hah');
                clearInterval(intervalId);
            }, function() { // 当鼠标移出，开始轮播
                autoNextPage();
            });



            //小圆点的相应功能 事件委托
            clickButtons();

            function clickButtons() {
                var length = buttonSpan.length;
                for(var i = 0; i < length; i++) {
                    buttonSpan[i].onclick = function() {
                        $(buttonSpan[index - 1]).removeClass('on');
                        if($(this).attr('index') == 1) {
                            index = 5;
                        } else {
                            index = $(this).attr('index') - 1;
                        }
                        nextPage(true);
                    };
                }
            }

            function nextPage(next) {
                var targetLeft = 0;
                //当前的圆点去掉on样式
                $(buttonSpan[index - 1]).removeClass('on');
                if(next) { //往后走
                    if(index == 5) { //到最后一张，直接跳到第一张
                        targetLeft = 0;
                        index = 1;
                    } else {
                        index++;
                        targetLeft = -440 * (index - 1);
                    }

                } else { //往前走
                    if(index == 1) { //在第一张，直接跳到第五张
                        index = 5;
                        targetLeft = -440 * (imgCount - 1);
                    } else {
                        index--;
                        targetLeft = -440 * (index - 1);
                    }

                }
                $('.carousel-module .panel .pic').animate({
                    left: targetLeft + 'px'
                });
                //更新后的圆点加上样式
                $(buttonSpan[index - 1]).addClass('on');

            }
            /*-------/
             *
             */


            $("#close").click(function() {
                $("#fixed-app-download").detach();
            })
            var $menu_li = $(".bili-tab-item");
            $menu_li.click(function() {
                //1.将点击的li高亮
                $(this).addClass("on");
                //并去掉其他的高亮
                $(this).siblings().removeClass("on");

                //点击第1个li 显示第1个div  点击第2个li 显示第2个div
                //首先获得点击了第几个li
                var clickedLiIndex = $menu_li.index(this);
                $("div.tab-box>div").eq(clickedLiIndex).show();
                $("div.tab-box>div").eq(clickedLiIndex).siblings().hide();
            })
            var left1 = 0;
            var left2 = 320;
            autoNextScroll()
            function autoNextScroll() {
                intervalId = setInterval(function() {
                    scroll1(true);
                }, 100);
            }

            function scroll1(next) {

                if(left1 == -320) {
                    left1 = 320;
                }
                if(left2 == -320) {

                    left2 = 320;
                }

                $('#d1').animate({
                    left: left1 + 'px'
                });

                $('#d2').animate({
                    left: left2 + 'px'
                });
                left1 -= 10;
                left2 -= 10;

            }
            $("img[class='face']").hover(function() {
                $("#i-login").fadeIn();

            }, function() {
                $("#i-login").hover(function() {
                    $("#i-login").fadeIn();
                }, function() {
                    $("#i-login").fadeOut();
                })
            });

            //  在线人数
            var str={"userType":'u87'};

            $.ajax({
                url:"/liveUserNum",
                type:"post",
                dataType:"text",
                data:str,
                success: function (data) {
                    vNum.Num=data;
                },
            });
            //从登录界面登录成功后，跳到主界面并给vm.user.uid赋值
            $("#face").attr("src","images/main/akari.jpg");
            $node1=$("div.profile-m").detach();
            $node2=$("li.nipi").detach();
            <%--function ll(){--%>
            <%--    try {--%>
            <%--        vm.user.uid=${sid};--%>
            <%--    }catch (e) {--%>
            <%--        vm.user.uid=null;--%>
            <%--    }--%>
            <%--}--%>
            <%--ll();--%>
            // 视频分类数量
            $.ajax({

            })






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
        <div id="banner_link" class="head-banner report-scroll-module" style="background-image: url(images/main/header.png);" scrollshow="true">
            <div class="head-content bili-wrapper">
                <div class="search">
                    <form class="searchform">
                        <input class="search-keyword" type="text" />
                        <button class="search-submit"></button>
                    </form>
                    <a class="link-ranking">
                        <span>排行榜</span>
                    </a>

                </div>
                <div class="head-logo" style="background-image: url(images/main/header-logo.png);"></div>
            </div>
        </div>
        <div class="bili-wrapper">
            <div id="primary_menu" class="primary-menu report-scroll-module ">
                <ul class="nav-menu">
                    <li class="home">
                        <a>
                            <div class="nav-name">首页</div>
                        </a>
                        <ul class="sub-nav"></ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">动画</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>MAD·AMV</span></a>
                            </li>
                            <li>
                                <a><span>MMD·3D</span></a>
                            </li>
                            <li>
                                <a><span>短片·手书·配音</span></a>
                            </li>
                            <li>
                                <a><span>特摄</span></a>
                            </li>
                            <li>
                                <a><span>综合</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">番剧</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>连载动画</span></a>
                            </li>
                            <li>
                                <a><span>完结动画</span></a>
                            </li>
                            <li>
                                <a><span>咨询</span></a>
                            </li>
                            <li>
                                <a><span>官方延伸</span></a>
                            </li>
                            <li>
                                <a><span>新番时间表</span></a>
                            </li>
                            <li>
                                <a><span>番剧引索</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">国创</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>国产动画</span></a>
                            </li>
                            <li>
                                <a><span>国产动画相关</span></a>
                            </li>
                            <li>
                                <a><span>布袋戏</span></a>
                            </li>
                            <li>
                                <a><span>动态漫·广播剧</span></a>
                            </li>
                            <li>
                                <a><span>咨询</span></a>
                            </li>
                            <li>
                                <a><span>新番时间表</span></a>
                            </li>
                            <li>
                                <a><span>国产动画引索</span></a>
                            </li>

                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">音乐</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>MAD·AMV</span></a>
                            </li>
                            <li>
                                <a><span>原创音乐</span></a>
                            </li>
                            <li>
                                <a><span>翻唱</span></a>
                            </li>
                            <li>
                                <a><span>VOCALOID·UTAU</span></a>
                            </li>
                            <li>
                                <a><span>电音</span></a>
                            </li>
                            <li>
                                <a><span>演奏</span></a>
                            </li>
                            <li>
                                <a><span>MV</span></a>
                            </li>
                            <li>
                                <a><span>音乐现场</span></a>
                            </li>
                            <li>
                                <a><span>音乐综合</span></a>
                            </li>
                            <li>
                                <a><span>音频</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">舞蹈</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>宅舞</span></a>
                            </li>
                            <li>
                                <a><span>三次元舞蹈</span></a>
                            </li>
                            <li>
                                <a><span>舞蹈教程</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">游戏</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>单机游戏</span></a>
                            </li>
                            <li>
                                <a><span>电子竞技</span></a>
                            </li>
                            <li>
                                <a><span>手机游戏</span></a>
                            </li>
                            <li>
                                <a><span>网络游戏</span></a>
                            </li>
                            <li>
                                <a><span>桌游棋牌</span></a>
                            </li>
                            <li>
                                <a><span>GMV</span></a>
                            </li>
                            <li>
                                <a><span>音游</span></a>
                            </li>
                            <li>
                                <a><span>Mugen</span></a>
                            </li>
                            <li>
                                <a><span>游戏赛事</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">科技</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>趣味人文科普</span></a>
                            </li>
                            <li>
                                <a><span>野生技术协会</span></a>
                            </li>
                            <li>
                                <a><span>演讲·公开课</span></a>
                            </li>
                            <li>
                                <a><span>星海</span></a>
                            </li>
                            <li>
                                <a><span>机械</span></a>
                            </li>
                            <li>
                                <a><span>汽车</span></a>
                            </li>

                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">数码</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>手机平板</span></a>
                            </li>
                            <li>
                                <a><span>电脑装机</span></a>
                            </li>
                            <li>
                                <a><span>摄影摄像</span></a>
                            </li>
                            <li>
                                <a><span>影音智能</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">生活</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>搞笑</span></a>
                            </li>
                            <li>
                                <a><span>日常</span></a>
                            </li>
                            <li>
                                <a><span>美食圈</span></a>
                            </li>
                            <li>
                                <a><span>动物圈</span></a>
                            </li>
                            <li>
                                <a><span>手工</span></a>
                            </li>
                            <li>
                                <a><span>绘画</span></a>
                            </li>
                            <li>
                                <a><span>运动</span></a>
                            </li>
                            <li>
                                <a><span>其他</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">鬼畜</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>鬼畜调教</span></a>
                            </li>
                            <li>
                                <a><span>音MAD</span></a>
                            </li>
                            <li>
                                <a><span>人力VOCALOID</span></a>
                            </li>
                            <li>
                                <a><span>教程演示</span></a>
                            </li>

                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">时尚</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>美妆</span></a>
                            </li>
                            <li>
                                <a><span>服饰</span></a>
                            </li>
                            <li>
                                <a><span>健身</span></a>
                            </li>
                            <li>
                                <a><span>T台</span></a>
                            </li>
                            <li>
                                <a><span>风尚标</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">广告</div>
                        </a>
                        <ul class="sub-nav"></ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">娱乐</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>综艺</span></a>
                            </li>
                            <li>
                                <a><span>明星</span></a>
                            </li>
                            <li>
                                <a><span>Korea相关</span></a>
                            </li>
                        </ul>
                    </li>

                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">影视</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>影视杂谈</span></a>
                            </li>
                            <li>
                                <a><span>视频剪辑</span></a>
                            </li>
                            <li>
                                <a><span>短片</span></a>
                            </li>
                            <li>
                                <a><span>预告·资讯</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a>
                            <div class="num-wrap">
                                <span>999+</span>
                            </div>
                            <div class="nav-name">放映厅</div>
                        </a>
                        <ul class="sub-nav">
                            <li>
                                <a><span>纪录片</span></a>
                            </li>
                            <li>
                                <a><span>电影</span></a>
                            </li>
                            <li>
                                <a><span>电视剧</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="side-nav zl">
                        <a class="side-link">
                            <i class="zhuanlan"></i>
                            <span>专栏</span>
                        </a>
                    </li>
                    <li class="side-nav zl">
                        <a class="side-link">
                            <i class="square"></i>
                            <span>广场</span>
                        </a>
                    </li>
                    <li class="side-nav zl">
                        <a class="side-link">
                            <i class="live"></i>
                            <span>直播</span>
                        </a>
                    </li>
                    <li class="side-nav zl">
                        <a class="side-link">
                            <i class="blackroom"></i>
                            <span>小黑屋</span>
                        </a>
                    </li>
                </ul>
                <div class="gif-menu nav-gif">
                    <a class="random-p">
                        <img src="images/main/up主.gif" />
                    </a>
                </div>
            </div>
        </div>

    </div>
    <div id="fixed-app-download" class="home-app-download">
        <div class="bili-wrapper con">
            <img src="images/main/ic_launcher.png" width="32" height="32">
            <span>哔哩哔哩，发弹幕看视频必备App</span>
            <a class="btn-down">下载</a>
            <i id="close" class="icon btn-close"></i>
        </div>
    </div>
    <div class="bili-wrapper">
        <div id="chief_recommend" class="chief-recommend-module report-scroll-module clearfix">
            <div class="carousel-box">
                <div id="scroll" class="carousel-module">
                    <div class="panel">
                        <ul id="ul" class="pic" style="width: 500%;">
                            <li class=" scrollx off ">
                                <img src="images/main/lunbo1.jpg " width="440 " height="220 " />
                                <a class="more-text" style="z-index: 200;">更多</a>
                            </li>
                            <li class="scrollx off ">
                                <img src="images/main/lunbo2.jpg " width="440 " height="220 " />
                                <a class="more-text" style="z-index: 200;">更多</a>
                            </li>
                            <li class="scrollx off ">
                                <img src="images/main/lunbo3.jpg " width="440 " height="220 " />
                                <a class="more-text" style="z-index: 200;">更多</a>
                            </li>
                            <li class="scrollx off ">
                                <img src="images/main/lunbo4.jpg " width="440 " height="220 " />
                                <a class="more-text" style="z-index: 200;">更多</a>
                            </li>
                            <li class="scrollx off ">
                                <img src="images/main/lunbo5.jpg " width="440 " height="220 " />
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
            <div class="recommend-module clearfix">
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up1.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">这些山海经异兽竟是古代巫师的cosplay？【潇洒观山海03】</p>
                        <p class="author">up主：齐天大肾余潇洒</p>
                        <p class="play">播放：19.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up2.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">疯狂吐槽上海堡垒！看完这个电影感觉智商被侮辱了！</p>
                        <p class="author">up主：LexBurner</p>
                        <p class="play">播放：120.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up3.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">「鬼灭之刃」温柔到让人哭泣的心——心碎者的柔歌</p>
                        <p class="author">up主：reAct木子</p>
                        <p class="play">播放：2.4万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up1.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">这些山海经异兽竟是古代巫师的cosplay？【潇洒观山海03】</p>
                        <p class="author">up主：齐天大肾余潇洒</p>
                        <p class="play">播放：19.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up1.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">这些山海经异兽竟是古代巫师的cosplay？【潇洒观山海03】</p>
                        <p class="author">up主：齐天大肾余潇洒</p>
                        <p class="play">播放：19.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up1.jpg" width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">这些山海经异兽竟是古代巫师的cosplay？【潇洒观山海03】</p>
                        <p class="author">up主：齐天大肾余潇洒</p>
                        <p class="play">播放：19.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <div class="groom-module home-card">
                    <a title=""><img class="pic" src="images/main/Up1.jpg"width="160" height="100"></a>
                    <div class="card-mark">
                        <p class="title">这些山海经异兽竟是古代巫师的cosplay？【潇洒观山海03】</p>
                        <p class="author">up主：齐天大肾余潇洒</p>
                        <p class="play">播放：19.2万</p>
                    </div>
                    <div class="watch-later-trigger w-later"></div>
                </div>
                <span class="rec-btn prev">三日</span>
                <span class="rec-btn next">昨日</span>
            </div>
        </div>
        <div id="home_popularize" class="popularize-module report-scroll-module clearfix" scrollshow=true>
            <div class="l-con">
                <div class="headline clearfix">
                    <i class="icon icon_t icon-promote"></i>
                    <span class="name">推广</span>
                </div>
                <div class="storey-box clearfix">
                    <div class="spread-module">
                        <a>
                            <div class="pic">
                                <img src="images/main/推广1.jpg" />
                                <div class="cover-preview-module">
                                    <div class="cover" style=" background-position: 0px 0px; background-size: 1600px auto;"></div>
                                    <div class="progress-bar"><span style="width: 0%;"></span></div>
                                </div>
                                <div class="mask-video"></div>
                                <div class="danmu-module"></div>
                                <span class="dur">08:50</span>
                                <div class="watch-later-trigger w-later"></div>
                            </div>
                            <p title="" class="t">三无萝莉？黑化病娇？你更喜欢哪种声线</p>
                        </a>
                    </div>
                    <div class="spread-module">
                        <a>
                            <div class="pic">
                                <img src="images/main/推广2.jpg" />
                                <div class="cover-preview-module">
                                    <div class="cover" style=" background-position: 0px 0px; background-size: 1600px auto;"></div>
                                    <div class="progress-bar"><span style="width: 0%;"></span></div>
                                </div>
                                <div class="mask-video"></div>
                                <div class="danmu-module"></div>
                                <span class="dur">08:50</span>
                                <div class="watch-later-trigger w-later"></div>
                            </div>
                            <p title="" class="t">哈利·波特与火焰杯：三强争霸赛开幕！</p>
                        </a>
                    </div>
                    <div class="spread-module">
                        <a>
                            <div class="pic">
                                <img src="images/main/推广3.jpg" />
                                <div class="cover-preview-module">
                                    <div class="cover" style=" background-position: 0px 0px; background-size: 1600px auto;"></div>
                                    <div class="progress-bar"><span style="width: 0%;"></span></div>
                                </div>
                                <div class="mask-video"></div>
                                <div class="danmu-module"></div>
                                <span class="dur">08:50</span>
                                <div class="watch-later-trigger w-later"></div>
                            </div>
                            <p title="" class="t">传说中每天一遍远离自闭的独立游戏</p>
                        </a>
                    </div>
                    <div class="spread-module">
                        <a>
                            <div class="pic">
                                <img src="images/main/推广4.jpg" />
                                <div class="cover-preview-module">
                                    <div class="cover" style="background-position: 0px 0px; background-size: 1600px auto;"></div>
                                    <div class="progress-bar"><span style="width: 0%;"></span></div>
                                </div>
                                <div class="mask-video"></div>
                                <div class="danmu-module"></div>
                                <span class="dur">08:50</span>
                                <div class="watch-later-trigger w-later"></div>
                            </div>
                            <p title="" class="t">AMD不适合玩英雄联盟？！一个简单的操作瞬间帧数瞬间提升20%！而且适用于所有AMD用户哦！！</p>
                        </a>
                    </div>
                    <div class="spread-module">
                        <a>
                            <div class="pic">
                                <img src="images/main/推广5.jpg" />
                                <div class="cover-preview-module">
                                    <div class="cover" style=" background-position: 0px 0px; background-size: 1600px auto;"></div>
                                    <div class="progress-bar"><span style="width: 0%;"></span></div>
                                </div>
                                <div class="mask-video"></div>
                                <div class="danmu-module"></div>
                                <span class="dur">08:50</span>
                                <div class="watch-later-trigger w-later"></div>
                            </div>
                            <p title="三无萝莉？黑化病娇？你更喜欢哪种声线" class="t">三无萝莉？黑化病娇？你更喜欢哪种声线</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="r-con">
                <div class="online">
                    <a>在线人数：{{Num}}</a>
                </div>
                <div class="adpos">
                    <a>
                        <img src="images/main/专栏.jpg" alt="" class="pic" width="260" height="150">
                    </a>
                </div>
            </div>
        </div>
        <div class="report-wrap-module " style="top:232px "></div>
        <div id="bili_live" class="zone-wrap-module report-scroll-module clearfix">
            <div class="live-module clearfix">
                <div class="gg-floor-module">
                    <div class="item" style="overflow: hidden; margin: 0px auto;">
                        <a>
                            <div class="lazy-img">
                                <img src="images/main/广告1.jpg" />
                            </div>
                            <img class="gg-pic" src="images/main/cm_2.png" />
                        </a>
                    </div>
                </div>
                <div class="l-con">
                    <div class="zone-title">
                        <div class="headline clearfix">
                            <i class="icon icon_t icon-live"></i>
                            <a class="name">正在直播</a>
                            <p class="online">
                                当前共有
                                <span>12354</span> 正在直播
                            </p>
                            <a class="fire">
                                <i class="icon pmt-icon"></i> 233秒居然能做这些！
                            </a>
                            <a class="link-more">
                                更多
                                <i class="icon"></i>
                            </a>
                            <div class="read-push">
                                <i class="icon icon_read"></i>
                                <span class="info">
											<b>141096</b>
											条新动态
										</span>
                            </div>
                        </div>
                    </div>
                    <div class="storey-box clearfix">
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                        <div class="card-live-module">
                            <a>
                                <div class="pic">
                                    <div class="lazy-img">
                                        <img src="images/main/直播1.jpg" />
                                    </div>
                                    <div class="snum">
                                        <span class="auther">哔哩哔哩英雄联盟赛事</span>
                                        <span class="online"><i></i>1657.4万</span>
                                    </div>
                                    <div class="mask" style=""></div>
                                </div>
                                <p class="t">英雄联盟八周年庆典</p>
                                <p class="num">
                                    网游 · 英雄联盟
                                </p>
                            </a>
                        </div>
                    </div>

                </div>
                <div class="r-con">
                    <div class="bili-tab bili-tab">
                        <div class="bili-tab-item">直播排行</div>
                        <div class="bili-tab-item">你关注的主播</div>
                        <div class="bili-tab-item">为您推荐</div>
                    </div>
                    <div class="tab-box">
                        <div class="tab-con clearfix">
                            <div class="tab-item rank">
                                <div class="r-item">
                                    <span class="number">1</span>
                                    <a class="preview">
                                        <div class="lazy-img">
                                            <img src="images/main/zhubo.jpg" />
                                        </div>
                                    </a>
                                    <a>
                                        <div class="r-i">
                                            <p class="r-i-t">
                                                <span class="u-name">哔哩哔哩英雄联盟赛事</span>
                                                <span class="u-online">
															<i></i>
															<em>1657.4万</em>
														</span>
                                            </p>
                                            <div title="英雄联盟八周年庆典" class="r-i-st">英雄联盟八周年庆典</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div></div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="elevator-module">
        <div class="nav-bg">
            <div class="tips-img"></div>
        </div>
        <div class="nav-list">
            <div sortindex="0" class="item sortable">直播</div>
            <div sortindex="1" class="item sortable">动画</div>
            <div sortindex="2" class="item sortable">番剧</div>
            <div sortindex="3" class="item sortable">国创</div>
            <div sortindex="4" class="item sortable">漫画</div>
            <div sortindex="5" class="item sortable">音乐</div>
            <div sortindex="6" class="item sortable">舞蹈</div>
            <div sortindex="7" class="item sortable">游戏</div>
            <div sortindex="8" class="item sortable">科技</div>
            <div sortindex="9" class="item sortable">数码</div>
            <div sortindex="10" class="item sortable">生活</div>
            <div sortindex="11" class="item sortable">鬼畜</div>
            <div sortindex="12" class="item sortable">时尚</div>
            <div sortindex="13" class="item sortable">广告</div>
            <div sortindex="14" class="item sortable">娱乐</div>
            <div sortindex="15" class="item sortable">专栏</div>
            <div sortindex="16" class="item sortable">电影</div>
            <div sortindex="17" class="item sortable">TV剧</div>
            <div sortindex="18" class="item sortable">影视</div>
            <div sortindex="19" class="item sortable">纪录片</div>
            <div class="item customize"><i class="icon"></i></div>
        </div>
    </div>
    <div class="footer " style="display: none; "></div>
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
        data: {Num:null,},
    })
</script>

</html>
