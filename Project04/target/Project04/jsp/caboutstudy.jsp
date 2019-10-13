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
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.collapse.js" ></script>
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
                <div class="list-top"><a href="personalManager/aboutBasic.action">基本资料</a></div>
                <div class="list-top"><a href="personalManager/aboutCP.action">择偶条件</a></div>
                <div class="css3-animated-example">
                    <h3 class="cur">详情资料</h3>
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
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;详细资料</div>
            <div class="safty">
                <form action="personalManager/updateWS.action" method="post">
                    <div class="tit">工作学习  >></div>
                    <ul class="safty-list">
                        <li>
                            <span>职业职位：</span>
                            <input type="text" class="name-input"  placeholder="  选填" name="positions" value="&nbsp;${wsData.positions}"/>
                        </li>
                        <li>
                            <span> 从事工作： </span>
                            <select class="conditon-select" name="uwork" id="uwork">
                                <option value="未填写">下次再说</option>
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
                        </li>
                        <li>
                            <span>毕业院校：</span>
                            <input type="text" class="name-input" placeholder="  选填" name="uschool" value="&nbsp;${wsData.uschool}"/>
                        </li>
                        <li>
                            <span>专业名称：</span>
                            <input type="text" class="name-input" placeholder="  选填" name="major" value="&nbsp;${wsData.major}"/>
                        </li>
                        <li>
                            <span>毕业时间：</span>
                            <input type="text" class="name-input" name="gradtime" placeholder="  选填" value="&nbsp;${wsData.gradtime}"/>
                        </li>
                        <li>
                            <span> 购车情况： </span>
                            <select class="conditon-select" name="ucar" id="ucar">
                                <option value="不限">不限</option>
                                <option value="有车">有车</option>
                                <option value="无车">无车</option>
                            </select>
                        </li>
                        <li>
                            <span>住房情况：</span>
                            <select class="conditon-select" name="uhouse" id="uhouse">
                                <option value="不限">不限</option>
                                <option value="有房">有房</option>
                                <option value="无房">无房</option>
                            </select>
                        </li>

                    </ul>
                    <div class="btn-box">
                        <input type="submit" class="save-btn" value="保存并继续">
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>
    <div class="copy">
        <p>Copyright©2019   厦门牵手西湖婚恋交友网   版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
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
        getSelectState("uwork", "${wsData.uwork}");
        getSelectState("ucar", "${wsData.ucar}");
        getSelectState("uhouse", "${wsData.uhouse}");
    })

</script>
</body>
</html>


