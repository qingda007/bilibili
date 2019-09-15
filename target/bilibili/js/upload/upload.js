function upload() {
    var files = document.getElementById('upload-btn').files; //files是文件选择框选择的文件对象数组
    if(files.length == 0) return;

    var form = new FormData(),
        url = 'http://localhost:8888/video/upload', //服务器上传地址
        file = files[0];
    form.append('file', file);

    var xhr = new XMLHttpRequest();
    xhr.open("post", url, true);

    //上传进度事件
    xhr.upload.addEventListener("progress", function(result) {
        if (result.lengthComputable) {
            //上传进度
            var percent = (result.loaded / result.total * 100).toFixed(2);
            $("#progress-value").html(percent+"%");
            $("#progress-length").css("width", percent + "%");
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


//用js读取数据，然后生成代码
//根据type1，读取数据，然后返回
function getData(type1 , callback){
    $.ajax({
        url : 'http://localhost:8888/video/upload',//后台数据地址
        data : {type1 : type1},//请求type1的数据
        success : function(result){
            alert(result);
            callback(result);
        }
    })
}

function renderOptions(arr , el){//生成select 的 option
    el.empty();
    $.each(data , function(index , item){
        $('<option/>').attr({
            value : item.id
        }).html(item.name).appendTo(el);
    })
}

var department = $('#department');//系的select
getData(0 , function(data){//请求系的数据
    department.empty();
    renderOptions(data , department);//这里生成系的select
});

var professional = $('#professional');//专业的select
function change(el){//当系变化的时候
    var type1 = $(el).val();//这里得到选择的元素
    getData(type1 , function(data){
        professional.empty();
        renderOptions(data , professional );//这里生成专业的select
    });
}