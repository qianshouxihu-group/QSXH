<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script  src="js/jquery.min.js" type="text/javascript"></script>
    <%--bootstrap--%>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%--layui--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script src="layui/layui.js"></script>

    <style>#detailsDiv{width:800px;background-color:lightblue;
            box-shadow: 10px 10px 5px #888888;margin: 50px auto auto 50px;
            padding-left: 50px;}
    </style>
    <style>
        .button {
            background-color: lightblue;
            border: none;
            color: black;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 20px 2px;
            cursor: pointer;
            box-shadow: 10px 10px 5px #888888;
        }
    </style>
    <style type="text/css">
        table td{ height:30px; }
    </style>
    <style type="text/css">
        h5 {color:black ; text-shadow:2px 2px white;}
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
                    <a href="">注册</a> |
                    <a href="">登录</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="top-ban">
        <div class="top-mid-box">
            <a href="" class="logo"><img src="<%=basePath%>images/logo.png"/></a>
            <div class="adv"><img src="<%=basePath%>images/adv.png"/></div>
        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="">网站首页</a>
        <a href="">条件搜索</a>
        <a href="">智能匹配</a>
        <a href="">我的关注</a>
        <a href="">个人中心</a>
        <a href="">我的消息<div class="my-notice">${countList.get(0)+countList.get(1)+countList.get(2)+countList.get(3)}</div></a>
        <a href="">会员服务</a>
        <a href="">活动专题</a>
    </div>
</div>
<div class="main">
    <div class="main-box1" style="width:1200px; height:600px;">
        <!--<div class="login-left"><img src="images/loginpic.png"/></div> -->
        <div class="login-right">
            <div class="list-main1-title">我的消息</div>
            <div class="col c2"><!--menu-->
                <div class="list-top">
                    <a href="<%=path%>/informManager/systemInform.action">
                        <label>系统消息</label>&nbsp;<div class="my-notice">${countList.get(0)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/activeInform.action">
                        <label>活动消息</label>&nbsp;<div class="my-notice">${countList.get(1)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/messageInform.action">
                        <label>我的留言</label>&nbsp;<div class="my-notice">${countList.get(2)}</div>
                    </a>
                </div>
                <div class="list-top">
                    <a href="<%=path%>/informManager/datingInform.action">
                        <label>我的约会</label>&nbsp;<div class="my-notice">${countList.get(3)}</div>
                    </a>
                </div>
            </div>
        </div>
        <div style="float: right ; width: 85% ;" id="tableAndPageInfo">
            <div id="detailsDiv">
                <%--查看详情 表格--%>
                <div <%--style="height: 200px;"--%> id="table" style="padding-top: 30px ; padding-bottom: 30px;">
                    <table class="table table-hover" id="table1" style="table-layout: fixed ;">
                        <%--发送人--%>
                        <tr>
                            <c:if test="${msg != null}">
                                <td>
                                    <h4>发送人：${msg.uname}</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating != null}">
                                <td>
                                    <h4>发送人：${dating.uname}</h4>
                                </td>
                                <td>
                                    <h4>接收人：${dating.uname2}</h4>
                                </td>
                            </c:if>
                        </tr>
                        <%--标题、付款方式--%>
                        <tr>
                            <c:if test="${inform != null}">
                                <td>
                                    <h4>标题：${inform.ititle}</h4>
                                </td>
                            </c:if>
                            <c:if test="${msg != null}">
                                <td>
                                    <h4>标题：${msg.mtitle}</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dpay == '41'}">
                                <td>
                                    <h4>付账方式：AA制</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dpay == '42'}">
                                <td>
                                    <h4>付账方式：男方付账</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dpay == '43'}">
                                <td>
                                    <h4>付账方式：女方付账</h4>
                                </td>
                            </c:if>
                        </tr>
                        <%--时间--%>
                        <tr>
                            <td>
                                <h4>时间：${inform.itime}${msg.mtime}${dating.ddate}&nbsp;${dating.dtime}</h4>
                            </td>
                        </tr>
                        <%--状态--%>
                        <tr>
                            <c:if test="${inform.istate == '31' || msg.mstate == '31'}">
                                <td>
                                    <h4>状态：已读</h4>
                                </td>
                            </c:if>
                            <c:if test="${inform.istate == '32' || msg.mstate == '32'}">
                                <td>
                                    <h4>状态：未读</h4>
                                </td>
                            </c:if>
                            <c:if test="${inform.istate == '33' || msg.mstate == '33'}">
                                <td>
                                    <h4>状态：已回复</h4>
                                </td>
                            </c:if>
                            <c:if test="${inform.istate == '34'}">
                                <td>
                                    <h4>状态：已参加</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dstate == '51'}">
                                <td>
                                    <h4>状态：待审核</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dstate == '52'}">
                                <td>
                                    <h4>状态：待处理</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dstate == '53'}">
                                <td>
                                    <h4>状态：已接受</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dstate == '54'}">
                                <td>
                                    <h4>状态：已拒绝</h4>
                                </td>
                            </c:if>
                            <c:if test="${dating.dstate == '55'}">
                                <td>
                                    <h4>状态：审核未通过</h4>
                                </td>
                            </c:if>
                        </tr>
                        <tr><td></td></tr>
                        <%--内容--%>
                        <tr>
                            <td colspan="3">
                                <h5>内容：${inform.icontext}${msg.mcontext}${dating.dcontext}</h5>
                            </td>
                        </tr>
                        <%--回复--%>
                        <c:if test="${dating.dreturn != null}">
                            <tr>
                                <td>
                                    <h5>回复：${dating.dreturn}</h5>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>

            <%---------------------按钮------------------------%>
            <div style="text-align: right ; padding-right: 140px ;">
                <%--系统消息--%>
                <c:if test="${inform.itype == '81'}">
                    <a href="<%=path%>/informManager/systemInform.action"><input type="button" class="button" value="返回"/></a>
                </c:if>
                <%--活动消息--%>
                <c:if test="${inform.itype == '82'}">
                    <a href="<%=path%>/jsp/${inform.iurl}.jsp"><input type="button" class="button" value="前往活动页"/></a>
                    <a href="<%=path%>/informManager/activeInform.action"><input type="button" class="button" value="返回"/></a>
                </c:if>
                <%--我的留言--%>
                <c:if test="${msg.mstate == '31' || msg.mstate == '32'}">
                    <input type="button" class="button" value="回复" id="reply"/>
                    <a href="<%=path%>/informManager/messageInform.action"><input type="button" class="button" value="返回"/></a>
                </c:if>
                <%--我的约会--%>
                <c:if test="${dating.dstate == '52'}">
                    <c:if test="${dating.dfromid != '1001'}"><%--<c:if test="${dating.dfromid != sessionScope.user.userid}">--%><%--本人发起的约会不应出现接受拒绝按钮--%>
                        <input type="button" class="button" value="回复并接受" id="replyAndAccept"/>
                        <input type="button" class="button" value="拒绝" id="reject"/>
                    </c:if>
                </c:if>
                <c:if test="${dating.dstate == '51' || dating.dstate == '52' || dating.dstate == '53' || dating.dstate == '54' || dating.dstate == '55'}">
                    <a href="<%=path%>/informManager/datingInform.action"><input type="button" class="button" value="返回"/></a>
                </c:if>
            </div>


        </div>
    </div>
