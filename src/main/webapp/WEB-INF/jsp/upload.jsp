<%--
  Created by IntelliJ IDEA.
  User: gosick39
  Date: 2019/9/14
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    Object userInfo= session.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>创作中心 - 哔哩哔哩弹幕视频网 - ( ゜- ゜)つロ 乾杯~</title>
    <link rel="shortcut icon" href="/images/main/bilibili.ico">
    <link rel="stylesheet" href="/css/upload/header.css" />
    <link rel="stylesheet" href="/css/main/bass.css"/>
    <link rel="stylesheet" href="/css/upload/upload_step1.css" type="text/css">
    <link rel="stylesheet" href="/css/upload/upload_step2.css" type="text/css">
    <link rel="stylesheet" href="/css/upload/upload_step3.css" type="text/css">
    <link rel="stylesheet" href="/css/upload/upload_menu.css" type="text/css">
    <link rel="stylesheet" href="/css/main/iconfont.css">
    <script src="/js/upload/upload.js"></script>
    <script src="/js/jquery-3.4.1.min.js"></script>
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
                    url:"http://localhost:8888/getUserInfo",
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
        //提交video的所有信息
        function submitVideoInfo() {
            var videoTitle = document.getElementById('upload-video-title').value;
            $(".upload-success-hint-3").html("稿件名称: "+videoTitle);
            var videoDesc = document.getElementById('upload-video-desc').value;
            var videoPic = document.getElementById('cover').src;
            var videoTag = document.getElementById("upload-video-tag").value;
            var type1 = $('#video_type_1 option:selected').text();//选中的文本
            var type2 = $('#video_type_2 option:selected').text();//选中的文本
            if(videoTitle.length==0){
                $('html,body').animate({scrollTop:$('#video_type_2').offset().top}, 400);
            }
            // else if(videoTag.length==0){
            //     $('html,body').animate({scrollTop:$('#upload-video-title').offset().top}, 400);
            // }
            else {
                if(videoDesc.length==0){
                    videoDesc="暂无简介";
                }
                if(videoPic.length>255){
                    videoPic = null;
                }
                var userId= ${sessionScope.userInfo.userId};
                // if(userId==null){
                //     alert("您尚未登录，无法投稿！");
                //     window.history.back();
                // }
                $.ajax({
                    url : 'http://localhost:8888/video/uploadVideoInfo',//后台数据地址
                    data : {
                        userId : userId,
                        videoTitle: videoTitle,
                        videoPic: videoPic,
                        videoDesc: videoDesc,
                        statusAlias1: type1,
                        statusAlias2: type2,
                        tags: videoTag
                    },//请求type1的数据
                    success : function(data){
                        $("#upload-step2-container").css("display", "none");
                        $("#upload-step3-container").css("display","block");
                    },
                    error : function (data) {
                        alert("连接服务器失败，请联系管理员");
                    }
                });
            }
        }
    </script>
