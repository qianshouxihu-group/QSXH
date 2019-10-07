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
    <a href="<%=path%>/jsp/backRegCheck.jsp">后台注册审核</a>
    <input type="button" id="leaveMessage" value="给TA留言"/>

</form>


<%--=======================================留言回复 弹出层=========================================--%>
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
<%--========================================留言回复AJAX===============================================--%>
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
        //弹出约会回复窗口
        // $("#replyAndAccept").on('click',function(){
        //     layer.open({
        //         type:1,
        //         title:"回复对方并接受约会",
        //         skin:"myclass",//自定样式
        //         area:["600px","520px"],
        //         resize:false,
        //         content:$("#acceptDiv").html(),
        //
        //         success: function(layero, index){},
        //         yes:function(){
        //         }
        //     });
        //     form.render();//动态渲染
        // });

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
        //约会回复表单提交
        <%--form.on('submit(rasum)', function(data){--%>
        <%--    if(confirm("确定接受约会吗？"))--%>
        <%--    {--%>
        <%--        $.ajax({--%>
        <%--            url: '<%=path%>/informManager/replyAndAccept.action',--%>
        <%--            method: 'post',--%>
        <%--            data: data.field,--%>
        <%--            dataType: 'text',--%>
        <%--            success: function (res) {--%>
        <%--                if (res == 'success') {--%>
        <%--                    alert("回复并接受成功！");--%>
        <%--                    location.href = "<%=path%>/informManager/datingInform.action";--%>
        <%--                } else if (res == 'fail') {--%>
        <%--                    alert("回复并接受失败！");--%>
        <%--                }--%>
        <%--            },--%>
        <%--            error: function (data) {--%>
        <%--                alert("未连接");--%>
        <%--            }--%>
        <%--        });--%>
        <%--    }--%>
        <%--    else--%>
        <%--    {--%>
        <%--        layer.msg("已取消");--%>
        <%--    }--%>
        <%--});--%>
        //拒绝约会 AJAX
        <%--$("#reject").on('click',function(){--%>
        <%--    if(confirm("确定拒绝约会吗？"))--%>
        <%--    {--%>
        <%--        $.ajax({--%>
        <%--            url:'<%=path%>/informManager/reject.action?dateid=${dating.dateid}',--%>
        <%--            method:'post',--%>
        <%--            // data:data.field,--%>
        <%--            dataType:'text',--%>
        <%--            success:function(res){--%>
        <%--                if(res == 'success')--%>
        <%--                {--%>
        <%--                    alert("拒绝约会成功！");--%>
        <%--                    location.href="<%=path%>/informManager/datingInform.action";--%>
        <%--                }--%>
        <%--                else if(res == 'fail')--%>
        <%--                {--%>
        <%--                    alert("拒绝约会失败！");--%>
        <%--                }--%>
        <%--            },--%>
        <%--            error:function (data) {--%>
        <%--                alert("未连接");--%>
        <%--            }--%>
        <%--        }) ;--%>
        <%--    }--%>
        <%--    else--%>
        <%--    {--%>
        <%--        layer.msg("已取消");--%>
        <%--    }--%>
        <%--});--%>
    });
</script>
</html>
