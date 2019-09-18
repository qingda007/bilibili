<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/18
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            var type1={"type1":'动画'};
            $.ajax({
                url:"/typeCount",
                type:"post",
                dataType:"text",
                data:str,
                success: function (data) {
                    alert(data);

                },
                error:function () {
                    alert("失败");
                }
            })
        })
    </script>
</head>
<body>

</body>
</html>
