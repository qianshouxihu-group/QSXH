<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/28
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<%--============================条件查询================================--%>
<div class="layui-form">
    <div class="demoTable">
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">发起人id：</label>
                <div class="layui-input-inline" id="dfromiddiv">
                    <input type="text" name="dfromid" id="dfromid" <%--lay-verify="date"--%>
                           placeholder="请输入发起人id" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">接受人id：</label>
                <div class="layui-input-inline "  id="dtoiddiv" >
                    <input type="text" name="dtoid" id="dtoid" <%--lay-verify="date"--%>
                           placeholder="请输入接受人id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">约会日期：</label>
                <div class="layui-input-inline" id="begindatediv">
                    <input type="text" name="begindate" id="begindate" lay-verify="date"
                           placeholder="请选择起始日期" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">至:</label>
                <div class="layui-input-inline "  id="enddatediv" >
                    <input type="text" name="enddate" id="enddate" lay-verify="date"
                           placeholder="请选择终止日期" autocomplete="off" class="layui-input">
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
    <!-- ==============================数据表格开始============================ -->
    <div class="layui-card-body"  >
        <div style="display: none;" id="userToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="allPass">批量通过</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="allNoPass">批量不通过</button>
        </div>
        <table class="layui-table" lay-filter="test" id="demo" align="center">
        </table>
    </div>
    <!-- 数据表格结束 -->
</div>

    <%--=================================详情弹窗=================================--%>
<div style="display: none;padding: 20px" id="detailsDiv" >
    <form class="layui-form " action="" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">日期:</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="ddate" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">时间:</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="dtime" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">发起人ID：</label>
                <div class="layui-input-block">
                    <input type="text" name="dfromid" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">接受人ID:</label>
                <div class="layui-input-block">
                    <input type="text" name="dtoid" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">内容：</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="dcontext" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地点:</label>
                <div class="layui-input-block">
                    <input type="text" name="daddress" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">付账方式：</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="dpay" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-block">
                    <input type="text" name="dstate" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

    </form>

</div>

</body>
<%--===========================行操作按钮================================--%>
<script id="barDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="pass">通过</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="nopass">不通过</button>
        <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="details">查看详情</button>
    </div>
</script>

