<%--
  Created by IntelliJ IDEA.
  User: gosick39
  Date: 2019/9/14
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <title>上传视频</title>
    <link rel="stylesheet" href="css/upload/upload_step1.css" type="text/css">
    <link rel="stylesheet" href="css/upload/upload_step2.css" type="text/css">
    <link rel="stylesheet" href="css/upload/upload_step3.css" type="text/css">
    <script src="js/upload/upload.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
    <div id=app>
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
                    <video controls="controls" id="get-video-time" ></video>
                </div>
            </div>
        </div>
        <div class="upload-btn-container">
            <input type="file" class="upload-btn" id="upload-btn" onchange="upload()" accept="video/mp4">
            <div class="upload-btn-title">上传视频</div>
        </div>
        <div class="basic-info"><h1>基本信息</h1></div>
        <div class="select-cover">
            <h3>视频封面设置</h3>
            <p>（格式jpeg、png，文件大小≤5MB，建议尺寸≥1146*717，最低尺寸≥960*600）</p>
        </div>
        <div class="cover-preview">
            <div class="cover-preview-default">
                <img id="cover" src="images/upload/small-tv-logo.png" alt="bili_tv">
                <span class="cover-upload-tip">上传封面</span>
                <input type="file" id="upload-video-pic" onchange="uploadVideoPic()" accept="image/jpeg, image/jpg, image/png">
            </div>
            <div class="other-cover">
                <div class="other-cover-tip">&ensp;</div>
                <div class="cover">
                    <img class="cover-img" onclick="addCover(this)" src="images/upload/small-tv-logo.png" alt="bili_tv">
                </div>
                <div class="cover">
                    <img class="cover-img" onclick="addCover(this)" src="images/upload/small-tv-logo.png" alt="bili_tv">
                </div>
                <div class="cover">
                    <img class="cover-img" onclick="addCover(this)" src="images/upload/small-tv-logo.png" alt="bili_tv">
                </div>
                <div class="cover">
                    <img class="cover-img" onclick="addCover(this)" src="images/upload/small-tv-logo.png" alt="bili_tv">
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
            <p class="section-title-deg">*</p>
            <h3 class="section-title-content-main">标签</h3>
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
        <div class="upload-step-3-container-v2">
            <div class="step-controller-v2-container">
                <div class="step-ctrl-item">
                    <span class="step-ctrl-complete-icon iconfont icon-duihao"></span>
                    <span class="step-ctrl-complete-content">填写投稿信息</span>
                </div>
                <div class="step-ctrl-line step-ctrl-line-active"></div>
                <div class="step-ctrl-item">
                    <span class="step-ctrl-active-icon">2</span>
                    <span class="step-ctrl-active-content">投稿审核中</span>
                </div>
                <div class="step-ctrl-line step-ctrl-line-wait"></div>
                <div class="step-ctrl-item">
                    <span  class="step-ctrl-wait-icon">3</span>
                    <span class="step-ctrl-wait-content">完成</span>
                </div>
            </div>
            <div class="upload-3-v2-success-image">
                <img src="//s2.hdslb.com/bfs/static/studio-upload-v3/static/img/success-2233.0a1bf03.png" alt="upload_success_2">
            </div> <h3 class="upload-3-v2-success-hint-1">稿件投递成功</h3>
            <div class="upload-3-v2-success-split"></div>
            <div class="upload-3-v2-success-go-url">
                <a href="//member.bilibili.com/v2#/upload-manager/article" target="_self" class="">查看稿件</a>
                <a href="https://member.bilibili.com/video/upload.html" target="_self" class="">再投一个</a></div>
            <p class="upload-3-v2-success-hint-2">若稿件没有立刻显示在列表中，请稍候片刻</p>
            <p class="upload-3-v2-success-hint-3">稿件名称:big_buck_bunny</p>
            <div class="upload-3-v2-follow"><p class="upload-3-v2-follow-title">想要了解更多创作资讯，关注我们的官方账号吧～</p>
                <div class="upload-3-v2-follow-account">
                    <a href="https://space.bilibili.com/37090048/#/" target="_blank">
                        <div class="upload-3-v2-follow-avatar">
                            <img alt="官方账号头像" src="//i2.hdslb.com/bfs/face/01365904ffb64d1858da7e20e1040b9f2d94165d.jpg" class="upload-3-v2-follow-avatar-pic">
                            <img alt="闪电标志" src="" class="upload-3-v2-follow-avatar-cert"></div>
                        <span class="upload-3-v2-follow-name">哔哩哔哩创作中心</span>
                    </a>
                </div>
                <div class="upload-3-v2-follow-btn follow">
                    <i class="iconfont icon-ic_add"></i>
                    <span>关注</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>