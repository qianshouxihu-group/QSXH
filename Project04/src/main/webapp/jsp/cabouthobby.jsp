<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" import ="java.util.*,com.qsxh.entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link type="text/css" rel="stylesheet" href="css/jquery-labelauty.css"/>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-labelauty.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.collapse.js" ></script>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>

    <style>
        ul { list-style-type: none;}
        li { display: inline-block;}
        li { margin: 10px 0;}
        input.labelauty + label { font: 12px "Microsoft Yahei";}
    </style>
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
    <div class="main-box1">
        <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
            <div class="list-main1-title">个人中心</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="personalManager/myHomePage.action">我的主页</a></div>
                <div class="list-top"><a href="personalManager/myPhotograph.action">我的照片</a></div>
                <div class="list-top"><a href="MyFollowManager/getlist.action">我的关注</a></div>
                <div class="list-top"><a href="personalManager/aboutBasic.action">基本资料</a></div>
                <div class="list-top"><a href="personalManager/aboutCP.action">择偶条件</a></div>
                <div class="css3-animated-example">
                    <h3 class="cur">详情资料</h3>
                    <div>
                        <div class="content">
                            <p><a href="personalManager/aboutWS.action">工作学习</a></p>
                            <p><a href="personalManager/aboutHabit.action">兴趣爱好</a></p>
                            <p><a href="personalManager/aboutLimit.action">个性要求</a></p>
                        </div>
                    </div>
                </div>
                <div class="css3-animated-example">
                    <h3 style=" border-bottom: 0;">系统设置</h3>
                    <div>
                        <div class="content">
                            <p><a href="<%=basePath%>jsp/crepassword.jsp">密码修改</a></p>
                        </div>
                    </div>
                </div>
            </div><!--menu-->
        </div><!--right-->
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;详细资料</div>
            <div class="safty">
                <div class="tit">兴趣爱好  >></div><br/>
                <form action="personalManager/updateHabit.action" method="post">
                    <ul class="dowebok">
                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="运动"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='1'}">
                        <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>
                        </P>

                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="音乐"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='2'}">
                                <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>
                        </P>

                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="影视"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='3'}">
                                <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>

                        </P>

                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="美食"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='4'}">
                                <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>
                        </P>

                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="游戏"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='5'}">
                                <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>
                        </P>

                        <P>
                        <li><input type="checkbox"  disabled checked data-labelauty="文学"></li>
                        <c:forEach items="${requestScope.habitItem}" var="hitem">
                            <c:if test="${hitem.tyid =='6'}">
                                <li><input type="checkbox" name="habits" data-labelauty="${hitem.hname}" value="${hitem.hid}"></li>
                            </c:if>
                        </c:forEach>
                        </P>

                    </ul>
                    <div class="btn-box">
                        <input type="submit" class="save-btn" value="保存并继续">
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>

    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有</p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>

</div>

<script>
    $(".css3-animated-example").collapse({
        accordion: true,
        open: function() {
            this.addClass("open");
            this.css({ height: this.children().outerHeight() });
        },
        close: function() {
            this.css({ height: "0px" });
            this.removeClass("open");
        }
    });
    $(function(){
        $(':input').labelauty();
    });

    $(function () {
        <c:forEach items="${requestScope.userHabit}" var="uhabit">
        $("input[value='${uhabit.hid}']").attr("checked","checked");
        </c:forEach>
    })

</script>
</body>
</html>


