<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" import ="java.util.*,com.qsxh.entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="font_Icon/iconfont.css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <%--    <script type="text/javascript" src="js/comment.js"></script>--%>
    <script type="text/javascript" src="js/popup.mini.js"></script>
    <style>
        .m-icon{ float: right;}
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
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：<a href="">个人中心 </a>>我的主页</div>
            <div class="s-top">
                <div class="preview">
                    <div id="vertical" class="bigImg"><img src="${requestScope.myPhotoList[0].imgurl}" width="300" height="300" alt="" id="midimg" /></div>
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp disabled"></div>
                        <div id="imageMenu">
                            <ul>
                                <c:forEach items="${requestScope.myPhotoList}" var="myplist">
                                    <li id="onlickImg"><img src="${myplist.imgurl}" width="68" height="68" /></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="scrollbutton smallImgDown"></div>
                    </div>
                </div>
                <div class="s-minfor">
                    <div class="tit">
                        <div class="s-mname">${basicInfor.uname}网为嘛子</div>

                        <div class="m-icon">
                            <input type="hidden" value="${requestScope.relationUser.ftoid}" id="toUser">
                            <a href="javascript:void(0);" >
                                <img src="images/dating.png" id="dating" title="发起约会">
                            </a>
                            <c:if test="${requestScope.relationUser.uonline=='11'}">
                                <a href="javascript:void(0);" onclick="chatApply()">
                                    <img src="images/chat.png" title="发起聊天">
                                </a>
                            </c:if>
                            <c:if test="${requestScope.relationUser.uonline=='12'}">
                                <a>
                                    <img src="images/nochat.png" title="在线聊天">
                                </a>

                            </c:if>
                            <c:if test="${requestScope.relationUser.ffollow=='72'}">
                                <a href="javascript:void(0);" onclick="changeFollow()">
                                    <img src="images/cancel.png" title="关注TA">
                                </a>
                            </c:if>
                            <c:if test="${requestScope.relationUser.ffollow=='71'}">
                                <a href="javascript:void(0);" onclick="changeFollow()">
                                    <img src="images/follow.png" title="取消关注">
                                </a>
                            </c:if>
                            <a href="javascript:void(0);" >
                                <img src="images/sgift.png" title="赠送礼物">
                            </a>
                            <a href="" >
                                <img src="images/inforn.png" id="leaveMessage" title="给TA留言">
                            </a>
                            <c:if test="${requestScope.relationUser.fgood=='62'}">
                                <a href="javascript:void(0);" onclick="giveGood()">
                                    <img src="images/good.png" title="点赞">
                                </a>
                            </c:if>
                            <img src="images/empty.png" >
                        </div>
                    </div>
                    <ul class="infor">
                        <li>
                            <p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<span>${basicInfor.usex} </span></p>
                            <p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：<span>${basicInfor.uedu}</span></p>
                        </li>
                        <li>
                            <p>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<span>${basicInfor.uage} </span></p>
                            <p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：<span>${basicInfor.uheight} cm</span></p>
                        </li>
                        <li>
                            <p>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座：<span>${basicInfor.constellation}</span></p>
                            <p>婚姻状况：<span>${basicInfor.umerried}</span></p>
                        </li>
                        <li>
                            <p>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<span> ${basicInfor.ublood} </span></p>
                        </li>
                    </ul>
                    <ul class="infor1">
                        <li>
                            <p style="width:300px">月&nbsp;&nbsp;收&nbsp;&nbsp;&nbsp;入：<span>${basicInfor.uincome} </span> </p>
                            <p>所&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;地：<span>${basicInfor.s_province}&nbsp;${basicInfor.s_city}</span> </p>
                        </li>
                    </ul>
                    <div class="s-introduce">
                        <div class="tit">自我介绍</div>
                        <p>${basicInfor.uinstro}</p>
                    </div>

                </div>

                <div>

                </div>

            </div>
            <div class="s-introduce"> <div class="tit">择偶要求</div></div>
            <ul class="s-yaoqiu">
                <li>
                    <p>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<span>${cpLimitDate.agerange} </span></p>
                    <p>月 收 入：<span>${cpLimitDate.uincome} </span></p>
                    <p>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<span>${cpLimitDate.ublood} </span></p>
                </li>
                <li>
                    <p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：<span>${cpLimitDate.uheight} cm</span></p>
                    <p>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;房：<span>${cpLimitDate.uhouse}</span></p>
                    <p>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座：<span>${cpLimitDate.constellation}</span></p>
                </li>
                <li>
                    <p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：<span>${cpLimitDate.uedu}</span></p>
                    <p>购&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车：<span>${cpLimitDate.ucar}</span></p>
                </li>
                <li>
                    <p>婚史状况：<span>${cpLimitDate.umerried}</span></p>
                    <p>从事工作：<span>${cpLimitDate.uwork}</span></p>
                </li>
            </ul>
            <ul class="infor1">
                <li>
                    <p>所&nbsp;&nbsp;在&nbsp;&nbsp;地：<span>${cpLimitDate.s_province}&nbsp;${cpLimitDate.s_city}</span> </p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">工作学习</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>职业职位：<span>${workDate.positions}</span></p>
                    <p>毕业时间：<span>${workDate.gradtime}</span></p>
                    <p>购房情况：<span>${workDate.uhouse}</span></p>
                </li>
                <li>
                    <p>从事工作：<span>${workDate.uwork}</span></p>
                    <p>专业名称：<span>${workDate.major}</span></p>
                    <p>购车情况：<span>${workDate.ucar}</span></p>
                </li>

                <li>
                    <p>毕业院校：<span>${workDate.uschool}</span></p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">个性要求</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>对方宗教限制：<span>${required.religion}</span></p>
                    <p>是否介意对方抽烟：<span>${required.smoke}</span></p>
                    <p>是否介意对方喝酒：<span>${required.drink}</span></p>
                </li>
                <li>
                    <p>是否介意对方有子女：：<span>${required.child}</span></p>
                    <p>计划结婚时间：<span>${required.wedding}</span></p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">兴趣爱好</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>运动：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='1'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                    <p>音乐：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='2'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                    <p>影视：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='3'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                    <p>美食：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='4'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                    <p>游戏：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='5'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                    <p>文学：
                        <span>
                            <c:forEach items="${requestScope.habitDate}" var="hitem">
                                <c:if test="${hitem.tyid =='6'}">
                                    ${hitem.hname}&nbsp;&nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
        </div><!--left-->

        <div class="main-right"><!--right-->
            <div class="main-log">
                <div class="tit">${mineData.uname}</div>
                <div class="mem-pic"><img src="${mineData.imgurl}"/></div>
                <div class="main-pass-text" style="margin-top: 25px;">
                    <a href="" class="entermem" style="color: #fff;">进入我的主页</a>
                    <a href="" class="forget">忘记密码 ></a>
                </div>
            </div>
            <div class="main-radv"><img src="images/adv2.png"/></div>
            <div class="main-message">
                <div class="tit">最新会员推荐</div>
                <ul class="member-list">
                    <a href="personalManager/showTaInforn.action?taId=${list.userid}">
                        <img src="${list.uimgurl}" />
                        <p>昵称：${list.uname}</p>
                        <p>年龄：${list.uage}岁</p>
                        <p>身高：${list.uheight}cm</p>
                        <p> ♥${list.ucharm}</p>
                    </a>
                </ul>
            </div>
            <div class="main-message1">
                <div class="tit">联系我们</div>
                <div class="main-contact">
                    <p>公司名称：</p>
                    <p>联系人：</p>
                    <p>联系电话：400-000-000</p>
                    <p>电子邮箱：</p>
                    <p>总店地址：厦门市思明区软件园二期观日路56号</p>
                    <p>牵手西湖婚恋交友官方微信</p>
                    <p><img src="images/weixin.jpg"/></p>
                    <p style="text-align: center;">“ 扫一扫参与亲密互动 ”</p>
                </div>
            </div>
        </div><!--right-->
    </div>
    <div class="copy">
        <p>Copyright©2019   厦门牵手西湖婚恋交友网   版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000    技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
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
<script type="text/javascript" src="js/chat.js"></script>
<script type="text/javascript" src="js/chatserver.js"></script>


