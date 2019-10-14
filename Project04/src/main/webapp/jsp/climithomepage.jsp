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
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/comment.js"></script>

    <%--留言约会layui--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>
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
            <div class="s-address">当前位置：Ta 的主页 </div>
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

                    <div class="s-introduce1">
                        <p>由于您还不是会员，无法查看更多信息</p>
                        <p><a href="">请前往首页</a></p>
                        <p style="color: #eb6877;">首页——会员服务</p>
                    </div>
                </div>
            </div>
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

</body>

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

