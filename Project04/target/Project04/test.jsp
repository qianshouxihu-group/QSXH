<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="testManager2/login.action" method="post">
    账号：<input type="text" name="uname"> <br/>
    密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录">

    <%--测试--%>
    <a href="<%=path%>/jsp/clientReg.jsp">注册</a>
    <a href="<%=path%>/informManager/systemInform.action">我的消息</a>
    <a href="<%=path%>/jsp/backRegCheck.jsp">后台注册审核</a>
</form>

</body>
</html>
