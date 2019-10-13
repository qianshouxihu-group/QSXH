<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/comment.js"></script>
    <script type="text/javascript" src="js/popup.mini.js"></script>
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
            <div class="s-address">当前位置： Ta 的主页 </div>
            <div class="s-top">
                <div class="preview">
                    <div id="vertical" class="bigImg"><img src="images/bgimg.jpg" width="300" height="300" alt="" id="midimg" /></div>
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp disabled"></div>
                        <div id="imageMenu">
                            <ul>
                                <li id="onlickImg"><img src="images/test.png" width="60" height="60" /></li>
                                <li><img src="images/bgimg.jpg" width="68" height="68" /></li>
                                <li><img src="images/test.png" width="68" height="68" /></li>
                                <li><img src="images/test1.png" width="68" height="68" /></li>
                            </ul>
                        </div>
                        <div class="scrollbutton smallImgDown"></div>
                    </div>
                </div>
                <div class="s-minfor">
                    <div class="tit">
                        <div class="s-mname">菇凉有点温柔 </div>
                        <div class="m-icon">
                            <a href="" class="m-icon-iphone"></a>
                            <a href="" class="m-icon-man"></a>
                            <a href="" class="m-icon-email"></a>
                            <a href="" class="m-icon-xue"></a>
                        </div>
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
                    <div class="s-introduce">
                        <div class="tit">自我介绍</div>
                        <p>自我介绍内容</p>
                        <a href="javascript:;" class="s-jubao">
                            <img src="images/jubao.png" />
                            <p>举报</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="s-introduce"> <div class="tit">择偶要求</div></div>
            <ul class="s-yaoqiu">
                <li>
                    <p>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<span>29-32岁之间</span></p>
                    <p>月 收 入：<span>1万以上</span></p>
                    <p>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<span>要</span></p>
                </li>
                <li>
                    <p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：<span>165cm</span></p>
                    <p>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;房：<span>必须有房</span></p>
                    <p>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座：<span>金牛座</span></p>
                </li>
                <li>
                    <p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：<span>本科</span></p>
                    <p>购&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车：<span>不限</span></p>
                </li>
                <li>
                    <p>婚史状况：<span>未婚</span></p>
                    <p>从事工作：<span>公务员</span></p>
                </li>
            </ul>
            <ul class="infor1">
                <li>
                    <p>所&nbsp;&nbsp;在&nbsp;&nbsp;地：<span>南昌</span> 市 <span>进贤</span> 县 <span>进贤</span>乡 <span>进贤</span> 镇</p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">工作学习</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>职业职位：<span>客户服务/技术支持</span></p>
                    <p>毕业时间：<span>金融/投资/证券</span></p>
                    <p>购房情况：<span>已购房（无贷款）</span></p>
                </li>
                <li>
                    <p>从事工作：<span>计算机类</span></p>
                    <p>专业名称：<span>银行存款</span></p>
                    <p>购车情况：<span>无外债贷款</span></p>
                </li>

                <li>
                    <p>毕业院校：<span>1万</span></p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">个性要求</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>对方宗教限制：<span>想要孩子</span></p>
                    <p>是否介意对方抽烟：<span>老大</span></p>
                    <p>是否介意对方喝酒：<span>想要孩子</span></p>

                </li>
                <li>
                    <p>是否介意对方有子女：：<span>一年内</span></p>
                    <p>计划结婚时间：<span>父母健在</span></p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
            <div class="s-introduce"> <div class="tit">兴趣爱好</div></div>
            <ul class="s-yaoqiu1">
                <li>
                    <p>吸&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 烟：<span>不吸</span></p>
                    <p>饮食习惯：<span>素食</span></p>
                    <p>作息时间：<span>没有规律</span></p>
                </li>
                <li>
                    <p>饮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 酒：<span>不喝</span></p>
                    <p>购物逛街：<span>网购</span></p>
                    <p>宠&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 物：<span>喜欢</span></p>
                </li>
                <li>
                    <p>锻炼习惯：<span>每周一次</span></p>
                    <p>宗教信仰：<span>佛</span></p>
                </li>
            </ul>
            <div class="s-marry">&nbsp;</div>
        </div><!--left-->
        <div class="main-right"><!--right-->
<%--            <div class="main-log">--%>
<%--                <div class="tit">菇凉有点温柔</div>--%>
<%--                <div class="mem-pic"><img src="images/bgimg.jpg"/></div>--%>
<%--                <div class="main-pass-text" style="margin-top: 25px;">--%>
<%--                    <a href="" class="entermem" style="color: #fff;">进入个人中心</a>--%>
<%--                    <a href="" class="forget">忘记密码 ></a>--%>
<%--                </div>--%>
<%--            </div>--%>
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
        <p>Copyright©2019   厦门牵手西湖婚恋交友网   版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000    技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
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
<!--举报-->
<div class="ddd">
    <div class="popup-title"><i class="popup-close"><img src="images/close.png"/></i></div>
    <div class="s-jubao-box">
        <div class="s-jubao-left">
            <img src="images/bgimg.jpg" />
            <p class="title">菇凉有点温柔</p>
            <p>会员号：<span>100001</span></p>
            <p>年龄：<span>26</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 学历：<span>大专</span>   </p>
            <p>身高：<span>160cm</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职业：<span>销售</span></p>
            <p>房产：<span>有房</span></p>
        </div>
        <div class="s-jubao-right">
            <img src="images/mlogo.png" />
            <ul class="jubao-infor">
                <li><span>标题：</span><input type="text" class="jubao-name"/></li>
                <li><span>会员号：</span><em>0001</em></li>
                <li><span>上传图像等文件：</span><input type="file" class="jubao-pic"/></li>
                <li><span>举报理由：</span><textarea class="jubao-text"></textarea></li>
                <li><button class="jubao-btn">确认提交</button></li>
            </ul>
        </div>
    </div>
</div>


<script type='text/javascript'>
    (function(){
        new PopUp_api({el:'.s-jubao',html:'.ddd'});
    })()
</script>
</body>
</html>
