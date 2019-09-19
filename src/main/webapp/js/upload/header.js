$(function () {
    $("#face").attr("src","/images/main/akari.jpg");
    //用户信息显示
 //   var id=1;
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
                $("#face").attr("src",img);
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