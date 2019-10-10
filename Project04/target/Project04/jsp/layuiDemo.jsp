<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/30
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <%--layui--%>
    <script  src="js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>
</head>
<body>
<button id="reply" class="layui-btn layui-btn-sm">回复对方</button>
<div class="layui-row" id="test" style="display: none;">
                <div class="layui-col-md10">
                    <form class="layui-form" action="" method="post" id="replyOthers">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="padding-left:-50px;">标题:</label>
                            <div class="layui-input-block">
                                <input type="text" autofocus placeholder="请输入标题" lay-verify="myTitle"
                                       name="myTitle" id="myTitle" class="layui-input">
                            </div>
                        </div>
                      
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="padding-left:-50px;">内容:</label>
                            <div class="layui-input-block">
                                <textarea cols="10" rows="3" placeholder="请输入内容" lay-verify="myContext"
                                          name="myContext" id="myContext" class="layui-textarea"
                                          maxlength="100" style="resize: none;">

                                </textarea>
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
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        var form=layui.form;
        var layer=layui.layer;
        $=layui.jquery;



        $("#reply").on('click',function(){
            layer.open({
                type:1,
                title:"回复对方",
                skin:"myclass",//自定样式
                area:["600px","520px"],
                resize:false,
                content:$("#test").html(),

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
        //表单提交
        form.on('submit(suu)', function(data){
            $.ajax({
                url:'<%=path%>/informManager/reply.action',
                method:'post',
                data:data.field,
                dataType:'JSON',
                success:function(res){
                    alert(res);
                    if(res.code='0'){
                        parent.closeIframe(res.msg);
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            }) ;

        });
    });
</script>
</html>
