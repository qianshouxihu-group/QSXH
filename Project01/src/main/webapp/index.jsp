<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>首页</title>
    <script src="js/jquery.min.js"></script>

    <script>

        $(function(){
            $("#btn1").click(function (){
                alert("hello");
                $.ajax({
                    url:"ajaxManager/ajaxTest1.action",   //请求服务器路径
                    data:'{"uname":"hhh","usex":"hh","ueducation":"h"}',	//参数请求对象
                    contentType:"application/json;charset=utf-8",
                    type:"post", //请求方式
                    dataType:"json",  //服务请返回的数据类型
                    success:function(result){
                        alert(result.uname);
                    }
                })

            })
        })
        //如果返回类型是json,封装成一个实体对象,则date需要加单引号'';
        //如果返回类型是text,date不需要加单引号'';

        $(function(){
            $("#btn2").click(function (){
                alert("hey");
                $.ajax({
                    url:"ajaxManager/ajaxTest2.action",   //请求服务器路径
                    data:'{"userid":"00001"}',	//参数请求对象
                    contentType:"application/json;charset=utf-8",
                    type:"post", //请求方式
                    dataType:"json",  //服务请返回的数据类型
                    success:function(result){
                        alert(result.a);
                    }
                })

            })
        })

    </script>

</head>
<body>

<form action="loginManager/login.action" method="post">
账号：<input type="text" name="uname"> <br/>
密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录">
</form>


<br/>
<button id="btn1">发送ajax请求1</button> <br/>
<br/>
<button id="btn2">发送ajax请求2</button> <br/>

</body>
</html>
