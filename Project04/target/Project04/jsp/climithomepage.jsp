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
    <script type="text/javascript" src="js/comment.js"></script>
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
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：Ta 的主页 </div>
            <div class="s-top">
                <div class="preview">
                    <div id="vertical" class="bigImg"><img src="images/bgimg.jpg" width="300" height="300" alt="" id="midimg" /></div>
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp disabled"></div>
                        <div id="imageMenu">
                            <ul>
                                <li id="onlickImg"><img src="images/test.png" width="60" height="60" /></li>
                            </ul>
                        </div>
                        <div class="scrollbutton smallImgDown"></div>
                    </div>
                </div>
                <div class="s-minfor">
                    <div class="tit">
                        <div class="s-mname">菇凉有点温柔</div>
                    </div>
                    <ul class="infor">
                        <li>
                            <p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<span>女</span></p>
                            <p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：<span>大专</span></p>
                        </li>
                        <li>
                            <p>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<span>29</span></p>
                            <p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：<span>165cm</span></p>
                        </li>
                        <li>
                            <p>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座：<span>龙</span></p>
                            <p>婚姻状况：<span>未婚</span></p>
                        </li>
                        <li>
                            <p>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<span> O 型</span></p>
                        </li>
                    </ul>
                    <ul class="infor1">
                        <li>
                            <p style="width:300px">月&nbsp;&nbsp;收&nbsp;&nbsp;&nbsp;入：<span>100000元-100000</span> </p>
                            <p>所&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;地：<span></span> </p>
                        </li>
                    </ul>
                    <div class="s-introduce1">
                        <p>由于您的资料不全，无法查看更多信息</p>
                        <p><a href="">请前往个人中心</a></p>
                        <p style="color: #eb6877;">安全设置——实名认证</p>
                    </div>
                </div>
            </div>


        </div><!--left-->
        <div class="main-right"><!--right-->
            <div class="main-log">
                <div class="tit">菇凉有点温柔</div>
                <div class="mem-pic"><img src="images/bgimg.jpg"/></div>
                <div class="main-pass-text" style="margin-top: 25px;">
                    <a href="" class="entermem" style="color: #fff;">进入个人中心</a>
                    <a href="" class="forget">忘记密码 ></a>
                </div>
            </div>
            <div class="main-radv"><img src="images/adv2.png"/></div>
            <div class="main-message">
                <div class="tit">最新会员推荐</div>
                <ul class="member-list">
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
                    <li>
                        <img src="images/bgimg.jpg" />
                        <p>会员号：100001</p>
                        <p>婚况：未      年龄：26</p>
                        <p>学历：大专   身高：160cm</p>
                        <p> 职业：CEO   房产：有房</p>
                    </li>
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
        <p>Copyright©2019    厦门牵手西湖婚恋交友网    版权所有  </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000   技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>
    <!--在线客服-->
    <div id="floatTools" class="rides-cs" style="height:246px;">
        <div class="floatL">
            <a id="aFloatTools_Show" class="btnOpen" title="查看在线客服" style="top:20px;display:block" href="javascript:void(0);">展开</a>
            <a id="aFloatTools_Hide" class="btnCtn" title="关闭在线客服" style="top:20px;display:none" href="javascript:void(0);">收缩</a>
        </div>
        <div id="divFloatToolsView" class="floatR" style="display: none;height:237px;width: 140px;">
            <div class="cn">
                <h3 class="titZx">牵手西湖在线客服</h3>
                <ul>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服1</span></li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a><span>客服2</span> </li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服3</span></li>
                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服4</span></li>
                    <li style="border:none;"><span>电话：400-000-0000</span> </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>

