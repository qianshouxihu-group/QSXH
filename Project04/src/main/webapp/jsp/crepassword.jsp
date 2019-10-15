<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String chatPath = request.getServerName()+":"+request.getServerPort()+request.getContextPath();
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
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.collapse.js" ></script>
    <link type="text/css" rel="stylesheet" href="css/chat.css">
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="font_Icon/iconfont.css">

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
                    <h3>详情资料</h3>
                    <div>
                        <div class="content">
                            <p><a href="personalManager/aboutWS.action">工作学习</a></p>
                            <p><a href="personalManager/aboutHabit.action">兴趣爱好</a></p>
                            <p><a href="personalManager/aboutLimit.action">个性要求</a></p>
                        </div>
                    </div>
                </div>
                <div class="css3-animated-example">
                    <h3  class="cur" style=" border-bottom: 0;">系统设置</h3>
                    <div>
                        <div class="content">
                            <p><a href="">密码修改</a></p>
                        </div>
                    </div>
                </div>
            </div><!--menu-->
        </div><!--right-->
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;系统设置</div>
            <div class="safty">
                <form onsubmit="return checkData()" action="personalManager/rePassWord.action" method="post">
                    <div class="tit">修改密码    >></div>
                    <ul class="safty-list">
                        <li>
                            <span><i>*</i>原密码：</span>
                            <input type="password" class="name-input" placeholder=" 6-18位字母、数字的组合" id="pw1" onblur="return checkPass()"/>
                            <span id="s1"></span>
                        </li>
                        <li>
                            <span><i>*</i>新密码：</span>
                            <input type="password" class="name-input" placeholder=" 6-18位字母、数字的组合 " id="pw2" onblur="return checkNewPass()"/>
                            <span id="s2"></span>
                        </li>
                        <li>
                            <span><i>*</i>确认新密码：</span>
                            <input type="password" class="name-input" placeholder=" 与新密码保持一致 "  id="pw3"  name="newupass"  onblur="return checkRePass()"/>
                            <span id="s3"></span>
                        </li>
                        <li>
                            <span id="s4" style="color: red"></span>
                        </li>
                    </ul>
                    <div class="btn-box">
                        <input type="submit" value="提交" class="save-btn"/>
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>

    <div class="copy">
        <p>Copyright©2019    厦门牵手西湖婚恋交友网     版权所有  </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>
</div>
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

    var count = 0;
    <%--验证密码是否正确--%>
    function checkPass() {
        var password = $("#pw1").val();
        $.ajax({
            url:"personalManager/checkPassWord.action",   //请求服务器路径
            data:{"upass":password},	//参数请求对象
            // contentType:"application/json;charset=utf-8",
            type:"post", //请求方式
            dataType:"json",  //服务请返回的数据类型
            success:function(data){
                if ("1"==data){
                    $("#s1").html("✔");
                    count++;
                    return true ;
                } else{
                    $("#s1").html(" 密码错误！");
                    return false ;
                }
            }
        })
    }

    <%--密码不为空、格式验证--%>
    function checkNewPass()
    {
        var password = $("#pw2").val();
        var test=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;
        if(null == password || 0 == password.length)
        {
            $("#s2").html(" 密码不可为空！");
            return false;
        }
        else if (!test.test(password))
        {
            $("#s2").html("格式不正确！");
            return false;
        }
        else
        {
            $("#s2").html("✔");
            count++;
            return true;
        }
    }
    <%--重复密码验证--%>
    function checkRePass() {
        var pass = $("#pw2").val();
        var repass = $("#pw3").val();
        if(null == repass || 0 == repass.length)
        {
            $("#s3").html("请确认密码！");
            return false;
        }
        else if(pass != repass)
        {
            $("#s3").html("输入不一致！");
            return false;
        }
        else
        {
            $("#s3").html("✔");
            count++;
            return true;
        }
    }
    <%--提交数据完整性验证--%>
    function checkData() {
        if (count>=3){
            return true ;
        }else {
            $("#s4").html("操作有误！");
            return false ;
        }
    }
</script>
</body>
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

