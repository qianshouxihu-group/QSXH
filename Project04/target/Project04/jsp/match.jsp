<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/MatchUser.css" type="text/css" />
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
            <a href="" class="logo"><img src="images/logo.png"/></a>
            <div class="adv"><img src="images/adv.png"/></div>

        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="matchUser/matchByTime.action?limitString=12&userid=${sessionScope.user.userid}">网站首页</a>
        <a href="jsp/clientAboutUs.jsp">了解我们</a>
        <a id="searchUser" href="matchUser/smartMatch.action?limitString=30&usex=${sessionScope.user.usex}&condition=charm&userid=${sessionScope.user.userid}">条件搜索</a>
        <a id="match"  href="matchUser/smartUser.action?id=${sessionScope.user.userid}&roleid=${sessionScope.user.roleid}">智能匹配</a>
        <a href="jsp/beVip.jsp">会员服务 </a>
        <a href="jsp/clientActiveList.jsp">活动专题 </a>
        <a href="<%=path%>/informManager/systemInform.action">我的消息 <div class="my-notice">${countList.get(0)+countList.get(1)+countList.get(2)+countList.get(3)}</div></a>
        <a href="personalManager/aboutBasic.action">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <div class="bodyCon08">
            <div class="students">

                <div id="four_flash">
                    <div class="flashBg">
                        <ul class="mobile">
                            <c:if test="${!empty MatchList || MatchList != null}">
                                <c:forEach items="${MatchList}" var="list">
                                    <c:if test="${list.condition != 'notMember'}">
                                        <li>
                                            <img src="images/test.png" />
                                            <dd>${list.uname}</dd>
                                            <p>匹配指数：${list.count}</p>
                                            <a href="<%=path%>/personalManager/showTaInforn.action?taId=${list.userid}" title="查看详细资料"></a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <div class="but_left"><img src="images/qianxleft.png" /></div>
                    <div class="but_right"><img src="images/qianxr.png" /></div>
                </div>

            </div>
        </div>
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    <c:forEach items="${MatchList}" var="list">
        <c:if test="${list.condition == 'notMember'}">
            alert("您不是会员，无法进行智能匹配！！！");
        history.go(-1);
        </c:if>
    </c:forEach>
    <c:if test="${empty MatchList || null == MatchList}">
        alert("资料未完善，请尽快完善择偶要求！！！");
        history.go(-1);
    </c:if>
    var _index5=0;

    $("#four_flash .but_right img").click(function(){
        _index5++;
        var len=$(".flashBg ul.mobile li").length;
        if(_index5+5>len){
            $("#four_flash .flashBg ul.mobile").stop().append($("ul.mobile").html());
        }
        $("#four_flash .flashBg ul.mobile").stop().animate({left:-_index5*326},1000);
    });

    $("#four_flash .but_left img").click(function(){
        if(_index5==0){
            $("ul.mobile").prepend($("ul.mobile").html());
            $("ul.mobile").css("left","-1380px");
            _index5=6
        }
        _index5--;
        $("#four_flash .flashBg ul.mobile").stop().animate({left:-_index5*326},1000);
    });
</script>
</body>
</html>

