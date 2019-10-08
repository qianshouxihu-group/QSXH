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
                <label class="layui-form-label">注册日期：</label>
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
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="userid" id="userid"  class="layui-input" >
            </div>
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="uname" id="uname"  class="layui-input" >
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

    <%--=================================资料弹窗=================================--%>

<div style="display: none;padding: 20px" id="detailsDiv" >
    <form class="layui-form " action="" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">ID:</label>
                <div class="layui-input-inline">
                    <input type="text" name="userid"  lay-verify="required" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="uname" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身高:</label>
                <div class="layui-input-inline">
                    <input type="text" name="uheight" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">体重:</label>
                <div class="layui-input-inline">
                    <input type="text" name="uweight" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">婚姻状况:</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="umerried"  lay-verify="required">
                        <option value="未婚">未婚</option>
                        <option value="离异">离异</option>
                        <option value="丧偶">丧偶</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">月收入:</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="uincome"  lay-verify="required">
                        <option value="0-5000">0-5000</option>
                        <option value="5000-10000">5000-10000</option>
                        <option value="10000-15000">10000-15000</option>
                        <option value="15000-20000">15000-20000</option>
                        <option value="20000以上">20000以上</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">星座:</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="conste"  lay-verify="required">
                        <option value="白羊座">白羊座</option>
                        <option value="金牛座">金牛座</option>
                        <option value="双子座">双子座</option>
                        <option value="巨蟹座">巨蟹座</option>
                        <option value="狮子座">狮子座</option>
                        <option value="处女座">处女座</option>
                        <option value="天秤座">天秤座</option>
                        <option value="天蝎座">天蝎座</option>
                        <option value="射手座">射手座</option>
                        <option value="魔羯座">魔羯座</option>
                        <option value="水瓶座">水瓶座</option>
                        <option value="双鱼座">双鱼座</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">血型:</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="ublood"  lay-verify="required">
                        <option value="A">A型</option>
                        <option value="B">B型</option>
                        <option value="AB">AB型</option>
                        <option value="O">O型</option>
                        <option value="其它">其它血型</option>
                    </select>
                </div>

            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <input type="radio" name="usex" value="男" title="男">
                    <input type="radio" name="usex" value="女" title="女">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出生日期:</label>
                <div class="layui-input-inline">
                    <input type="text" name="ubirthday" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-form-item">
                <label class="layui-form-label">学历</label>
                <div class="layui-input-block" style="width:150px">
                    <select name="uedu"  lay-verify="required">
                        <option value="高中及以下">高中及以下</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="博士">博士</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="uaddress" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>


<%--        <div class="layui-form-item" style="text-align: center;">--%>
<%--            <div class="layui-input-block">--%>
<%--                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>--%>
<%--                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>--%>
<%--            </div>--%>
<%--        </div>--%>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

</body>
<%--===========================行操作按钮================================--%>
<script id="barDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="pass">通过</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="nopass">不通过</button>
        <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="details">查看资料</button>
    </div>
</script>

<script>

    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //重置查询条件
        $("#conditionreset").click(function () {
            $("#begindate").val("");
            $("#enddate").val("");
            $("#userid").val("");
            $("#uname").val("");
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
            ,url: '<%=path%>checkManager/regCheckList.action' //数据接口
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
                ,{field: 'userid', title: 'ID', fixed: 'left'}
                ,{field: 'uname', title: '姓名'}
                // ,{field: 'usex', title: '性别'}
                ,{field: 'ubirthday', title: '出生日期'}
                ,{field: 'uedu', title: '学历'}
                ,{field: 'uaddress', title: '地址'}
                ,{field: 'regdate', title: '注册日期'}
                ,{field: 'right', title: '操作', toolbar: '#barDemo', minWidth: 270}
            ]]
        });

        /*=================================触发查询按钮=====================================*/
        var $ = layui.$, active = {
            reload: function(){
                var begindate = $('#begindate');
                var enddate = $('#enddate');
                var userid = $('#userid');
                var uname = $('#uname');
                // var uedu = $('#uedu');
                //执行重载
                table.reload('docReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        begindate: begindate.val(),
                        enddate: enddate.val(),
                        userid: userid.val(),
                        uname: uname.val(),
                        // uedu: uedu.val(),
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
                    $.each(data,function(i,item){
                        if(i==0){
                            params+="userids="+item.userid;
                        }else{
                            params+="&userids="+item.userid;
                        }
                    });
                    alert(params);
                    layer.confirm('确定全部通过吗？', function(index){
                        allCheck("<%=path%>checkManager/allPass.action",params);
                        layer.close(index);
                    });

                    break;
                case 'allNoPass':
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
                    layer.confirm('确定全部不通过吗？', function(index){
                        allCheck("<%=path%>checkManager/allNoPass.action",params);
                        layer.close(index);
                    });
                    break;
            };
        })
        /*================================批量操作AJAX=================================*/
        function allCheck(url,userids) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: userids,
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
                            begindate: begindate.value,
                            enddate: enddate.value,
                            userid: userid.value,
                            uname: uname.value,
                            // uedu: uedu.value,
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
                url: "<%=path%>checkManager/dataDetails.action",
                dataType: "json",
                data: {"userid":data.userid},
                success: function (redata) {
                    alert(redata.uname+"===="+redata.usex);
                    mainIndex=layer.open({
                        type:1,
                        title:'资料详情',
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

        //打开修改页面
        function openUpdateUser(data){
            mainIndex=layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="<%=path%>admin/updateUser.action";
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
                            uname: uname.value,
                            uedu: uedu.value,
                        }
                    }, 'data');
                },
                error: function (dat) {
                    layer.msg('断开');
                }
            })

        }
        /*==========================监听行工具事件=======================*/
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            alert(data.userid);
            if (obj.event === 'nopass') {
                layer.confirm('确定不通过吗？', function (index) {
                    fal("<%=path%>checkManager/nopass.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'pass') {
                layer.confirm('确定通过吗？', function (index) {
                    fal("<%=path%>checkManager/pass.action",data.userid);
                    layer.close(index);
                });
            }else if (obj.event === 'details'){
                openDetails(data);
            }
        });

        /*==========================行工具 通过不通过查看资料AJAX========================*/
        function fal(url,userid) {
            $.ajax({
                async: true,
                type: "post",
                url: url,
                dataType: "text",
                data: {"userid":userid},
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
                            begindate: begindate.value,
                            enddate: enddate.value,
                            userid: userid.value,
                            uname: uname.value,
                            // uedu: uedu.value,
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

