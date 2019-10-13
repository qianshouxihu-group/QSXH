<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>找回密码</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网"/>
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-right">

            <c:choose>
                <c:when test="${ sessionScope.userBase!=null }">
                    <a>${ sessionScope.userBase.uname },欢迎您！</a>|
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
            <a href="" class="logo"><img src="<%=basePath%>images/logo.png"/></a>
            <div class="adv"><img src="<%=basePath%>images/adv.png"/></div>

        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="">网站首页</a>
        <a href="">条件搜索</a>
        <a href="">智能匹配</a>
        <a href="">我的关注</a>
        <a href="">个人中心</a>
        <a href="">我的消息</a>
        <a href="">会员服务</a>
        <a href="">活动专题</a>
    </div>
</div>
<div class="main">
    <div class="main-box1" style="width:1200px; height:600px;">
        <div class="s-address">找回密码</div>
        <div class="main-box1" style="width:800px; height:400px; ">

            <span>请输入您的登录账号（手机号）！</span><br><br><br><br><br><br><br>
            <li>
                <span>请输入手机号:</span>
                <input type="text" class="conditon-select" id="userid" />
                <button class="save-btn" style="float: none"  id='getcode'   >获取验证码</button>
            </li>
            <br><br>
            <li>
                <span>请输入验证码:</span>
                <input type="text" class="conditon-select" name="code" id="code" />
            </li>
            <br><br><br><br><br><br><br>
            <div class="btn-box">
                <button class="save-btn"  onClick="SubCode()"  >确认重置密码</button>
            </div>


        </div>
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>

<script type="text/javascript">

    function SubCode() {
        if (confirm("确定将密码重置为123456吗？")) {
            var code = document.getElementById("code").value;
            if(null!=code&&""!=code)
            {
                $.ajax({
                    type : "GET",
                    contentType : 'application/json;charset=UTF-8',
                    data : {"code" : code },
                    url : "testManager/checkcode.action",
                    dataType:"json",
                    success : function(data) {
                        if(data.msg == "success")
                        {
                            alert("验证成功，您的密码已重置为123456，为了您的个人安全请尽快到个人资料修改新密码");
                            window.location.href="jsp/login.jsp";
                        }else if(data.msg == "fail"){
                            alert("验证失败！请输入正确验证码");
                        }
                    }
                });
            }else {
                alert("请输入验证码！");
            }

        }




    }
</script>
<script>

    var waitTime = 60;
    document.getElementById("getcode").onclick = function() {
        var userid = document.getElementById("userid").value;
        var test = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;/*正则表达式*/
        if(!test.test(userid))
        {
            alert("输入的登录账号格式不正确！");
        }else {
            $.ajax({
                type : "GET",
                contentType : 'application/json;charset=UTF-8',
                data : {"userid" : userid },
                url : "testManager/sendcode.action",
                dataType:"json",
                success : function(data) {
                    if(data.msg == "success")
                    {
                        alert("验证码已发送，请将收到的验证码输入下框内！");
                        /*跳转到首页或者提示完善资料页*/
                    }else if(data.msg == "fail"){
                        alert("验证码发送失败！请检查网络");
                    }
                }

            });

        }

        time(this);
    }
    function time(ele) {

        if (waitTime == 0) {
            ele.disabled=false;
            ele.innerHTML = "获取验证码";
            waitTime = 60;// 恢复计时

        } else {
            ele.disabled=true;
            ele.innerHTML = waitTime + "秒后可以重新发送";
            waitTime--;
            setTimeout(function() {
                time(ele)// 关键处-定时循环调用
            }, 1000)
        }
    }
</script>
</body>
</html>

