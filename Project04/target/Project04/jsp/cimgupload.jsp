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
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link href="css/IMGUP.css" rel="stylesheet" />
    <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="css/chat.css">
    <script src="js/lanrenzhijia.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.min.js" type="text/javascript" ></script>
    <script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

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
                <div class="list-top"><a href="personalManager/myPhotograph.action" class="cur">我的照片</a></div>
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
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;我的照片</div>
            <div class="safty">
                <p>上传照片</p><br/>
                <!--图片选择对话框-->
                <div id="div_imgfile">选择图片</div>
                <!--图片预览容器-->
                <div id="div_imglook">
                    <div style="clear: both;"></div>
                </div>
                <!--确定上传按钮-->
                <div>
                <input type="button" value="确定上传" id="btn_ImgUpStart"/>
                </div>
                <div class="s-add">
                    温馨提示：
                    <li>请上传您近期清晰的照片，每张不超过5M，仅支持PNG、JPG、JPEG格式</li>
                    <li>凡是上传军人照或非本人照片（风景照、宠物照、明星/名人/网络红人等他人照片）均予以删除并承担相应的法律责任</li>
                    <li>如照片未通过审核请重新选择其他照片进行上传，未通过的照片系统将自动删除</li>
                </div><br/>
                <p>已上传至相册</p>
                <!--相册展示区-->
                <div class="gallery">
                    <c:forEach items="${requestScope.photoList}" var="plist">
                    <a id="${plist.photoid}" draggable="true" style="position: relative;"><div onclick="return deletePicture(${plist.photoid})">x</div><img src="<%=basePath%>${plist.imgurl}"></a>
                    </c:forEach>
                </div>

            </div>
        </div><!--left-->
    </div>

    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有</p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>

</div>
<script src="js/IMGUP.js"></script>
<script type="text/javascript" src="js/jquery.collapse.js" ></script>
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

    function deletePicture(a) {
        if(confirm("确定删除吗？")){
            window.location.href="personalManager/deleteMyPhotograph.action?photoid="+a;
            return true;
        }
        return false;
    }
    
</script>


</body>
</html>

