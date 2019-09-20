
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>用户注册 - 哔哩哔哩</title>
    <link rel="shortcut icon" href="/images/main/bilibili.ico">
    <base href="/">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/register/jquery.validate.min.js"></script>
    <script src="js/register/jquery-validation-1.14.0-min.js"></script>
    <link href="css/login/login.css" rel="stylesheet">
    <link href="css/register/register.css" rel="stylesheet">
    <script>
        // 手机号码验证
        jQuery.validator.addMethod("mobile", function(value, element) {
            var length = value.length;
            var mobile =  /^1(3|4|5|7|8)\d{9}$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误");

        $(function () {
            //让当前表单调用validate方法，实现表单验证功能
            $("#form").validate({
                //失去焦点时才触发请求
                rules:{
                    userName:{
                        //必填，如果u安正方法不需要参数，则配置为true
                        required:true,
                        rangelength:[6,12]
                    },
                    userPassw:{
                        required:true,
                        minlength: 5
                    },
                    userTele:{
                        required:true,
                        mobile:true
                    },
                    userEmail:{
                        required:true,
                        email:true
                    },
                    code:{
                        required:true,
                        rangelength:[4,4]
                    }
                },
                messages:{
                    userName:{
                        required:"请输入用户名",
                        rangelength:$.validator.format("用户名长度在必须为：6-12 之间"),
                    },
                    userPassw:{
                        required:"请输入密码",
                        minlength: "密码长度不能小于 5 个字母"

                    },
                    userTele:{
                        required:"请输入电话号码"

                    },
                    userEmail:{
                        required:"请填写邮件",
                        email:"邮箱格式不正确"
                    },
                    code:{
                        required:"请先获得验证码"
                    }
                }
            });
            //当点击获取验证码，将手机号传到后端,并开始计时
            $("#button").click(function () {
                var backTime = 60;
                setTime();

                function setTime() {
                    if (backTime == 0) {
                        $("#button").removeAttr("disabled");
                        $("#button").css("background-color","#00a1d6");
                        $("#button").val("点击获取").css("color","#ffffff");
                    } else {
                        $("#button").attr("disabled", true).css("background-color","#dddddd");
                        $("#button").val(backTime + "秒").css("color","#555555");
                        backTime--;

                        setTimeout(function () {
                            setTime();}, 1000)
                    }
                }
                $.ajax({
                    url:"http://localhost:8888/user/getcode",
                    type:"post",
                    dataType:"json",
                    data:{"phone":$("#userTele").val()},
                    success:function (data) {
                        if(data == 0){
                            $("#button").attr("disabled", true);
                        }
                    }
                })
            });



            //从验证码移开始检验
            $("#code").blur(function () {
                $.ajax({
                    url:"http://localhost:8888/user/comparecode",
                    type:"post",
                    dataType:"json",
                    data:{"preauthcode":$("#code").val()},
                    success:function (data) {
                        if(data == 2){
                            error("请输入正确的验证码哦！")
                        }
                    }
                })
            })

        // ajax将验证码传入后端
        });






        //选中复选框才能点击注册
        function terms(){
            if($("input[type='checkbox']").is(':checked'))
            {
                $("#submit").attr("disabled",false).css("background-color","#00a1d6").css("color","#fff").css("cursor","pointer");
            }else{
                $("#submit").attr("disabled",true).css("background-color","#f5f5f5").css("color","#555555").css("cursor","not-allowed")
            }
        }


    </script>
</head>
<body>
<div id="app">
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
    <!--            注册二字-->
    <div class="title-line">
        <span class="tit" style="font-size: 38px;">注册</span>
    </div>
    <!--            注册内容-->
    <div class="register-container">
        <form id="form" method="post" action="${pageContext.request.contextPath}/user/doRegister">
            <!--         昵称       -->
            <div class="form-group">
                <div class="el-input">
                    <input type="text"  autocomplete="off" id="userName" name="userName" placeholder="昵称" class="el-input_inner " >
                </div>

            </div>
            <div class="register-hidden-group"></div>
            <!--         密码    -->
            <div class="form-group">
                <div class="el-input" >
                    <input type="password"  autocomplete="off" id="userPassw" name="userPassw" placeholder="密码（6-16个字符组成，区分大小写）" class="el-input_inner">
                </div>

            </div>
            <div class="register-hidden-group"></div>
            <!--       手机号码      -->
            <div class="form-group">
                <div class="el-input">
                    <input type="text"  autocomplete="off" id="userTele" name="userTele" placeholder="填写常用手机号" class="el-input_inner">
                </div>

            </div>
            <div class="register-hidden-group"></div>
            <!--       邮箱      -->
            <div class="form-group">
                <div class="el-input">
                    <input type="email" autocomplete="off" id="userEmail" name="userEmail" placeholder="填写常用邮箱" class="el-input_inner">
                </div>

            </div>
            <div class="register-hidden-group"></div>
            <!--       短信验证      -->
            <div class="form-group back-fff">
                <div class="el-input">
                    <input type="text" id="code" name="code" autocomplete="off" placeholder="请输入短信验证码" class="el-input_inner">
                </div>
                <input type="button" id="button" class="el-button yzm-buttom el-button--primary1"  value="点击获取">
                <div id="captchCheck" class="check" style="display: none;">
                </div>

            </div>
            <!--      同意协议          -->
            <div class="form-group">
                <label class="register-agree">
                    <label >
                        <input name="agree" type="checkbox" onclick="terms()">
                    </label>我已同意
                    <a>《哔哩哔哩弹幕网用户使用协议》</a>
                    和<a>《哔哩哔哩隐私政策》</a>
                </label>
            </div>
            <!--        点击注册        -->
            <div class="form-group">
                <input  type="submit"  id="submit" class="el-button btn-full el-button--primary " value="注册" style="cursor: not-allowed" >
            </div>
            <div class="register-hidden-group text-right">
                <a href="/user/toLogin" style="font-size: 12px" >已有账号，直接登录</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>