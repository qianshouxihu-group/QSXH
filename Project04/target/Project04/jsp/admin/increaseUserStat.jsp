<%--
  Created by IntelliJ IDEA.
  User: 17542
  Date: 2019/10/9
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath()+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>vip购买统计</title>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css" media="all" />
    <%--    <link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />--%>
</head>
<body style="height: 100%; margin: 0">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year" readonly="readonly" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->
<div id="container" style="height: 500px"></div>
<script type="text/javascript" src="<%=path%>echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script src="<%=path%>layui/layui.js"></script>

<script type="text/javascript">
    layui.use([ 'jquery', 'layer', 'form', 'table','laydate'  ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate=layui.laydate;

        laydate.render({
            elem:'#year',
            type:'year',
            value:new Date()
        });
        $("#doSearch").click(function(){
            getData();
        });

        function getData(){
            var year=$("#year").val();
            if(year===""){
                year=new Date().getFullYear();
            }
            $.get("<%=path%>stat/loadIncreaseUserYearStat.action",{year:year},function(data){
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    title : {
                        text: '新增用户统计',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    xAxis: {
                        type: 'category',
                        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: data,
                        type: 'line'
                    }]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            });
        }
        getData();
    });

</script>
</body>
</html>