<%--=======================================和TA约会 弹出层=========================================--%>
<div class="layui-row" id="datingDiv" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="" method="post" id="datingForm">
            <input type="hidden" name="dtoid" value="" ><%--value为TA的资料页面的用户id--%>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">日期与时间:</label>
                <div class="layui-input-block">
                    <input type="date" placeholder="请选择日期" lay-verify="notNull"
                           name="ddate" id="ddate" class="layui-input">
                    <input type="time" placeholder="请选择时间" lay-verify="notNull"
                           name="dtime" id="dtime" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">约会地点:</label>
                <div class="layui-input-block">
                    <input type="text" placeholder="请输入约会地点" lay-verify="notNull"
                           name="daddress" id="daddress" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">付账方式:</label>
                <div class="layui-input-block">
                    <select name="dpay" id="dpay" lay-verify="notNull">
                        <option name="dpay" value="41">AA制</option>
                        <option name="dpay" value="42">男方付账</option>
                        <option name="dpay" value="43">女方付账</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">想对TA说的话:</label>
                <div class="layui-input-block">
                            <textarea cols="10" rows="3" placeholder="请输入内容" lay-verify="myContext2"
                                      name="dcontext" id="dcontext" class="layui-textarea"
                                      maxlength="100" style="resize: none;"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="padding-left: 50px;">
                    <button lay-submit="" lay-filter="datingSumbit" class="layui-btn layui-btn-normal tijiao">提交</button>
                </div>
            </div> 
        </form>
    </div>
</div>

