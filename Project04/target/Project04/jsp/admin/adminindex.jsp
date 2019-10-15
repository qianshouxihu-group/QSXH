<%--
  Created by IntelliJ IDEA.
  User: 17542
  Date: 2019/9/24
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="<%=path%>layui/css/layui.css">
</head>
<body class="layui-layout-body" onload="updateTime()">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">牵手西湖管理后台</div>

        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="javascript:;" id="nowtime">
                </a>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.manager.uname}
                    <c:if test="${sessionScope.manager.roleid=='1'}" var="flag" scope="session">
                        超级管理员
                    </c:if>
                    <c:if test="${sessionScope.manager.roleid=='2'}" var="flag" scope="session">
                        普通管理员
                    </c:if>
                    <c:if test="${sessionScope.manager.roleid=='7'}" var="flag" scope="session">
                        中级管理员
                    </c:if>
                </a>
            </li>
            <li class="layui-nav-item"><a href="<%=path%>testManager/outLogin2.action" onclick=confirm("确定注销？")>注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">


                                <c:forEach items="${menumap}" var="mp" varStatus="xyz">
                                    <li class="layui-nav-item" >
                                        <a class="" href="javascript:;">${mp.key}</a>
                                        <dl class="layui-nav-child">
                                            <c:forEach items="${mp.value}" var="ml" varStatus="xyz">
                                                <dd><a href="<%=path%>${ml.nurl}" target="main">${ml.mname}</a></dd>

                                            </c:forEach>
                                        </dl>
                                    </li>
                                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="main" src="<%=path%>jsp/admin/default.jsp" style="width: 100%;height: 100%;">
        </iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="<%=path%>layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    function getNowTime(){
        var myDate=new Date();
        var year=myDate.getFullYear();
        var m = myDate.getMonth()+1;
        var d = myDate.getDate();
        var h = myDate.getHours();
        var mm = myDate.getMinutes();
        var s = myDate.getSeconds();
        var datestr= year+"年"+m+"月"+d+"日"+h+"时"+mm+"分"+s+"秒";
        document.getElementById("nowtime").innerHTML=datestr;
    }
    function  updateTime() {
        setInterval(getNowTime,1000);
    }
</script>
</body>
</html>

