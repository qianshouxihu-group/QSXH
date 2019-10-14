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

    <link rel="stylesheet" type="text/css" href="css/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/amazeui.cropper.css">
    <link rel="stylesheet" href="css/custom_up_img.css">

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/comment.js"></script>
    <script type="text/javascript" src="js/popup.mini.js"></script>
    <script src="js/amazeui.min.js" charset="utf-8" type="text/javascript"></script>
    <script src="js/cropper.min.js" charset="utf-8" type="text/javascript"></script>
    <script src="js/custom_up_img.js" charset="utf-8" type="text/javascript"></script>

    <style type="text/css">
        .member-list li{width: 213px;}
        .up-img-cover { width: 114px; height: 115px; margin: 0 auto;}
        .up-img-cover img{width: 100%; height: 100%; -moz-border-radius:50%; -webkit-border-radius:50%; border-radius: 50%;}
    </style>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>

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
    <div class="main-box1" style="width: 1240px;">
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
                        <div class="s-mname">${basicInfor.uname} </div>
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
                <div class="tit">${basicInfor.uname}</div>

                <div class="up-img-cover"  id="up-img-touch" >
                    <img class="am-circle" alt="点击图片上传" src="${basicInfor.imgurl}" data-am-popover="{content: '点击上传', trigger: 'hover focus'}" >
                </div>
                <div><a style="text-align: center; display: block;"  id="pic"></a></div>
                <!--图片上传框-->
                <div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
                    <div class="am-modal-dialog up-frame-parent up-frame-radius">
                        <div class="am-modal-hd up-frame-header">
                            <label>修改头像</label>
                            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                        </div>
                        <div class="am-modal-bd  up-frame-body">
                            <div class="am-g am-fl">
                                <div class="am-form-group am-form-file">
                                    <div class="am-fl">
                                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
                                    </div>
                                    <input type="file" id="inputImage">
                                </div>
                            </div>
                            <div class="am-g am-fl" >
                                <div class="up-pre-before up-frame-radius">
                                    <img alt="" src="" id="image" >
                                </div>
                                <div class="up-pre-after up-frame-radius">
                                </div>
                            </div>
                            <div class="am-g am-fl">
                                <div class="up-control-btns">
                                    <span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
                                    <span class="am-icon-rotate-right" onclick="rotateimgright()"></span>
                                    <span class="am-icon-check" id="up-btn-ok" url="uploadManager/headPicture.action"></span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!--加载框-->
                <div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd">正在上传...</div>
                        <div class="am-modal-bd">
                            <span class="am-icon-spinner am-icon-spin"></span>
                        </div>
                    </div>
                </div>

                <!--警告框-->
                <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd">信息</div>
                        <div class="am-modal-bd"  id="alert_content">
                            成功了
                        </div>
                        <div class="am-modal-footer">
                            <span class="am-modal-btn">确定</span>
                        </div>
                    </div>
                </div>

                <div class="main-pass-text" style="margin-top: 25px;">
                    <a href="jsp/forgetpassword.jsp" class="forget">忘记密码 ></a>
                </div>
            </div>
            <div class="main-radv"><img src="images/adv2.png"/></div>
            <div class="main-message" style="width: 232px;">
                <div class="tit">最新会员推荐</div>
                <ul class="member-list">
                    <c:forEach items="${memberlist}" var="list">
                        <li>
                            <a href="personalManager/showTaInforn.action?taId=${list.userid}">
                                <img src="${list.uimgurl}" />
                                <p>昵称：${list.uname}</p>
                                <p>年龄：${list.uage}岁</p>
                                <p>身高：${list.uheight}cm</p>
                                <p> ♥${list.ucharm}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="main-message1" style="width: 232px;">
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

</div>

</body>
</html>
