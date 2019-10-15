<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

<html>
<head>
    <title>Title</title>
    <%--layui--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>
</head>
<body>

<form action="testManager2/login.action" method="post">
    账号：<input type="text" name="uname"> <br/>
    密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录">

    <%--测试--%>
    <a href="<%=path%>/jsp/clientReg.jsp">注册</a>
    <a href="<%=path%>/informManager/systemInform.action">我的消息</a>
    <a href="<%=path%>/jsp/admin/backRegCheck.jsp">后台注册审核</a>
    <a href="<%=path%>/jsp/admin/backDatingCheck.jsp">后台约会审核</a>
    <a href="<%=path%>/jsp/admin/backInformPush.jsp">后台消息推送</a>
    <input type="button" id="leaveMessage" value="给TA留言"/>
    <input type="button" id="dating" value="和TA约会"/>


</form>


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
