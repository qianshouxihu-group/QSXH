<%--
  Created by IntelliJ IDEA.
  User: 17542
  Date: 2019/10/11
  Time: 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath()+"/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>会员性别统计</title>
</head>
<body style="height: 100%; margin: 0">

<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="<%=path%>echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $.get("<%=path%>stat/loadUserAgeStat.action",function(data){
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title : {
                text: '会员年龄段统计',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series : [
                {
                    name: '客户数量(占比)',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:data,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    })

</script>
</body>
</html>