<%--=======================================给TA留言 弹出层=========================================--%>
<div class="layui-row" id="messageDiv" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="" method="post" id="messageForm">
            <input type="hidden" name="mtoid" value="" ><%--value为TA的资料页面的用户id--%>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">标题:</label>
                <div class="layui-input-block">
                    <input type="text" autofocus placeholder="请输入标题" lay-verify="myTitle"
                           name="mtitle" id="myTitle" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">内容:</label>
                <div class="layui-input-block">
                            <textarea cols="10" rows="3" placeholder="请输入内容" lay-verify="myContext"
                                      name="mcontext" id="myContext" class="layui-textarea"
                                      maxlength="100" style="resize: none;"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="padding-left: 50px;">
                    <button lay-submit="" lay-filter="suu" class="layui-btn layui-btn-normal tijiao">提交</button>
                </div>
            </div> 
        </form>
    </div>
</div>


</body>
<script>
    //聊天窗口样式
    screenFuc();

    function giveGood() {
        goodurl = "MyFollowManager/good.action";
        var gtoid = $("#toUser").val();
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
        var nowurl = "personalManager/showTaInforn.action?taId="+ftoid;
        location.href=nowurl;
    }

    function changeFollow() {

        cancelurl = "MyFollowManager/change.action";
        var ftoid = $("#toUser").val();
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

        var nowurl = "personalManager/showTaInforn.action?taId="+ftoid;
        location.href=nowurl;
    }

    function chatApply() {
        var ctoid = $("#toUser").val();
        var uname = $(".s-mname").text();
        var chatid = '#'+ctoid;
        if (toid==$(".chatBox-list").children(chatid).val()){
            alert('对方已在聊天列表中！');
        }
        else if (confirm('是否发起聊天？')){
            sendMessage(uname,toid,'apply');
        }
    }

    $(".chatBox").hide();

    getParam('${sessionScope.user.userid}','aa');
    getConfig('${sessionScope.user.userid}','aa');

</script>

<%--========================================给TA留言 AJAX===============================================--%>
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        var form=layui.form;
        var layer=layui.layer;
        $=layui.jquery;
        //弹出留言回复窗口
        $("#leaveMessage").on('click',function(){
            layer.open({
                type:1,
                title:"给TA留言",
                skin:"myclass",//自定样式
                area:["600px","520px"],
                resize:false,
                content:$("#messageDiv").html(),

                success: function(layero, index){},
                yes:function(){
                }
            });
            form.render();//动态渲染
        });

        //标题表单验证
        form.verify({
            myTitle: function(value){
                if(value.length < 5){
                    return '标题至少5个字符！';
                }
            }
        });
        //内容表单验证
        form.verify({
            myContext: function(value){
                if(value.length == 0){
                    return '请输入内容！';
                }
            }
        });
        //留言表单提交
        form.on('submit(suu)', function(data){
            if(confirm("确定发送留言吗？"))
            {
                $.ajax({
                    url:'<%=path%>/informManager/reply.action',
                    method:'post',
                    data:data.field,
                    dataType:'text',
                    success:function(res){
                        if(res == 'replySuccess')
                        {
                            alert("留言成功！");
                        }
                        else if(res == 'replyFail')
                        {
                            alert("留言失败！");
                        }
                    },
                    error:function (data) {
                        layer.msg("未连接");
                    }
                }) ;
            }
            else
            {
                layer.msg("已取消");
            }
        });
    });
</script>
<%--========================================和TA约会 AJAX===============================================--%>
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        var form=layui.form;
        var layer=layui.layer;
        $=layui.jquery;
        //弹出和TA约会窗口
        $("#dating").on('click',function(){
            layer.open({
                type:1,
                title:"和TA约会",
                skin:"myclass",//自定样式
                area:["800px","650px"],
                resize:false,
                content:$("#datingDiv").html(),

                success: function(layero, index){},
                yes:function(){
                }
            });
            form.render();//动态渲染
        });

        //标题表单验证
        form.verify({
            notNull: function(value){
                if(value.length == 0){
                    return '内容未填写完整！';
                }
            }
        });
        //内容表单验证
        form.verify({
            myContext2: function(value){
                if(value.length == 0){
                    return '请输入内容！';
                }
                else if(value.length < 10)
                {
                    return '内容不可少于10字！';
                }
            }
        });
        //留言表单提交
        form.on('submit(datingSumbit)', function(data){
            if(confirm("确定和TA约会吗？"))
            {
                $.ajax({
                    url:'<%=path%>/datingManager/dating.action',
                    method:'post',
                    data:data.field,
                    dataType:'text',
                    success:function(res){
                        if(res == 'success')
                        {
                            alert("约会成功！");
                        }
                        else if(res == 'fail')
                        {
                            alert("约会失败！");
                        }
                    },
                    error:function (data) {
                        layer.msg("未连接");
                    }
                }) ;
            }
            else
            {
                layer.msg("已取消");
            }
        });
    });
</script>
</html>
