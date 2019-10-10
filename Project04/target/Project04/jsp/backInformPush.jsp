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
    <title>系统推送</title>
    <script  src="<%=path%>js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css" media="all">
    <script src="<%=path%>/layui/layui.js"></script>
</head>
<body>

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<%--============================查询条件================================--%>
<div class="layui-form">
    <div class="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">推送日期：</label>
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
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-inline">
                <select name="itype" id="itype">
                    <option value="">请选择</option>
                    <option value="81">系统消息</option>
                    <option value="82">活动消息</option>
                </select>
            </div>
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="ititle" id="ititle"  class="layui-input" >
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
        <div style="display: none;" id="userToolBar"><%--头部按钮--%>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="newPush">新增推送</button>
<%--            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="newRecord">新增消息记录</button>--%>
        </div>
        <table class="layui-table" lay-filter="test" id="demo" align="center">
        </table>
    </div>
    <!-- 数据表格结束 -->
</div>

    <%--=================================新增推送 弹窗=================================--%>

<div style="display: none;padding: 20px" id="addPushDiv" >
    <form class="layui-form " action="" lay-filter="dataForm" id="dataForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">标题:</label>
                <div class="layui-input-inline">
                    <input type="text" name="ititle" id="ititle2" autocomplete="off"<%--autocomplete自动完成--%>
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">类型:</label>
                <div class="layui-input-inline">
                    <select name="itype" id="itype2">
                        <option value="81">系统消息</option>
                        <option value="82">活动消息</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">内容:</label>
                <div class="layui-input-inline">
                    <textarea cols="25" rows="5" name="icontext" id="icontext2" autocomplete="off"
                              class="layui-input"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">收到人:</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="itoid" id="itoid2">
                        <option value="all">所有用户</option>
                        <option value="allMan">所有男用户</option>
                        <option value="allWomen">所有女用户</option>
                        <option value="allUser">所有普通用户</option>
                        <option value="allVip">所有会员用户</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">url:</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="iurl" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
            </div>
        </div>

    </form>

</div>
<!-- 新增推送 弹出层结束 -->
<%--==================================================消息详情 弹窗==========================================================--%>
<div style="display: none;padding: 20px" id="detailsDiv" >
    <form class="layui-form " action="" lay-filter="dataForm3" id="dataForm3">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">标题:</label>
                <div class="layui-input-inline">
                    <input type="text" name="ititle" id="ititle3" readonly="readonly" autocomplete="off"<%--autocomplete自动完成--%>
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">类型:</label>
                <div class="layui-input-inline">
                    <input type="text" name="pname" id="itype3" readonly="readonly" autocomplete="off"<%--autocomplete自动完成--%>
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">内容:</label>
                <div class="layui-input-inline">
                    <textarea cols="50" rows="5" name="icontext" readonly="readonly" id="icontext3" autocomplete="off"
                              class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">收到人:</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="itoid" id="itoid3" readonly="readonly" autocomplete="off"<%--autocomplete自动完成--%>
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">url:</label>
                <div class="layui-input-block" style="width:150px">
                    <input type="text" name="iurl" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

    </form>

</div>
<%--消息详情 弹窗结束--%>
</body>
<%--===========================行操作按钮================================--%>
<script id="barDemo" type="text/html">
    <div class="layui-btn-container">
<%--        <button class="layui-btn layui-btn-sm" lay-event="pass">通过</button>--%>
<%--        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="nopass">不通过</button>--%>
        <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="details">查看详情</button>
    </div>
</script>

<script>
/*===========================================初始化查询条件与格式化日期======================================*/
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //重置查询条件
        $("#conditionreset").click(function () {
            $("#begindate").val("");
            $("#enddate").val("");
            $("#ititle").val("");
            $("#itype").val("");
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
            ,url: '<%=path%>informPushManager/informList.action' //数据接口
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
                 // {type: 'checkbox', fixed: 'left'}
                ,{field: 'informid', title: 'ID', fixed: 'left'}
                ,{field: 'ititle', title: '标题'}
                ,{field: 'icontext', title: '内容'}
                ,{field: 'pname', title: '类型'}
                ,{field: 'itime', title: '时间'}
                // ,{field: 'itoid', title: '接收人'}
                ,{field: 'iurl', title: 'url'}
                ,{field: 'right', title: '操作', toolbar: '#barDemo', minWidth: 270}
            ]]
        });

        /*=================================触发查询按钮=====================================*/
        var $ = layui.$, active = {
            reload: function(){
                var begindate = $('#begindate');
                var enddate = $('#enddate');
                var itype = $('#itype');
                var ititle = $('#ititle');
                //执行重载
                table.reload('docReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        begindate: begindate.val(),
                        enddate: enddate.val(),
                        itype: itype.val(),
                        ititle: ititle.val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        })

        /*==========================监听行工具事件  查看详情=======================*/
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            alert(data.userid);
            if (obj.event === 'details'){
                openDetails(data);
            }
        });
        /*==============================打开消息详情页面=========================*/
        var url;
        var mainIndex;
        function openDetails(data){
            $.ajax({
                async: true,
                type: "post",
                url: "<%=path%>informPushManager/informDetails.action",
                dataType: "json",
                data: {"informid":data.informid},
                success: function (redata) {
                    alert(redata.ititle+"===="+redata.icontext);
                    mainIndex=layer.open({
                        type:1,
                        title:'历史推送详情',
                        content:$("#detailsDiv"),
                        area:['800px','400px'],
                        success:function(index){
                            //清空表单数据
                            $("#dataForm3")[0].reset();
                            form.val("dataForm3",redata);
                            // url="userBase/addUser.action";
                        }
                    });

                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })
        }
        /*=========================监听头部工具栏事件=============================*/
        table.on("toolbar(test)",function(obj){
            switch(obj.event){
                case 'newPush':
                    openAddPush();
                    break;

            };
        })
        /*=========================打开新增推送页面================================*/
        function openAddPush(){
            mainIndex=layer.open({
                type:1,
                title:'新增推送',
                content:$("#addPushDiv"),
                area:['800px','400px'],
                success:function(index){
                    $("#dataForm")[0].reset();
                    // form.val("dataFrm",data);
                    <%--url="<%=path%>admin/updateUser.action";--%>
                }
            });
        }
        //推送提交
        form.on("submit(doSubmit)",function(obj){
            //序列化表单数据
            var params=$("#dataForm").serialize();
            pushSubmit(params);
        });
        //ajax发送推送数据
        function pushSubmit(params) {
            $.ajax({
                async: true,
                type: "post",
                url: "<%=path%>informPushManager/addPush.action",
                dataType: "text",
                data: params,
                success: function (dat) {
                    if(dat=="success"){
                        layer.msg("推送成功！");
                    }else if (dat == "fail") {
                        layer.msg("推送失败！");
                    }
                    //关闭弹出层
                    layer.close(mainIndex);
                    //执行重载
                    table.reload('docReload', {
                        where: {
                            begindate: begindate.value,
                            enddate: enddate.value,
                            itype: itype.value,
                            ititle: ititle.value,
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

