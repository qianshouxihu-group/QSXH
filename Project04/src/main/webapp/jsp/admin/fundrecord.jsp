<%--
  Created by IntelliJ IDEA.
  User: 17542
  Date: 2019/10/12
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>表格</title>
    <script  src="<%=path%>js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css" media="all">
    <script src="<%=path%>/layui/layui.js"></script>
</head>
<body>

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<%--条件查询--%>
<div class="layui-form">
    <div class="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">交易日期：</label>
                <div class="layui-input-inline" id="begindatediv">
                    <input type="text" name="begindate" id="begindate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">至</label>
                <div class="layui-input-inline "  id="enddatediv" >
                    <input type="text" name="enddate" id="enddate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">会员ID</label>
                <div class="layui-input-inline">
                    <input type="text" name="userid" id="userid"  class="layui-input" >
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block layui-show-xs-block">
                <span><button class="layui-btn"  data-type="reload"><i class="layui-icon">&#xe615;</i></button></span>
                <button type="button" class="layui-btn" id="conditionreset" >重置</button>
            </div>

        </div>
    </div>
    <!-- 数据表格开始 -->
    <div class="layui-card-body"  >

        <table class="layui-table" lay-filter="test" id="demo" align="center">
        </table>
    </div>
    <!-- 数据表格结束 -->
</div>

</body>


<script>

    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //重置查询条件
        $("#conditionreset").click(function () {
            $("#begindate").val("");
            $("#enddate").val("");
            $("#userid").val("");
            form.render();
        });

    });


    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#begindate' //指定元素
            ,done:function(value){
                //移除已经存在的日期
                $("#enddate").remove();
                $("#enddatediv").append('<input type="text" name="enddate" id="enddate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">');
                alert(value);
                if (value=='') {
                    value='1900-01-01';
                }
                alert(value);
                laydate.render({
                    elem:'#enddate',
                    type:'date',
                    min:value  // 最小日期不得小于第一个日期选择框的值
                })
            }
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#enddate' //指定元素
            ,done:function(value){
                //移除已经存在的日期
                $("#begindate").remove();
                $("#begindatediv").append('<input type="text" name="begindate" id="begindate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">');
                alert(value);
                if (value=='') {
                    value='2100-01-01';
                }
                alert(value);
                laydate.render({
                    elem:'#begindate',
                    type:'date',
                    max:value  // 最大日期不得大于第二个日期选择框的值
                })
            }
        });
    });
</script>
<script >
    layui.use([ 'table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render({
            elem: '#demo'
            ,limit: 10
            ,toolbar:"#userToolBar"
            ,id: 'docReload'
            ,url: '<%=path%>fund/fundList.action' //数据接口
            ,page: true //开启分页
            , parseData: function (res) {
                return {
                    "code": eval(res.code), //解析接口状态
                    // "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data//解析数据列表
                };
            }
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'userid', title: '会员ID', fixed: 'left'}
                ,{field: 'pname', title: '类型'}
                ,{field: 'agold', title: '金币额'}
                ,{field: 'adate', title: '交易日期'}
            ]]
        });

        //触发查询按钮
        var $ = layui.$, active = {
            reload: function(){
                var begindate = $('#begindate');
                var enddate = $('#enddate');
                var userid = $('#userid');
                //执行重载
                table.reload('docReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        begindate: begindate.val(),
                        enddate: enddate.val(),
                        userid: userid.val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        })

        //监听头部工具栏事件
        table.on("toolbar(test)",function(obj){
            switch(obj.event){
                case 'add':
                    openAddUser();
                    break;
                case 'getCheckData':
                    //得到选中的数据行
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    var params="";
                    $.each(data,function(i,item){
                        if(i==0){
                            params+="userids="+item.userid;
                        }else{
                            params+="&userids="+item.userid;
                        }
                    });
                    alert(params);
                    layer.confirm('真的删除选中的这些用户吗', function(index){
                        sendDelectData("<%=path%>testManager/deleteUsers.action",params);
                        layer.close(index);
                    });
                    break;
            };
        })

        var url;
        var mainIndex;
        //打开添加页面
        function openAddUser(){
            mainIndex=layer.open({
                type:1,
                title:'添加用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                success:function(index){
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url="user/addUser.action";
                }
            });
        }

        //打开修改页面
        function openUpdateUser(data){
            mainIndex=layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="<%=path%>testManager/updateUser.action";
                }
            });
        }
        //保存
        form.on("submit(doSubmit)",function(obj){
            //序列化表单数据
            var params=$("#dataFrm").serialize();
            gosave(url,params);
        });
        //ajax发送保存后的的数据
        function gosave(url,params) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: params,
                success: function (dat) {
                    if(dat==2){//更新两个表返回2
                        layer.msg("修改成功");
                    }else{
                        layer.msg("修改失败");
                    }
                    //关闭弹出层
                    layer.close(mainIndex);
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            begindate: begindate.value,
                            enddate: enddate.value,
                            userid: userid.value,

                        }
                    }, 'data');
                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }
        //监听行工具事件
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            alert(data.userid);
            if (obj.event === 'delete') {
                layer.confirm('确定删除用户？', function (index) {
                    fal("<%=path%>testManager/deleteUser.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'resetpwd') {
                layer.confirm('确定重置密码为123456？', function (index) {
                    fal("<%=path%>testManager/resetpwd.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'edit') {
                openUpdateUser(data);
            }
        });

        //删除或者重置密码
        function fal(url,userid) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: {"userid":userid},
                success: function (dat) {
                    if(dat==1){
                        layer.msg("修改成功");
                    }else{
                        layer.msg("修改失败");
                    }
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            begindate: begindate.value,
                            enddate: enddate.value,
                            userid: userid.value,

                        }
                    }, 'data');
                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }
        //批量删除操作，
        function sendDelectData(url,userids) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: userids,
                success: function (dat) {
                    if(dat==1){
                        layer.msg("修改成功");
                    }else{
                        layer.msg("修改失败");
                    }
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            begindate: begindate.value,
                            enddate: enddate.value,
                            userid: userid.value,

                        }
                    }, 'data');
                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }

    });

</script>

</html>

