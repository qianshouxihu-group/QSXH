<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>会员服务中心</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网"/>
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-right">
            <c:choose>
                <c:when test="${ sessionScope.user!=null }">
                    <a>${ sessionScope.user.uname },欢迎您！</a>|
                    <a href="testManager/outLogin.action">注销</a>
                </c:when>
                <c:otherwise>
                    <a href="<%=path%>/jsp/clientReg.jsp">注册</a> |
                    <a href="<%=path%>/jsp/login.jsp">登录</a>
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
        <a href="matchUser/matchByTime.action?limitString=12">网站首页</a>
        <a href="jsp/clientAboutUs.jsp">了解我们</a>
        <a id="searchUser" href="matchUser/smartMatch.action?limitString=30&usex=${user.usex}&condition=charm">条件搜索</a>
        <a href="matchUser/smartUser.action?id=${sessionScope.user.userid}&roleid=${sessionScope.user.roleid}">智能匹配</a>
        <a href="jsp/beVip.jsp">会员服务 </a>
        <a href="jsp/clientActiveList.jsp">活动专题 </a>
        <a href="<%=path%>/informManager/systemInform.action">我的消息 <div class="my-notice">${countList.get(0)+countList.get(1)+countList.get(2)+countList.get(3)}</div></a>
        <a href="personalManager/aboutBasic.action">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1" style="width:1200px; height:600px;">

        <div class="login-right">
            <div class="list-main1-title">会员服务</div>
            <div class="col c2"><!--menu-->
                <div class="list-top">
                    <a href="<%=path%>/jsp/beVip.jsp">
                        <label style="color: red;">会员管理</label>&nbsp;<div class="my-notice">${countList.get(0)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/AccountAction/arec.action">
                        <label>充值记录</label>&nbsp;<div class="my-notice">${countList.get(0)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/AccountAction/grec.action">
                        <label>消费记录</label>&nbsp;<div class="my-notice">${countList.get(1)}</div>
                    </a>
                </div>

            </div>

        </div><!--menu-->

        <div class="s-address">会员服务中心</div>
        <form action="AccountAction/bevip2.action" method="post">

        <div class="main-box1" style="width:800px; height:400px; ">
            <c:choose>
                <c:when test="${ roleid eq '4'}">
                    <span>尊敬的用户 ${sessionScope.userBase.uname}，您的身份是 ${role}</span>
                </c:when>

                <c:otherwise>
                    <span>尊敬的用户 ${sessionScope.userBase.uname}，您的身份是 普通用户</span>
                </c:otherwise>
            </c:choose>
<br><br><br><br><br><br><br>
            <li>
                <span>

                                <c:choose>
                                    <c:when test="${ roleid eq '4'}">
<%--                                        <a>${ sessionScope.userBase.uname },欢迎您！</a>|--%>
<%--                                        <a href="testManager/outLogin.action">注销</a>--%>
                                        <h1>您已经是我们的尊贵的VIP会员，请尽情的享受本站为您带来的便利</h1>
                                    </c:when>
                                    <c:otherwise>
                                        <h1>开通VIP，立享查看对方相册，发起约会，在线聊天，多条件搜寻您的一种人的功能！</h1><br><br><br>

                                        <label><input type="radio" name="vip" value="1"  onchange="hiddenXX()" >开通1个月（100金币）</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br>
                                        <label><input type="radio" name="vip" value="2"  onchange="hiddenXX()"  >开通6个月（500金币）</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:otherwise>
                                </c:choose>
                </span>
            </li>
            <br><br><br><br><br><br><br>
            <div class="btn-box" id="ok" hidden="hidden">
                <button class="save-btn"  onClick="document.myForm.submit();">确认开通</button>
            </div>

        </div>
        </form>
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
    <script type="text/javascript">
        function hiddenXX(){
            $("#ok").show();
        }
    </script>
</div>
</body>

<%
    if (request.getAttribute("flog") == "success") {%>
<script>
    alert("购买VIP成功!");
</script>
<%} else if (request.getAttribute("flog") == "nomoney") {%>
<script>
    alert("金币不足，请充值");
</script>
<%} else if (request.getAttribute("flog") == "error") {%>
<script>
    alert("网络错误");
</script>
<%}%>

</html>

