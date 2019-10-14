<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="<%=basePath%>">
    <title>后台管理-登录</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="layui/css/login.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>

</head>
<body>
<div id="container">
    <img src="<%=path%>/images/timg.jpg" width="100%" height="100%" />
    <div class="admin-login-background">
        <!--<div class="admin-header">-->
        <!--<img src="image/ex_logo.png" class="admin-logo">-->
        <!--</div>-->


        <form class="layui-form" action="log/login2.action" method="post">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input type="text" name="uname" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="password"
                       placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <div>
                <input type="text" name="verifyCode"
                       placeholder="请输入验证码"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-verify">
                <img style="position: absolute;right: 0;top: 110px;"  src="log/getVerifyCode.action" width="110" height="34"
                     id="verifyCodeImage" onclick="javascript:changeImage();">
            </div>
            <button class="layui-btn admin-button" lay-submit lay-filter="formDemo">登陆</button>



        </form>
    </div>
</div>
<script src="layui/layui.all.js"></script>
<script>
    /*点击图片更换验证码事件*/
    var num = 1;
    function changeImage() {
        num = num + 1;
        $('#verifyCodeImage').attr('src', 'log/getVerifyCode.action?num='+num);
    }
</script>
</body>
<%
    if (request.getAttribute("log") == "log") {%>
<script>
    alert("请先登录!");
</script>
<%} else if (request.getAttribute("log") == "codeerror") {%>
<script>
    alert("验证码错误！");
</script>
<%} else if (request.getAttribute("log") == "lf") {%>
<script>
    alert("密码错误！");
</script>
<%}%>
</html>
