<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.collapse.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/selectstate.js" ></script>
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-right">
            <a href="">注册</a> |
            <a href="">登录</a>
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
        <a href="">我的消息 </a>
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
                <div class="list-top"><a href="MyFollowManager/getlist.action">我的关注</a></div>
                <div class="list-top"><a href="personalManager/aboutBasic.action" class="cur">基本资料</a></div>
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
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;基本资料</div>
            <div class="safty">
                <form action="personalManager/updateBasic.action" method="post">
                    <div class="tit">个人资料  >></div>
                    <ul class="condition-list">
                        <li>
                            <p>
                                <span>会&nbsp;&nbsp;员 &nbsp;号：</span>
                                ${resultPersonalData.userid}
                            </p>
                            <p>
                                <span>出生年月：</span>
                                ${resultPersonalData.ubirthday}
                            </p>
                            <p>
                                <span>婚姻状况：</span>
                                <select class="conditon-select" name="umerried" id="umerried">
                                    <option value="不限">不限</option>
                                    <option value="未婚">未婚</option>
                                    <option value="离异">离异</option>
                                    <option value="丧偶">丧偶</option>
                                </select>
                            </p>
                            <p>
                                <span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 龄：</span>
                                <input class="conditon-select" type="text" name="uage" value="${resultPersonalData.uage}" readonly/>
                            </p>
                        </li>
                        <li>
                            <p>
                                <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 称：</span>
                                <input class="conditon-select" type="text" name="uname" value="${resultPersonalData.uname}"/>
                            </p>
                            <p>
                                <span>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高：</span>
                                ${resultPersonalData.uheight}
                            </p>
                            <p>
                                <span>月&nbsp;&nbsp;收 &nbsp;入： </span>
                                <select class="conditon-select" name="uincome" id="uincome">
                                    <option value="不限">不限</option>
                                    <option value="0-5000">0-5000</option>
                                    <option value="5000-10000">5000-10000</option>
                                    <option value="10000-15000">10000-15000</option>
                                    <option value="15000-20000">15000-20000</option>
                                    <option value="20000以上">20000 以上</option>
                                </select>
                            </p>
                        </li>
                        <li>
                            <p>
                                <span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 历： </span>
                                <select class="conditon-select" name="uedu" id="uedu">
                                    <option value="不限">不限</option>
                                    <option value="高中">高中</option>
                                    <option value="专科">专科</option>
                                    <option value="本科">本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </p>
                            <p>
                                <span> 性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别： </span>
                                ${resultPersonalData.usex}
                            </p>
                            <p>
                                <span>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 型： </span>
                                ${resultPersonalData.ublood}
                            </p>
                        </li>
                        <li>
                            <p>
                                <span> 星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 座：</span>
                                <select class="conditon-select" name="constellation" id="constellation">
                                    <option value="未选择">-----请选择-----</option>
                                    <option value="白羊座">白羊座</option>
                                    <option value="金牛座">金牛座</option>
                                    <option value="双子座">双子座</option>
                                    <option value="巨蟹座">巨蟹座</option>
                                    <option value="狮子座">狮子座</option>
                                    <option value="处女座">处女座</option>
                                    <option value="天秤座">天秤座</option>
                                    <option value="天蝎座">天蝎座</option>
                                    <option value="射手座">射手座</option>
                                    <option value="魔羯座">魔羯座</option>
                                    <option value="水瓶座">水瓶座</option>
                                    <option value="双鱼座">双鱼座</option>
                                </select>
                            </p>
                        </li>
                    </ul>
                    <ul class="address" style="margin-top: 0;">
                        <li>
                            <p>
                                <span>所&nbsp;&nbsp;在&nbsp;&nbsp;地：</span>
                                <select id="s_province" name="s_province" class="conditon-select" ></select>
                                <select id="s_city" name="s_city" class="conditon-select"></select>&nbsp;
                                <script src="<%=basePath%>js/area.js" type="text/javascript" charset="utf-8"></script>
                                <script type="text/javascript">_init_area();</script>
                                （&nbsp;已选择：${resultPersonalData.s_province}&nbsp;${resultPersonalData.s_city}&nbsp;）
                            </p>
                        </li>
                    </ul>

                    <div class="tit">自我介绍  >></div>
                    <textarea class="introduce" name="uinstro" placeholder="让大家更快速的记住你。。。">${resultPersonalData.uinstro}</textarea>
                    <div class="btn-box">
                        <input type="submit" class="save-btn" value="保存并继续">
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>
    <div class="copy">
        <p>Copyright©2019    厦门牵手西湖婚恋交友网    版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000    技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
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

    $(function () {
        getSelectState("umerried", "${resultPersonalData.umerried}");
        getSelectState("uincome", "${resultPersonalData.uincome}");
        getSelectState("uedu", "${resultPersonalData.uedu}");
        getSelectState("constellation", "${resultPersonalData.constellation}")
    })

</script>
</body>
</html>
