<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%

    String chatPath = request.getServerName()+":"+request.getServerPort()+request.getContextPath();
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
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="font_Icon/iconfont.css">

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
        <div class="main-box1" style="width:1200px; height:800px; ">
            <div class="login-right">
                <div class="list-main1-title">会员服务</div>
                <div class="col c2"><!--menu-->
                    <div class="list-top">
                        <a href="<%=path%>/jsp/beVip.jsp">
                            <label>会员管理</label>&nbsp;
                        </a>
                    </div>
                    <div class="list-top">
                        <a href="<%=path%>/AccountAction/arec.action">
                            <label >充值记录</label>&nbsp;
                        </a>
                    </div>
                    <div class="list-top">
                        <a href="<%=path%>/AccountAction/grec.action">
                            <label style="color: red;">消费记录</label>&nbsp;
                        </a>
                    </div>
                    <div class="list-top">
                        <a href="jsp/chongzhi.jsp">
                            <label>充值入口</label>&nbsp;
                        </a>
                    </div>

                </div>

            </div><!--menu-->
            <div class="s-address">您的金币消费记录</div>



            <%--        </div>--%>
            <%--        <div class="main-box1" style="width:1200px; height:800px; ">--%>
            <table class="table table-hover" STYLE="width: 75%;">
                <thead>
                <tr>
                    <th>花费日期</th>
                    <th>花费用途</th>
                    <th>花费金币</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${pageInfo.list}" var="a">
                    <tr>
                        <td>${a.adate}</td>
                        <td>${a.param.pname}</td>
                        <td>${a.agold}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div> 第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录</div><br>

            <div class="page">
                <a href="AccountAction/grec.action?page=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="AccountAction/grec.action?page=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                    <c:if test="${page==pageInfo.firstPage and page>1}">
                        <a href="AccountAction/grec.action?page=1">1</a>
                        <c:if test="${page!=2}">
                            <span>...</span>
                        </c:if>
                    </c:if>
                    <c:if test="${page==pageInfo.pageNum}">
                        <a class="cur">${page}</a>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum}">
                        <a href="AccountAction/grec.action?page=${page}">${page}</a>
                    </c:if>
                    <c:if test="${page<pageInfo.pages and page==pageInfo.lastPage}">
                        <c:if test="${page!=(pageInfo.pages-1)}">
                            <span>...</span>
                        </c:if>
                        <a href="AccountAction/grec.action?page=${pageInfo.pages}">${pageInfo.pages}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="AccountAction/grec.action?page=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="AccountAction/grec.action?page=${pageInfo.pages}">末页</a>
            </div>

          <%--  <a>您的当前金币总额为：${gold}</a>--%>
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
<%-------------------------在线聊天-----------------------%>
<div class="chatContainer">
    <div class="chatBtn">
        <i class="iconfont icon-xiaoxi1"></i>
    </div>

    <!--总未读消息数（没有时为空“”）-->
    <div class="chat-message-num"></div>

    <!--聊天列表-->
    <div class="chatBox" ref="chatBox">
        <div class="chatBox-head">
            <div class="chatBox-head-one">
                聊天列表
                <div class="chat-close" style="margin: 10px 10px 0 0;font-size: 14px">关闭</div>
            </div>

            <!--聊天窗口-->
            <div class="chatBox-head-two">
                <div class="chat-return">返回</div>
                <div class="chat-people">
                    <div class="ChatInfoHead">
                        <img src="" alt="头像">
                    </div>
                    <div class="ChatInfoName">这是用户的名字</div>
                </div>

                <div class="chat-close">关闭</div>
            </div>

        </div>
        <div class="chatBox-info">

            <!--用户列表-->
            <div class="chatBox-list" ref="chatBoxlist">
                <c:forEach items="${sessionScope.chatlist}" var="chatuser">
                    <input type="hidden" value="${chatuser.userid}" id="${chatuser.userid}">
                    <div class="chat-list-people">
                        <div><img src="images/icon01.png" alt="头像"></div>
                        <div class="chat-name">
                            <p>${chatuser.uname}</p>
                        </div>
                        <div class="message-num"></div>
                    </div>
                </c:forEach>

                <div class="chat-list-people">
                    <div><img src="images/icon01.png" alt="头像"></div>
                    <div class="chat-name">
                        <p>琴酒</p>
                    </div>
                    <i class="fa fa-circle online">&nbsp;&nbsp;在线</i>
                    <div class="chat-delete">删除</div>
                </div>
            </div>

            <!--聊天界面-->
            <div class="chatBox-kuang" ref="chatBoxkuang">
                <div class="chatBox-content">
                    <div class="chatBox-content-demo" id="chatBox-content-demo">

                        <!--收到消息 left-->
                        <div class="clearfloat">
                            <div class="author-name">
                                <small class="chat-date">time</small>
                            </div>
                            <div class="left">
                                <div class="chat-avatars"><img src="images/icon01.png" alt="头像"></div>
                                <div class="chat-message">
                                    给你看张图
                                </div>
                            </div>
                        </div>

                        <!--收到图片 left-->
                        <div class="clearfloat">
                            <div class="author-name">
                                <small class="chat-date">2017-12-02 14:26:58</small>
                            </div>
                            <div class="left">
                                <div class="chat-avatars"><img src="images/icon01.png" alt="头像"></div>
                                <div class="chat-message">
                                    <img src="images/1.png" alt="">
                                </div>
                            </div>
                        </div>

                        <!--发送消息 right-->
                        <div class="clearfloat">
                            <div class="author-name">
                                <small class="chat-date">2017-12-02 14:26:58</small>
                            </div>
                            <div class="right">
                                <div class="chat-message">嗯，适合做壁纸</div>
                                <div class="chat-avatars"><img src="images/icon02.png" alt="头像"></div>
                            </div>
                        </div>

                    </div>
                </div>

                <!--聊天工具栏-->
                <div class="chatBox-send">
                    <div class="div-textarea" contenteditable="true"></div>
                    <div>
                        <button id="chat-biaoqing" class="btn-default-styles">
                            <i class="iconfont icon-biaoqing"></i>
                        </button>
                        <label id="chat-tuxiang" title="发送图片" for="inputImages" class="btn-default-styles">
                            <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                   name="file" id="inputImages" class="hidden">
                            <i class="iconfont icon-tuxiang"></i>
                        </label>
                        <button id="chat-fasong" class="btn-default-styles"><i class="iconfont icon-fasong"></i>
                        </button>
                    </div>
                    <div class="biaoqing-photo">
                        <ul>
                            <li><span class="emoji-picker-image" style="background-position: -9px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -18px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -52px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -86px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -120px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -120px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -9px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -40px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -71px -154px;"></span></li>
                            <li><span class="emoji-picker-image" style="background-position: -102px -154px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -133px -154px;"></span>
                            </li>
                            <li><span class="emoji-picker-image" style="background-position: -164px -154px;"></span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<%--<%
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
<%}%>--%>
<script src="js/chat.js"></script>
<script src="js/chatserver.js"></script>
<script>
    //聊天窗口样式
    screenFuc();
    $(".chatBox").hide();
    getParam('${sessionScope.user.userid}');
    getConfig('${sessionScope.user.userid}','<%=chatPath%>');
</script>
</html>
