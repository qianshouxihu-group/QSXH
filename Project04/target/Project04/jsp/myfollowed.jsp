<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.collapse.js" ></script>

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
        <a href="">条件搜索</a>
        <a href="">智能匹配</a>
        <a href="">会员服务 </a>
        <a href="">活动专题 </a>
        <a href="">我的消息 </a>
        <a href="">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
            <div class="list-main1-title">个人中心</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="">基本资料</a></div>
                <div class="list-top"><a href="">择偶条件</a></div>
                <div class="list-top"><a href="">我的照片</a></div>
                <div class="list-top"><a href="MyFollowManager/getlist.action" class="cur">我的关注</a></div>
                <div class="css3-animated-example">
                    <h3>详情资料</h3>
                    <div>
                        <div class="content">
                            <p><a href="">工作学习</a></p>
                            <p><a href="">兴趣爱好</a></p>
                            <p><a href="">个性要求</a></p>
                        </div>
                    </div>
                </div>
                <div class="list-top"><a href="">关于举报</a></div>
                <div class="css3-animated-example">
                    <h3 style=" border-bottom: 0;">系统设置</h3>
                    <div>
                        <div class="content">
                            <p><a href="">密码修改</a></p>
                            <p><a href="">更换手机</a></p>
                        </div>
                    </div>
                </div>
            </div><!--menu-->
        </div><!--right-->
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;我的关注</div>
            <div class="safty">
                <%--<div class="tit">关注列表  >></div>--%>
                <ul class="success">
                    <c:forEach items="${requestScope.pageInfo.list}" var="followuser">
                        <form method="post">
                        <li>
                            <input type="hidden" value="${followuser.userid}" name="followedid">
                            <div class="success-text">
                                <a class="success-pic"><img src="images/test1.png"/></a>
                                <c:if test="${followuser.uonline==11}">
                                    <a >用户名：${followuser.uname} &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a style="color: #eb6877;"> 我在线上 </a></a>
                                    <p>&nbsp;</p>
                                    <p>
                                        <a href="javascript:void(0);" class="myfollow" style="color:#fff;" onclick="giveGood(this)">&nbsp; 发起聊天 &nbsp;</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </c:if>
                                <c:if test="${followuser.uonline==12}">
                                    <a >用户名：${followuser.uname} &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a style="color: #a0a0a0;"> 离线 </a></a>
                                    <p>&nbsp;</p>
                                    <p>
                                        <a class="myfollow" style="background: #959595;color:#fff;">&nbsp; 发起聊天 &nbsp;</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </c:if>
                                    <a href="javascript:void(0);" class="myfollow" style="color:#fff;" onclick="cancelFollow(this)">&nbsp; 取消关注 &nbsp;</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <c:if test="${followuser.fgood!=61}">
                                            <a href="javascript:void(0);" class="myfollow" style="color:#fff;" onclick="giveGood(this)">&nbsp; 喜欢 &nbsp;</a>
                                        </c:if>
                                </p>
                                <p>&nbsp;</p>
                                <p class="mem-text">&nbsp;${followuser.uage}&nbsp;岁&nbsp;|&nbsp;${followuser.uheight}&nbsp;CM&nbsp;|&nbsp;${followuser.conste}&nbsp;|&nbsp;月收入：&nbsp;${followuser.uincome}&nbsp;元</p>
                                <p><a href="javascript:void(0);" class="cf60">[查看详情]</a></p>
                            </div>
                        </li>
                        </form>
                    </c:forEach>

                </ul>
            </div>

            <div class="page">
                <a href="MyFollowManager/getlist.action?page=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="MyFollowManager/getlist.action?page=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                    <c:if test="${page==pageInfo.firstPage and page>1}">
                        <a href="MyFollowManager/getlist.action?page=1">1</a>
                        <c:if test="${page!=2}">
                            <span>...</span>
                        </c:if>
                    </c:if>
                    <c:if test="${page==pageInfo.pageNum}">
                        <a class="cur">${page}</a>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum}">
                        <a href="MyFollowManager/getlist.action?page=${page}">${page}</a>
                    </c:if>
                    <c:if test="${page<pageInfo.pages and page==pageInfo.lastPage}">
                        <c:if test="${page!=(pageInfo.pages-1)}">
                            <span>...</span>
                        </c:if>
                        <a href="MyFollowManager/getlist.action?page=${pageInfo.pages}">${pageInfo.pages}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="MyFollowManager/getlist.action?page=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="MyFollowManager/getlist.action?page=${pageInfo.pages}">末页</a>
            </div>

        </div><!--left-->
    </div>
    <div class="copy">
        <p>Copyright©2019   牵手西湖婚恋交友网   版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>
    <!--在线客服-->
    <div id="floatTools" class="rides-cs" style="height:246px;">
        <div class="floatL">
            <a id="aFloatTools_Show" class="btnOpen" title="查看在线客服" style="top:20px;display:block" href="javascript:void(0);">展开</a>
            <a id="aFloatTools_Hide" class="btnCtn" title="关闭在线客服" style="top:20px;display:none" href="javascript:void(0);">收缩</a>
        </div>
        <div id="divFloatToolsView" class="floatR" style="display: none;height:237px;width: 140px;">
            <div class="cn">
                <h3 class="titZx">牵手西湖在线客服</h3>
                <ul>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服1</span></li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a><span>客服2</span> </li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服3</span></li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服4</span></li>
                    <li style="border:none;"><span>电话：400-000-0000</span> </li>
                </ul>
            </div>
        </div>
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

    function giveGood(touser) {
        goodurl = "MyFollowManager/good.action";
        var toform = $(touser).parent().parent().parent().parent();
        $(toform).attr('action',goodurl);
        $(toform).submit();
    }

    function cancelFollow(touser) {
        cancelurl = "MyFollowManager/change.action";
        var toform = $(touser).parent().parent().parent().parent();
        $(toform).attr('action',cancelurl);
        $(toform).submit();
    }

    function chatApply(touser) {
        chaturl = "MyFollowManager/chat.action";
        var toform = $(touser).parent().parent().parent().parent();
        $(toform).attr('action',chaturl);
        $(toform).submit();
    }

    function getDetails(touser) {
        detailurl = "MyFollowManager/chat.action";
        var toform = $(touser).parent().parent().parent().parent();
        $(toform).attr('action',detailurl);
        $(toform).submit();
    }

</script>
</body>
</html>

