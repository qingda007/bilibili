
function upload() {
    var files = document.getElementById('upload-btn').files; //files是文件选择框选择的文件对象数组
    if(files.length == 0){
        files = document.getElementById('first-upload-btn').files;
        $("#upload-step1-container").css("display", "none");
        $("#upload-step2-container").css("display","block");
    }
    $("#progress-percent").html(0+"%");
    $("#progress-length").css("width", 0 + "%");
    var form = new FormData(),
        url = 'http://localhost:8888/video/upload', //服务器上传地址
        file = files[0];
    form.append('file', file);

    $("#item-title").text(file.name);
     var videoUrl = URL.createObjectURL(file);
     document.getElementById("get-video-time").src = videoUrl;


    var xhr = new XMLHttpRequest();
    xhr.open("post", url, true);
    //上传进度事件
    xhr.upload.addEventListener("progress", function(result) {
        if (result.lengthComputable) {
            //上传进度
            var percent = (result.loaded / result.total * 100).toFixed(2);
            $("#progress-percent").html(percent+"%");
            $("#progress-length").css("width", percent + "%");
            $('#progress-value').html('已上传 '+((result.loaded/1024/1024).toFixed(2))+'MB / '+((result.total/1024/1024).toFixed(2))+'MB');
        }
        if(result.loaded==result.total){
            $('#progress-value').html('上传完毕 ');
        }
    }, false);

    xhr.addEventListener("readystatechange", function() {
        var result = xhr;
        if (result.status != 200) { //error
            console.log('上传失败', result.status, result.statusText, result.response);
        }
        else if (result.readyState == 4) { //finished
            console.log('上传成功', result);
        }
    });
    xhr.send(form); //开始上传
}
function uploadVideoPic(){
    var files = document.getElementById('upload-video-pic').files; //files是文件选择框选择的文件对象数组
    if(files.length == 0) return;

    var form = new FormData(),
        url = 'http://localhost:8888/video/uploadVideoPic', //服务器上传地址
        file = files[0];
    form.append('cover', file);

    var xhr = new XMLHttpRequest();
    xhr.open("post", url, true);

    //上传进度事件
    xhr.upload.addEventListener("progress", function(result) {
        if (result.lengthComputable) {
            //上传进度
            var percent = (result.loaded / result.total * 100).toFixed(2);

        }
    }, false);

    xhr.addEventListener("readystatechange", function() {
        var result = xhr;
        if (result.status != 200) { //error
            console.log('上传失败', result.status, result.statusText, result.response);
        }
        else if (result.readyState == 4) { //finished
            console.log('上传成功', result);
        }
    });
    xhr.send(form); //开始上传
    //实例化FileReader API  
    var freader = new FileReader();
    freader.readAsDataURL(file);
    freader.onload = function(e) {
        $("#cover").attr("src",e.target.result);  //显示图片
    }
}

//用js读type1
window.onload=function()//用window的onload事件，窗体加载完毕的时候
{
    var video_type_1 = $('#video_type_1');//一级分区的select
    video_type_1.empty();
    $.ajax({//请求一级分区的数据
        url : 'http://localhost:8888/video/getAllType1',//后台数据地址
        success : function(result){
            $.each(result , function(i , item){
                var obj=document.getElementById('video_type_1');
                obj.add(new Option(item,item));
                if(i==0){
                    getType2(item);
                }
            })
        }
    });
};
//根据type1，返回type2
function change(el){//当一级分区变化的时候
    var video_type_2=$('#video_type_2');
    video_type_2.empty();
    var type1 = $(el).val();//这里得到选择的元素
    getType2(type1);
}
function getType2(type1) {
    $.ajax({
        url : 'http://localhost:8888/video/getType2ByType1',//后台数据地址
        data : {type1 : type1},//请求type1的数据
        success : function(result){
            $.each(result , function(i , item){
                var obj=document.getElementById('video_type_2');
                obj.add(new Option(item,item));
            })
        }
    });
}

//提交video的所有信息
function submitVideoInfo() {
    var videoTitle = document.getElementById('upload-video-title').value;
    var videoDesc = document.getElementById('upload-video-desc').value;
    var videoTag = document.getElementById("upload-video-tag").value;
    var type1 = $('#video_type_1 option:selected').text();//选中的文本
    var type2 = $('#video_type_2 option:selected').text();//选中的文本
    if($('#upload-video-pic').val().length==0){
        $('html,body').animate({scrollTop:$('.select-cover').offset().top}, 400);
        alert("您还未选择视频封面");
    }
    else if(videoTitle.length==0){
        $('#upload-video-title').style.border="1px solid red";
        $('html,body').animate({scrollTop:$('#video_type_2').offset().top}, 400);
        alert("标题不能为空");
    }
    else {
        if(videoDesc.length==0){
            videoDesc="暂无简介";
        }
        $.ajax({
            url : 'http://localhost:8888/video/uploadVideoInfo',//后台数据地址
            data : {
                userId : 1,
                videoTitle: videoTitle,
                videoDesc: videoDesc,
                statusAlias1: type1,
                statusAlias2: type2,
                tags: videoTag
            },//请求type1的数据
            success : function(data){
                // $("#upload-step2-container").css("display", "none");
                // $("#upload-step3-container").css("display","block");
            }
        });
    }
}

function countWord() {
    var number = $('#upload-video-title').val().length;
    $('.input-box-max-tip').html(number+"/80");
}