</div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
<%--=======================================留言回复 弹出层=========================================--%>
<div class="layui-row" id="replyDiv" style="display: none;">
    <div class="layui-col-md10">
            <form class="layui-form" action="" method="post" id="replyOthers">
                <input type="hidden" name="mtoid" value="${msg.mfromid}" ><%--mfromid变成mtoid--%>

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
<%--=======================================约会回复 弹出层=========================================--%>
<div class="layui-row" id="acceptDiv" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="" method="post" id="acceptDating">
            <input type="hidden" name="dateid" value="${dating.dateid}" ><%--dateid--%>

            <div class="layui-form-item">
                <label class="layui-form-label" style="padding-left:-50px;">内容:</label>
                <div class="layui-input-block">
                            <textarea cols="10" rows="3" placeholder="请输入回复内容(建议填写联系方式，以便对方能和您联系)" lay-verify="myContext"
                                      name="dreturn" id="dreturn" class="layui-textarea"
                                      maxlength="100" style="resize: none;"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="padding-left: 50px;">
                    <button lay-submit="" lay-filter="rasum" class="layui-btn layui-btn-normal tijiao">回复并接受</button>
                </div>
            </div> 
        </form>
    </div>
</div>
</body>
<%--========================================留言回复AJAX===============================================--%>
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        var form=layui.form;
        var layer=layui.layer;
        $=layui.jquery;
        //弹出留言回复窗口
        $("#reply").on('click',function(){
            layer.open({
                type:1,
                title:"回复对方",
                skin:"myclass",//自定样式
                area:["600px","520px"],
                resize:false,
                content:$("#replyDiv").html(),

                success: function(layero, index){},
                yes:function(){
                }
            });
            form.render();//动态渲染
        });
        //弹出约会回复窗口
        $("#replyAndAccept").on('click',function(){
            layer.open({
                type:1,
                title:"回复对方并接受约会",
                skin:"myclass",//自定样式
                area:["600px","520px"],
                resize:false,
                content:$("#acceptDiv").html(),

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
                else if(value.length < 10)
                {
                    return '内容不可少于10字！';
                }
            }
        });
        //留言回复表单提交
        form.on('submit(suu)', function(data){
            if(confirm("确定回复吗？"))
            {
                $.ajax({
                    url:'<%=path%>/informManager/reply.action',
                    method:'post',
                    data:data.field,
                    dataType:'text',
                    success:function(res){
                        if(res == 'replySuccess')
                        {
                            alert("回复成功！");
                            location.href = "<%=path%>/informManager/messageInform.action";
                        }
                        else if(res == 'replyFail')
                        {
                            alert("回复失败！");
                        }
                    },
                    error:function (data) {
                        alert("未连接");
                    }
                }) ;
            }
            else
            {
                layer.msg("已取消");
            }
        });
        //约会回复表单提交
        form.on('submit(rasum)', function(data){
            if(confirm("确定接受约会吗？"))
            {
                $.ajax({
                    url: '<%=path%>/informManager/replyAndAccept.action',
                    method: 'post',
                    data: data.field,
                    dataType: 'text',
                    success: function (res) {
                        if (res == 'success') {
                            alert("回复并接受成功！");
                            window.location.href = "<%=path%>/informManager/datingInform.action";
                        } else if (res == 'fail') {
                            alert("回复并接受失败！");
                        }
                    },
                    error: function (data) {
                        alert("未连接");
                    }
                });
            }
            else
            {
                layer.msg("已取消");
            }
        });
        //拒绝约会 AJAX
        $("#reject").on('click',function(){
            if(confirm("确定拒绝约会吗？"))
            {
                $.ajax({
                    url:'<%=path%>/informManager/reject.action?dateid=${dating.dateid}',
                    method:'post',
                    // data:data.field,
                    dataType:'text',
                    success:function(res){
                        if(res == 'success')
                        {
                            alert("拒绝约会成功！");
                            location.href="<%=path%>/informManager/datingInform.action";
                        }
                        else if(res == 'fail')
                        {
                            alert("拒绝约会失败！");
                        }
                    },
                    error:function (data) {
                        alert("未连接");
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

