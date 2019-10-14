<%--
  Created by IntelliJ IDEA.
  User: 17542
  Date: 2019/9/28
  Time: 11:45
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
    <link rel="stylesheet" href="<%=path%>layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="<%=path%>layui_ext/dtree/font/dtreefont.css">
    <script src="<%=path%>/layui/layui.js"></script>
</head>
<body>

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>角色分配权限菜单</legend>
</fieldset>
<%--条件查询--%>
<div class="layui-form">
    <!-- 数据表格开始 -->
    <div class="layui-card-body"  >
        <table class="layui-table" lay-filter="test" id="demo" align="center">
        </table>
    </div>
    <!-- 数据表格结束 -->


</div>


<!-- 角色分配菜单的弹出层开始 -->
<div style="display: none;" id="selectRoleMenu">
    <ul id="menuTree" class="dtree" data-id="0"></ul>
</div>
<!-- 角色分配菜单的弹出层结束 -->
</body>
<%--行操作按钮--%>
<script id="barDemo" type="text/html">

<%--    超级管理员才能分配权限--%>
    <c:if test="${sessionScope.manager.roleid=='1'}" var="flag" scope="session">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="selectRoleMenu">分配菜单</button>
        </div>
    </c:if>
</script>
<script >

    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //重置查询条件
        $("#conditionreset").click(function () {
            $("#rname").val("");
            form.render();
        });
    });

    layui.extend({
        dtree:'<%=path%>layui_ext/dist/dtree'
    }).use([ 'jquery', 'layer', 'form','dtree' ,'table'], function(){
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var dtree=layui.dtree;
        table.render({
            elem: '#demo'
            ,limits:[5,10]
            ,limit: 5
            ,toolbar:"#userToolBar"
            ,id: 'docReload'
            ,url: '<%=path%>role/select.action' //数据接口
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
                ,{field: 'roleid', title: 'ID', fixed: 'left'}
                ,{field: 'rname', title: '角色'}
                , {field: 'right', title: '权限', toolbar: '#barDemo', minWidth: 270}
            ]]
        });

        //触发查询按钮
        var $ = layui.$, active = {
            reload: function(){
                var rname = $('#rname');
                //执行重载
                table.reload('docReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        rname: rname.val(),
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
                    layer.confirm('确定删除选中的这些管理员吗', function(index){
                        sendDelectData("<%=path%>admin/deleteAdmins.action",params);
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
                    $("#userid1").removeAttr("readonly");
                    url="<%=path%>admin/addAdmin.action";
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
                    $("#userid1").attr("readonly",true);
                    url="<%=path%>admin/updateAdmin.action";
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
                    if(dat==1){//更新两个表返回2
                        layer.msg("修改成功");
                    }else{
                        layer.msg("修改失败");
                    }
                    //关闭弹出层
                    layer.close(mainIndex);
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            userid: userid.value,
                            uname: uname.value,
                            rname: rname.value,
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
            alert(data.roleid);
            if (obj.event === 'delete') {
                layer.confirm('确定删除用户？', function (index) {
                    fal("<%=path%>admin/deleteAdmin.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'resetpwd') {
                layer.confirm('确定重置密码为123456？', function (index) {
                    fal("<%=path%>admin/adminResetPwd.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'edit') {
                openUpdateUser(data);
            }else if (obj.event === 'selectRoleMenu') {
                openselectRoleMenu(data);
            }
        });

        //打开分配菜单的弹出层
        function openselectRoleMenu(data){
            var menuTree;
            mainIndex=layer.open({
                type:1,
                title:'分配【'+data.rname+'】的角色',
                content:$("#selectRoleMenu"),
                area:['400px','500px'],
                btnAlign:'c',
                btn:['<div class="layui-icon layui-icon-release">确认分配</div>','<div class="layui-icon layui-icon-close">取消分配</div>'],
                yes:function(index, layero){
                    var nodes = dtree.getCheckbarNodesParam("menuTree");
                    var params="roleid="+data.roleid;
                    alert(data.roleid);
                    $.each(nodes,function(i,item){
                        params+="&ids="+item.nodeId;
                    })
                    layer.alert(JSON.stringify(params), {
                        title: '最终的提交信息'
                    })
                    //保存角色和菜单的关系
                    $.post("<%=path%>roledemo/saveRoleMenu.action",params,function(obj){
                        layer.msg(obj.msg);
                    })
                },
                success:function(index){
                    //初始化树
                    menuTree = dtree.render({
                        elem: "#menuTree",
                        dataStyle: "layuiStyle",  //使用layui风格的数据格式
                        response:{message:"msg",statusCode:0},  //修改response中返回数据的定义
                        dataFormat: "list",  //配置data的风格为list
                        checkbar: true,
                        checkbarType: "all", // 默认就是all，其他的值为： no-all  p-casc   self  only\
                        checkbarData: "choose" ,
                        url: "<%=path%>roledemo/initRoleMenuTreeJson.action?roleid="+data.roleid // 使用url加载（可与data加载同时存在）
                    });
                }
            });
        }

    });

</script>

</html>



