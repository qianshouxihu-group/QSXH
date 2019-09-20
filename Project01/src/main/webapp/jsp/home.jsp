<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <base href="<%=basePath%>">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 22px;" >后台管理中心</div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                  <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${useM.uname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>" target="inform" >用户查询</a></dd>
                        <dd><a href=".action" target="inform" >用户管控</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">文档管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href=".action" target="inform">文档审核</a></dd>
                        <dd><a href=";" target="inform">文档配置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统配置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="inform">上传奖励配置</a></dd>
                        <dd><a href="" target="inform">注册奖励配置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="" target="inform">日志列表</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <!--<div style="padding: 15px;">内容主体区域</div>-->
        <iframe name ="inform" style="width:100%;height: 100%;" ></iframe>
    </div>

    <div class="layui-footer">
        Copyright© layui.com - 2019/9/15/ 练习用
    </div>
</div>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
