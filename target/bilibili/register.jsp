
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>哔哩哔哩</title>
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
                $("#submit").attr("disabled",false).css("background-color","#00a1d6");
            }else{
                $("#submit").attr("disabled",true).css("background-color","#f5f5f5")
            }
        }


    </script>
</head>
<body>
<div id="app">
    <!--            头部header-->
    <div class="bili-header-m">
        <div class="nav-menu">
            <div class="nav-mask"></div>
            <div class="nav-wrapper bili-wrapper">
                <!--          header左边      -->
                <div class="fl">
                    <ul>
                        <li class="nav-item">
                            <a title="主站" >
                                <i id="tv" ></i><span class="tc">主站</span>
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="来探索bilibili音乐的世界吧~" class="t">音频</a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="游戏中心" class="t">游戏中心
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="直播" class="t">直播
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="会员购" class="t">会员购
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="漫画" class="t">漫画
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="BW" class="t">BW
                            </a>
                        </li>
                        <li class="nav-item mbili">
                            <a title="70年" class="t">70年
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a title="下载APP">
                                <i id="ph"></i><span class="tc">下载APP</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!--          header右边      -->
                <div class="up-load fr">
                    <a class="u-link">投稿</a>
                </div>
                <div class="fr">
                    <ul>
                        <li class="nav-item profile-info">
                            <a class="t">
                                <div class="i-face">
                                    <img src="images/login/akari.jpg" class="face">
                                </div>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="t">动态</a>
                        </li>
                        <li class="nav-item">
                            <a class="t">历史</a>
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
                    <input type="text"  autocomplete="off" id="userName" name="userName" placeholder="昵称" class="el-input_inner" >
                </div>
                <p class="error-message">请告诉我你的昵称吧</p>
            </div>
            <div class="register-hidden-group"></div>
            <!--         密码    -->
            <div class="form-group">
                <div class="el-input" >
                    <input type="password" autocomplete="off" id="userPassw" name="userPassw" placeholder="密码（6-16个字符组成，区分大小写）" class="el-input_inner">
                    <lable class="error-message">密码不能小于6个字符</lable>
                </div>
                <lable class="error-message error" id="userPassw-error">密码不能小于6个字符</lable>
            </div>
            <div class="register-hidden-group"></div>
            <!--       手机号码      -->
            <div class="form-group">
                <div class="el-input">
                    <input type="text" autocomplete="off" id="userTele" name="userTele" placeholder="填写常用手机号" class="el-input_inner">
                </div>
                <p class="error-message">手机号格式错误</p>
            </div>
            <div class="register-hidden-group"></div>
            <!--       邮箱      -->
            <div class="form-group">
                <div class="el-input">
                    <input type="email" autocomplete="off" id="userEmail" name="userEmail" placeholder="填写常用邮箱" class="el-input_inner">
                </div>
                <p class="error-message">请填写正确的邮箱</p>
            </div>
            <div class="register-hidden-group"></div>
            <!--       短信验证      -->
            <div class="form-group back-fff">
                <div class="el-input">
                    <input type="text" id="code" name="code" autocomplete="off" placeholder="请输入短信验证码" class="el-input_inner">
                </div>
                <div id="captchCheck" class="check" style="display: none;">
                </div>
                <input type="button" id="button" class="el-button yzm-buttom el-button--primary1"  value="点击获取">
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
                <input  type="submit"  id="submit" class="el-button btn-full el-button--primary " value="注册">
            </div>
            <div class="register-hidden-group text-right">
                <a href="/login.html" style="font-size: 12px" >已有账号，直接登录</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>