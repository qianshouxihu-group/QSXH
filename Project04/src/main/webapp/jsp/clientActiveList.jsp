<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网"/>
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>
    <script src="js/jquery-1.8.3.min.js"></script>

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
        <div class="main">
            <div class="main-box1">
                <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
                    <div class="list-main1-title">活动专题</div>
                    <div class="col c2"><!--menu-->
                        <div class="list-top"><a href="" >报名参加活动</a></div>
                        <div class="list-top"><a href="" class="cur">线下活动</a></div>
                        <div class="list-top" style="border-bottom: 0;"><a href="">正在进行的活动</a></div>
                    </div><!--menu-->
                </div><!--right-->
                <div class="main-left"><!--left-->
                    <div class="s-address">当前位置：<a href="">首页 </a>&gt; 活动专题 &gt; 线下活动</div>
                    <ul class="active" >
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/test2.png" />
                                <p>我们约会吧 </p>
                                <p>2015-11-13      地点：厦门市鼓浪屿</p>
                            </a>
                        </li>
                    </ul>

                </div><!--left-->
            </div>
        <div class="login-right"></div>
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
</body>
</html>

