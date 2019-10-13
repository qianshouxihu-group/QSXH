<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String chatPath = request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="font_Icon/iconfont.css">
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
                    <a href="jsp/clinetReg.jsp">注册</a> |
                    <a href="jsp/login.jsp">登录</a>
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
        <a href="">我的消息 &nbsp; <div class="my-notice">12</div></a>
        <a href="">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
            <div class="list-main1-title">个人中心</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="personalManager/myHomePage.action">我的主页</a></div>
                <div class="list-top"><a href="personalManager/myPhotograph.action">我的照片</a></div>
                <div class="list-top"><a href="MyFollowManager/getlist.action" class="cur">我的关注</a></div>
                <div class="list-top"><a href="personalManager/aboutBasic.action">基本资料</a></div>
                <div class="list-top"><a href="personalManager/aboutCP.action" >择偶条件</a></div>

                <div class="css3-animated-example">
                    <h3 >详情资料</h3>
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
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;我的关注</div>
            <div class="safty">
                <%--<div class="tit">关注列表  >></div>--%>
                <ul class="success" >
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
                                        <a href="javascript:void(0);" class="myfollow" style="color:#fff;" onclick="chatApply(this)">&nbsp; 发起聊天 &nbsp;</a>
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
                                <p><a href="javascript:void(0);" class="cf60" onclick="getDetails(this)">[查看详情]</a></p>
                            </div>
                            <input type="hidden" value="${followuser.uname}">
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

    <%--在线聊天--%>
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
                            <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                                <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                       name="file" id="inputImage" class="hidden">
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

</div>

<script src="js/chat.js"></script>
<script src="js/chatserver.js"></script>
<script>

    //聊天窗口样式
    screenFuc();

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
        var gtoid = $(touser).parent().parent().prev().val();
        // $(toform).attr('action',goodurl);
        // $(toform).submit();
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : goodurl,
            data : {followedid:gtoid},
            success : function(result){
                if (result=='yes'){
                    alert('点赞成功');
                }
                else if (result=='no'){
                    alert('点赞失败，未知异常');
                }
            },
            error : function(result){
                alert('点赞失败，连接异常');
            }
        });
        location.href="MyFollowManager/getlist.action";
    }

    function cancelFollow(touser) {
        if (!confirm("确定取消关注该用户？")){
            return false;
        }
        cancelurl = "MyFollowManager/change.action";
        var ftoid = $(touser).parent().parent().prev().val();
        // $(toform).attr('action',cancelurl);
        // $(toform).submit();
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : cancelurl,
            data : {followedid:ftoid},
            success : function(result){
                if (result=='no'){
                    alert('取关失败，未知异常');
                }
            },
            error : function(result){
                alert('取关失败，连接异常');
            }
        });
        location.href="MyFollowManager/getlist.action";
    }

    function chatApply(touser) {
        var toid = $(touser).parent().parent().prev().val();
        var uname = $(touser).parent().parent().next().val();
        var chatid = '#'+toid;
        if (toid==$(".chatBox-list").children(chatid).val()){
            alert('对方已在聊天列表中！');
        }
        else if (confirm('是否发起聊天？')){
            sendMessage(uname,toid,'apply');
        }
    }

    function getDetails(touser) {

        var taid = $(touser).parent().parent().prev().val();
        alert(taid);
        detailurl = "personalManager/showTaInforn.action?taId="+taid;
        // $(toform).attr('action',detailurl);
        // $(toform).submit();
        location.href=detailurl;
    }

    $(".chatBox").hide();
    getParam('${sessionScope.user.userid}','<%=basePath%>');
    getConfig('${sessionScope.user.userid}','<%=chatPath%>');

</script>
</body>

<script>

</script>

</html>

