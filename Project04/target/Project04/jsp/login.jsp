<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>牵手西湖-登录</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网"/>
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <style>
        .main-log{ height: 280px; width: 350px; margin-bottom: 30px; background: #fff;}
        .main-logbox{ width: 300px;}
        .main-user-input{ width: 270px;}
        .main-log .tit{ height: 50px; line-height: 50px; font-size: 24px;}
        .login-left{ width: 650px;}
        .login-left img{ margin: 20px 0px 0px 200px;}
        .main-btn,.main-pass-text{ width: 300px;}
    </style>
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-right">

            <c:choose>
                <c:when test="${ sessionScope.user!=null }">
                    <a>${ sessionScope.user.uname },欢迎您！</a>|
                    <a href="testManager/outLogin.action">注销</a>
                </c:when>
                <c:otherwise>
                    <a href="">注册</a> |
                    <a href="">登录</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="top-ban">
        <div class="top-mid-box">
            <a href="" class="logo"><img src="images/logo.png"/></a>
            <div class="adv"><img src="images/adv.png"/></div>

        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="">网站首页</a>
        <a href="">了解我们</a>
        <a href="">搜索会员 </a>
        <a href="">婚恋课堂 </a>
        <a href="">活动专题 </a>
        <a href="">婚恋故事</a>
        <a href="">联系社区工作人员</a>
        <a href="">个人中心</a>
    </div>
</div>

<div class="main">
  <form action="log/login.action" method="post">
    <div class="main-box1">
        <div class="login-left"><img src="images/loginpic.png"/></div>
        <div class="login-right">
            <img src="images/mmlogo.png"  style="margin-left: 30px;"/>
            <div class="main-log">
                <div class="tit">请您登录</div>

                <div class="main-logbox">
                    <i class="main-user"></i>
                    <input placeholder="账户名" type="text"  name="uname" class="main-user-input">
                </div>
                <div class="main-logbox">
                    <i class="main-password"></i>
                    <input placeholder="密码" type="password"  name="password" class="main-user-input">
                </div>
                <%--验证码放置处--%>
                <div class="main-logbox">
                    <i class="fa fa-picture-o"></i>
                    <input class="main-user-input"  type="text" id="verifyCode" name="verifyCode" placeholder="验证码" maxlength="4">
                    <img style="position: absolute;right: 0;top: -10px;"  src="log/getVerifyCode.action" width="110" height="34" id="verifyCodeImage" onclick="javascript:changeImage();">
                </div>

                <button type="submit" class="main-btn">立即登录</button>
                <div class="main-pass-text">没有帐号？<a href="">免费注册</a><a href="" class="forget">忘记密码 &gt;</a></div>
            </div>
        </div>
    </div>
  </form>


    <div class="nav-box">
        <div class="nav">
            <a href="">网站首页</a>
            <a href="">了解我们</a>
            <a href="">搜索会员 </a>
            <a href="">婚恋课堂 </a>
            <a href="">活动专题 </a>
            <a href="">婚恋故事</a>
            <a href="">联系社区工作人员</a>
            <a href="">个人中心</a>
        </div>
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
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