<script>

    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //重置查询条件
        $("#conditionreset").click(function () {
            $("#dfromid").val("");
            $("#dtoid").val("");
            $("#begindate").val("");
            $("#enddate").val("");
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
                $("#enddatediv").append('<input type="text" name="enddate" id="enddate" lay-verify="date"\n' +
                    '                           placeholder="请选择终止日期" autocomplete="off" class="layui-input">');
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
                $("#begindatediv").append('<input type="text" name="begindate" id="begindate" lay-verify="date"\n' +
                    '                           placeholder="请选择起始日期" autocomplete="off" class="layui-input">');
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
    /*================================初始加载===================================*/
    layui.use([ 'table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render({
            elem: '#demo'
            // ,height: 312
            ,limits: [3,5,10]
            ,limit: 5 //每页默认显示的数量
            ,toolbar:"#userToolBar"
            ,id: 'docReload'
            ,url: '<%=path%>checkManager/datingCheckList.action' //数据接口
            ,page: true //开启分页
            ,parseData: function (res) {

                return {
                    "code": eval(res.code), //解析接口状态
                    // "msg": res.msg,      //解析提示文本
                    "count": res.count,     //解析数据长度
                    "data": res.data        //解析数据列表
                };
            }
            ,cols: [[ //表头
                 {type: 'checkbox', fixed: 'left'}
                ,{field: 'dfromid', title: '发起人', fixed: 'left'}
                ,{field: 'dtoid', title: '接受人'}
                ,{field: 'ddate', title: '约会日期'}
                ,{field: 'dtime', title: '约会时间'}
                ,{field: 'dcontext', title: '内容'}
                ,{field: 'daddress', title: '约会地址'}
                ,{field: 'right', title: '操作', toolbar: '#barDemo', minWidth: 270}
            ]]
        });

        /*=================================触发查询按钮=====================================*/
        var $ = layui.$, active = {
            reload: function(){
                var dfromid = $('#dfromid');
                var dtoid = $('#dtoid');
                var begindate = $('#begindate');
                var enddate = $('#enddate');
                //执行重载
                table.reload('docReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        dfromid: dfromid.val(),
                        dtoid: dtoid.val(),
                        begindate: begindate.val(),
                        enddate: enddate.val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        })

        /*=========================监听头部工具栏事件=============================*/
        table.on("toolbar(test)",function(obj){
            switch(obj.event){
                case 'allPass':
                    // openAddUser();
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    var params="";
                    var params2="";
                    $.each(data,function(i,item){
                        if(i==0){
                            params+="dateids="+item.dateid;
                            params2+="dfromids="+item.dfromid;
                        }else{
                            params+="dateids="+item.dateid;
                            params2+="dfromids="+item.dfromid;
                        }
                    });
                    alert(params);
                    alert(params2);
                    layer.confirm('确定全部通过吗？', function(index){
                        allCheck("<%=path%>checkManager/datingAllPass.action",params , params2);
                        layer.close(index);
                    });

                    break;
                case 'allNoPass':
                    //得到选中的数据行
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    var params="";
                    var params2="";
                    $.each(data,function(i,item){
                        if(i==0){
                            params+="dateids="+item.dateid;
                            params2+="dfromids="+item.dfromid;
                        }else{
                            params+="dateids="+item.dateid;
                            params2+="dfromids="+item.dfromid;
                        }
                    });
                    alert(params);
                    alert(params2);
                    layer.confirm('确定全部不通过吗？', function(index){
                        allCheck("<%=path%>checkManager/datingAllNoPass.action",params , params2);
                        layer.close(index);
                    });
                    break;
            };
        })
        /*================================批量操作AJAX=================================*/
        function allCheck(url,dateids,dfromids) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: {dateids:dateids ,dfromids:dfromids},
                success: function (dat) {
                    if(dat=="passSuccess"){
                        layer.msg("批量通过成功！");
                    }else if(dat=="passFail"){
                        layer.msg("批量通过失败！");
                    }else if(dat=="noPassSuccess"){
                        layer.msg("批量不通过成功！");
                    }else if(dat=="noPassFail"){
                        layer.msg("批量不通过失败！");
                    }
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            dfromid: dfromid.value,
                            dtoid: dtoid.value,
                            begindate: begindate.value,
                            enddate: enddate.value,
                        }
                    }, 'data');
                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }
        /*==============================打开资料详情页面=========================*/
        var url;
        var mainIndex;
        function openDetails(data){
            $.ajax({
                async: true,
                type: "post",
                url: "<%=path%>checkManager/datingDetails.action",
                dataType: "json",
                data: {"dateid":data.dateid},
                success: function (redata) {
                    alert(redata.ddateid+"===="+redata.dcontext);
                    mainIndex=layer.open({
                        type:1,
                        title:'约会详情',
                        content:$("#detailsDiv"),
                        area:['800px','400px'],
                        success:function(index){
                            //清空表单数据
                            // $("#dataFrm")[0].reset();
                            form.val("dataFrm",redata);
                            // url="userBase/addUser.action";
                        }
                    });

                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }
        /*==========================监听行工具事件=======================*/
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            alert(data.dateid);
            if (obj.event === 'nopass') {
                layer.confirm('确定不通过吗？', function (index) {
                    fal("<%=path%>checkManager/datingNopass.action",data.dateid , data.dfromid);
                    layer.close(index);
                });
            }else if (obj.event === 'pass') {
                layer.confirm('确定通过吗？', function (index) {
                    fal("<%=path%>checkManager/datingPass.action",data.dateid , data.dfromid);
                    layer.close(index);
                });
            }else if (obj.event === 'details'){
                openDetails(data);
            }
        });

        /*==========================行工具 通过不通过查看资料AJAX========================*/
        function fal(url,dateid,dfromid) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: {"dateid":dateid , "dfromid":dfromid},
                success: function (dat) {
                    if(dat=="noPassSuccess"){
                        layer.msg("不通过成功！");
                    }else if (dat=="noPassFail") {
                        layer.msg("不通过失败");
                    }else if (dat=="passSuccess") {
                        layer.msg("通过成功");
                    }else if (dat=="passFail") {
                        layer.msg("通过失败");
                    }
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            dfromid: dfromid.value,
                            dtoid: dtoid.value,
                            begindate: begindate.value,
                            enddate: enddate.value,
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