</head>
<body>
    <div id=app>
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
                                            <a class="logout"href="/bilibili">退出</a>
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
            <div id="upload-step1-container">
                <div id="homeDrop">
                    <div class="upload-icon"></div>
                    <div class="upload-tips">拖拽视频到此处也可上传</div>
                    <div class="upload-btn-container">
                        <input type="file" class="upload-btn" id="first-upload-btn" onchange="upload()" accept="video/mp4">
                        <div class="upload-btn-title">上传视频</div>
                    </div>
                    <div class="video-jam">
                        <p class="video-jam-pretext">当前审核队列</p>
                        <p class="video-jam-state" style="background-color: rgb(255, 189, 45);">繁忙</p>
                    </div>
                </div>
            </div>
            <div id="upload-step2-container">
                <div class="file-title">
                    <h1>文件上传</h1>
                    <p>（单次最多允许上传100p视频，推荐采用mp4、flv格式，可有效缩短审核转码耗时）</p>
                </div>
                <div class="file-list-wrp">
                    <div>
                        <div class="file-list-item">
                            <div id="file-item-container">
                                <div class="file-list-item-icon"><span>P1</span></div>
                                <div class="file-list-item-wrp">
                                    <div class="item-status-wrp">
                                        <p id="item-title">&nbsp;</p>
                                    </div>
                                    <div id="item-upload-progress">
                                        <div class="progress-container">
                                            <div class="progress">
                                                <div class="progress-length" id="progress-length"></div>
                                            </div>
                                            <div class="progress-percent" id="progress-percent">0%</div>
                                        </div>
                                        <div class="progress-value" id="progress-value"></div>
                                    </div>
                                </div>
                                <div class="upload-btn-container">
                                    <input type="file" class="upload-btn" id="upload-btn" onchange="upload()" accept="video/mp4">
                                    <div class="upload-btn-title">上传视频</div>
                                </div>
                            </div>
                            <video controls="controls" id="get-video-time" ></video>
                        </div>
                    </div>
                </div>
                <div class="basic-info"><h1>基本信息</h1></div><br>
                <div class="select-cover">
                    <h3>视频封面设置</h3>
                    <p>（格式jpeg、png，文件大小≤5MB，建议尺寸≥1146*717，最低尺寸≥960*600）</p>
                </div>
                <div class="cover-preview">
                    <div class="cover-preview-default">
                        <img id="cover" src="/images/upload/small-tv-logo.png" alt="bili_tv">
                        <span class="cover-upload-tip">上传封面</span>
                        <input type="file" id="upload-video-pic" onchange="uploadVideoPic('uploadVideoPic')" accept="image/jpeg, image/jpg, image/png">
                    </div>
                    <div class="other-cover">
                        <div class="other-cover-tip">&ensp;</div>
                        <div class="cover">
                            <img class="cover-img" onclick="addCover(this)" src="/images/upload/small-tv-logo.png" alt="bili_tv">
                        </div>
                        <div class="cover">
                            <img class="cover-img" onclick="addCover(this)" src="/images/upload/small-tv-logo.png" alt="bili_tv">
                        </div>
                        <div class="cover">
                            <img class="cover-img" onclick="addCover(this)" src="/images/upload/small-tv-logo.png" alt="bili_tv">
                        </div>
                        <div class="cover">
                            <img class="cover-img" onclick="addCover(this)" src="/images/upload/small-tv-logo.png" alt="bili_tv">
                        </div>
                    </div>
                </div>
                <br>
                <div class="section-title-container">
                    <p class="section-title-deg">*</p>
                    <h3 class="section-title-content-main">分区</h3>
                </div>
                <br>
                <div class="type-select-box">
                    <div class="type-font">选择一级分区：</div>
                    <select id="video_type_1" onchange="change(this)"></select>
                    <i></i>
                    <div class="type-font">选择二级分区：</div>
                    <select id="video_type_2"></select>
                </div>
                <div class="section-title-container">
                    <p class="section-title-deg">*</p>
                    <h3 class="section-title-content-main">标题</h3>
                </div>
                <div class="content-title-container">
                    <div class="input-box-instance">
                        <input type="text" id="upload-video-title" oninput="countWord()" maxlength="80" placeholder="请输入稿件标题" class="input-box-val">
                    </div>
                    <p class="input-box-max-tip">0/80</p>
                </div>
                <br>
                <div class="section-title-container">
                    <p class="section-title-deg"></p>
                    <h3 class="section-title-content-main">&ensp;标签</h3>
                    <p class="select-title-tips">（标签可自定义）</p>
                </div>
                <div class="content-title-container">
                    <div class="input-box-instance">
                        <input type="text" id="upload-video-tag" maxlength="80" placeholder="用空格隔开多个标签" class="input-box-val">
                    </div>
                </div>
                <br>
                <div class="section-title-container">
                    <h3 class="section-title-content-main">&ensp;简介</h3>
                </div>
                <div class="content-desc-container">
                    <textarea id="upload-video-desc" maxlength="2000" placeholder="请输入该视频的简介"></textarea>
                </div>
                <div class="upload-video">
                    <button id="upload-video-btn" onclick="submitVideoInfo()">立即投稿</button>
                </div>
            </div>
            <div id="upload-step3-container">
                <div class="step-controller-container">
                    <div id="upload-ok"></div>
                    <div class="step-ctrl-item">
                        <span class="step-ctrl-complete-content">&ensp;填写投稿信息</span>
                    </div>
                    <div class="step-ctrl-line step-ctrl-line-active"></div>
                    <div class="step-ctrl-item">
                        <span class="step-ctrl-active-icon">2</span>
                        <span class="step-ctrl-active-content">投稿审核中</span>
                    </div>
                    <div class="step-ctrl-line step-ctrl-line-wait"></div>
                    <div class="step-ctrl-item">
                        <span class="step-ctrl-wait-icon">3</span>
                        <span class="step-ctrl-wait-content">&ensp;完成</span>
                    </div>
                </div>
                <div class="upload-success-image">
                    <img src="/images/upload/upload-success.png" alt="upload_success">
                </div>
                <h3 class="upload-success-hint-1">稿件投递成功</h3>
                <div class="upload-success-url">
                    <a href="/video/managerVideo" target="_self" class="">查看稿件</a>
                    <a href="/video/uploadVideo" target="_self" class="">再投一个</a></div>
                <p class="upload-success-hint-2">若稿件没有立刻显示在列表中，请稍候片刻</p>
                <p class="upload-success-hint-3">稿件名称: </p>
                <br>
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