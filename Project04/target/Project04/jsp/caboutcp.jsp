<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="main-box1">
        <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
            <div class="list-main1-title">个人中心</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="personalManager/myHomePage.action">我的主页</a></div>
                <div class="list-top"><a href="personalManager/myPhotograph.action">我的照片</a></div>
                <div class="list-top"><a href="MyFollowManager/getlist.action">我的关注</a></div>
                <div class="list-top"><a href="personalManager/aboutBasic.action" >基本资料</a></div>
                <div class="list-top"><a href="personalManager/aboutCP.action" class="cur" >择偶条件</a></div>
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
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;择偶条件</div>
            <div class="safty">
                <form action="personalManager/updateCP.action" method="post">
                    <div class="tit">设置择偶要求  >></div>
                    <ul class="condition-list">
                        <li>
                            <p>
                                <span>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高：</span>
                                <select class="conditon-select" name="uheight" id="uheight">
                                    <option value="不限">不限</option>
                                    <option value="0-150">0-150</option>
                                    <option value="151-155">151-155</option>
                                    <option value="156-160">156-160</option>
                                    <option value="161-165">161-165</option>
                                    <option value="166-170">166-170</option>
                                    <option value="171-175">171-175</option>
                                    <option value="176-180">176-180</option>
                                    <option value="181-185">181-185</option>
                                    <option value="186-190">186-190</option>
                                    <option value="191以上">191 以上</option>
                                </select>
                            </p>
                            <p>
                                <span>婚史状况：</span>
                                <select class="conditon-select" name="umerried" id="umerried">
                                    <option value="不限">不限</option>
                                    <option value="未婚">未婚</option>
                                    <option value="离异">离异</option>
                                    <option value="丧偶">丧偶</option>
                                </select>
                            </p>
                            <p>
                                <span>住房情况：</span>
                                <select class="conditon-select" name="uhouse" id="uhouse">
                                    <option value="不限">不限</option>
                                    <option value="有房">有房</option>
                                    <option value="无房">无房</option>
                                </select>
                            </p>
                        </li>
                        <li>
                            <p>
                                <span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span>
                                <select class="conditon-select" name="agerange" id="agerange">
                                    <option value="不限">不限</option>
                                    <option value="18-23">18-23</option>
                                    <option value="24-29">24-29</option>
                                    <option value="30-35">30-35</option>
                                    <option value="36-41">36-41</option>
                                    <option value="42-47">42-47</option>
                                    <option value="48-53">48-53</option>
                                    <option value="53以上">53 以上</option>
                                </select>
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
                            <p>
                                <span> 购车情况： </span>
                                <select class="conditon-select" name="ucar" id="ucar">
                                    <option value="不限">不限</option>
                                    <option value="有车">有车</option>
                                    <option value="无车">无车</option>
                                </select>
                            </p>
                        </li>
                        <li>
                            <p>
                                <span> 学 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历： </span>
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
                                <span> 从事工作： </span>
                                <select class="conditon-select" name="uwork" id="uwork">
                                    <option value="不限">不限</option>
                                    <option value="在校学生">在校学生</option>
                                    <option value="计算机/IT">计算机/IT</option>
                                    <option value="通信技术">通信技术</option>
                                    <option value="销售">销售</option>
                                    <option value="市场拓展">市场拓展</option>
                                    <option value="公关/商务">公关/商务</option>
                                    <option value="采购/贸易">采购/贸易</option>
                                    <option value="客户服务">客户服务</option>
                                    <option value="人力/行政">人力/行政</option>
                                    <option value="高级管理">高级管理</option>
                                    <option value="制造/加工">制造/加工</option>
                                    <option value="质控/安检">质控/安检</option>
                                    <option value="工程机械">工程机械</option>
                                    <option value="技工">技工</option>
                                    <option value="财会/审计">财会/审计</option>
                                    <option value="金融">金融</option>
                                    <option value="装修/物业">装修/物业</option>
                                    <option value="家政/月嫂">家政/月嫂</option>
                                    <option value="航空">航空</option>
                                    <option value="教育/培训">教育/培训</option>
                                    <option value="咨询/顾问">咨询/顾问</option>
                                    <option value="学术/科研">学术/科研</option>
                                    <option value="法律">法律</option>
                                    <option value="设计/创意">设计/创意</option>
                                    <option value="文学/媒体">文学/媒体</option>
                                    <option value="餐饮/旅游">餐饮/旅游</option>
                                    <option value="能源/化工">能源/化工</option>
                                    <option value="地质勘探">地质勘探</option>
                                    <option value="医疗/护理">医疗/护理</option>
                                    <option value="保健/美容">保健/美容</option>
                                    <option value="生物工程">生物工程</option>
                                    <option value="制药/器械">制药/器械</option>
                                    <option value="体育工作者">体育工作者</option>
                                    <option value="翻译">翻译</option>
                                    <option value="公务员/干部">公务员/干部</option>
                                    <option value="个体/电商">个体/电商</option>
                                    <option value="警察">警察</option>
                                    <option value="其他">其他</option>
                                </select>
                            </p>
                        </li>
                    </ul>
                    <ul class="marry-select">
                        <li>
                            <p>
                                <span> 血 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型： </span>
                                <select class="conditon-select" name="ublood" id="ublood">
                                    <option value="不限">不限</option>
                                    <option value="A">A 型</option>
                                    <option value="B">B 型</option>
                                    <option value="O">O 型</option>
                                    <option value="AB">AB 型</option>
                                    <option value="其它">其它血型</option>
                                </select>
                            </p>
                        </li>
                        <li>
                            <p>
                                <span> 星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 座：</span>
                                <select class="conditon-select" name="constellation" id="constellation">
                                    <option value="不限">不限</option>
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
                    <ul class="address">
                        <li>
                            <p>
                                <span>所&nbsp;&nbsp;在&nbsp;&nbsp;地：</span>
                                <select id="s_province" name="s_province" class="conditon-select"></select>
                                <select id="s_city" name="s_city" class="conditon-select"></select>&nbsp;
                                <script src="<%=basePath%>js/area.js" type="text/javascript" charset="utf-8"></script>
                                <script type="text/javascript">_init_area();</script>
                                （&nbsp;已选择：${cpData.s_province}&nbsp;${cpData.s_city}&nbsp;）
                            </p>
                        </li>
                    </ul>
                    <div class="btn-box">
                        <input type="submit" value="保存并继续" class="save-btn">
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有</p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000 技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
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
        getSelectState("uheight", "${cpData.uheight}");
        getSelectState("umerried", "${cpData.umerried}");
        getSelectState("uhouse", "${cpData.uhouse}");
        getSelectState("agerange", "${cpData.agerange}");
        getSelectState("uincome","${cpData.uincome}");
        getSelectState("ucar", "${cpData.ucar}");
        getSelectState("uedu","${cpData.uedu}");
        getSelectState("uwork","${cpData.uwork}");
        getSelectState("ublood","${cpData.ublood}");
        getSelectState("constellation","${cpData.constellation}");
    })
</script>
</body>
</html>
