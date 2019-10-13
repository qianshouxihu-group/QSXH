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
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-right">
            <a href="">注册</a> |
            <a href="">登录</a>
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
        <a href="matchUser/matchByTime.action?limitString=12">网站首页</a>
        <a href="">了解我们</a>
        <a href="matchUser/smartMatch.action?limitString=30&usex=女">条件搜索</a>
        <a href="matchUser/smartUser.action?id=1001">智能匹配</a>
        <a href="">会员服务 </a>
        <a href="">活动专题 </a>
        <a href="">我的消息 </a>
        <a href="">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <!--<div class="login-left"><img src="images/loginpic.png"/></div> -->
        <div class="bodyCon08">
            <div class="students">

                <div id="four_flash">
                    <div class="flashBg">
                        <ul class="mobile">
                            <c:forEach items="${MatchList}" var="list">
                                <li>
                                    <img src="images/test.png" />
                                    <dd>${list.uname}</dd>
                                    <p>匹配指数：${list.count}</p>
                                    <a href="" title="查看详细资料"></a>
                                </li>
                            </c:forEach>
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

