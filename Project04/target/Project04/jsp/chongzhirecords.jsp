<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>充值服务中心</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网"/>
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<%String chongzhi = request.getParameter("chongzhi");%>
<form action="AccountAction/rec.action" method="post">
    <div class="head">
        <div class="top">
            <div class="top-left">
                <a href="javascript:;" class="top-coll" onclick="AddFavorite('', 'http://www.ncwjxhljyw.com')">收藏牵手西湖</a> |
                <a href="" class="top-att">关注牵手西湖</a>
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
        <div class="main-box1" style="width:1200px; height:800px; ">
            <div class="s-address">充值记录</div>



<%--        </div>--%>
<%--        <div class="main-box1" style="width:1200px; height:800px; ">--%>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>充值日期</th>
                        <th>消费用途</th>
                        <th>花费</th>
                        <th>获得金币</th>
                    </tr>
                    </thead>
                    <tbody>

                   <c:forEach items="${pageInfo.list}" var="a">
                    <tr>
                        <td>${a.adate}</td>
                        <td>${a.param.pname}</td>
                        <td>${a.rmb}元</td>
                        <td>${a.agold}</td>
                    </tr>
                   </c:forEach>
                    </tbody>
                </table>
            <div> 第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录</div><br>



            <div class="page">
                <a href="AccountAction/arec.action?page=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="AccountAction/arec.action?page=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                    <c:if test="${page==pageInfo.firstPage and page>1}">
                        <a href="AccountAction/arec.action?page=1">1</a>
                        <c:if test="${page!=2}">
                            <span>...</span>
                        </c:if>
                    </c:if>
                    <c:if test="${page==pageInfo.pageNum}">
                        <a class="cur">${page}</a>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum}">
                        <a href="AccountAction/arec.action?page=${page}">${page}</a>
                    </c:if>
                    <c:if test="${page<pageInfo.pages and page==pageInfo.lastPage}">
                        <c:if test="${page!=(pageInfo.pages-1)}">
                            <span>...</span>
                        </c:if>
                        <a href="AccountAction/arec.action?page=${pageInfo.pages}">${pageInfo.pages}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="AccountAction/arec.action?page=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="AccountAction/arec.action?page=${pageInfo.pages}">末页</a>
            </div>


          <a>您的当前金币总额为：${gold}</a>
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
        <div class="copy">
            <p>COPYRIGHT 2019  厦门牵手西湖婚恋交友网  版权所有 </p>
            <p>地址：厦门市软件园二期观日路56号  电话：xxx-xxxx-xxxx  </p>
        </div>
    </div>
</form>
</body>
<%
    if (request.getAttribute("flog") == "success") {%>
<script>
    alert("充值成功!");
</script>
<%} else if (request.getAttribute("flog") == "fail") {%>
<script>
    alert("充值失败！");
</script>
<%} else if (request.getAttribute("flog") == "error") {%>
<script>
    alert("网络错误");
</script>
<%}%>
</html>
