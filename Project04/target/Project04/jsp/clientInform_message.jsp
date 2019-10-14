<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>td {white-space:nowrap;overflow:hidden;text-overflow: ellipsis;}</style>

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
        <!--<div class="login-left"><img src="images/loginpic.png"/></div> -->
        <div class="login-right">
            <div class="list-main1-title">我的消息</div>
            <div class="col c2"><!--menu-->
                <div class="list-top">
                    <a href="<%=path%>/informManager/systemInform.action">
                        <label>系统消息</label>&nbsp;<div class="my-notice">${countList.get(0)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/activeInform.action">
                        <label>活动消息</label>&nbsp;<div class="my-notice">${countList.get(1)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/messageInform.action">
                        <label style="color: red;">我的留言</label>&nbsp;<div class="my-notice">${countList.get(2)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/datingInform.action">
                        <label>我的约会</label>&nbsp;<div class="my-notice">${countList.get(3)}</div>
                    </a>
                </div>
            </div>

        </div><!--menu-->
        <%--===============================消息列表=======================================--%>
        <div style="float: right ; width: 75% ;" id="tableAndPageInfo">
            <div style="height: 200px;" id="table">
                <table class="table table-hover" style="table-layout: fixed;">
                        <tr>
                            <th>标题</th>
                            <th>发送人</th>
                            <th>时间</th>
                            <th>内容</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    <c:forEach items="${pageInfo.list}" var="msg" varStatus="id">
                        <tr>
                            <td>${msg.mtitle}</td>
                            <td>${msg.uname}</td>
                            <td>${msg.mtime}</td>
                            <td>${msg.mcontext}</td>
                            <c:if test="${msg.mstate == '31'}">
                                <td><label style="color: green ; font-weight:bold">已读</label></td>
                            </c:if>
                            <c:if test="${msg.mstate == '32'}">
                                <td><label style="color: red ; font-weight:bold">未读</label></td>
                            </c:if>
                            <td><a href="<%=path%>/informManager/msgDetails.action?msgid=${msg.msgid}"> 查看详情</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <%--============================================分页==========================================--%>
            <div class="row">
                <div class="col-md-6">
                    第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录
                </div>
            </div>
            <div class="page">
                <a href="<%=path%>/informManager/messageInform.action?page=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="<%=path%>/informManager/messageInform.action?page=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                    <c:if test="${page==pageInfo.firstPage and page>1}">
                        <a href="<%=path%>/informManager/messageInform.action?page=1">1</a>
                        <c:if test="${page!=2}">
                            <span>...</span>
                        </c:if>
                    </c:if>
                    <c:if test="${page==pageInfo.pageNum}">
                        <a class="cur">${page}</a>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum}">
                        <a href="<%=path%>/informManager/messageInform.action?page=${page}">${page}</a>
                    </c:if>
                    <c:if test="${page<pageInfo.pages and page==pageInfo.lastPage}">
                        <c:if test="${page!=(pageInfo.pages-1)}">
                            <span>...</span>
                        </c:if>
                        <a href="<%=path%>/informManager/messageInform.action?page=${pageInfo.pages}">${pageInfo.pages}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="<%=path%>/informManager/messageInform.action?page=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="<%=path%>/informManager/messageInform.action?page=${pageInfo.pages}">末页</a>
            </div>
            <%--===================================================================================--%>

    </div>
    </div>
</div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
</body>
</html>

