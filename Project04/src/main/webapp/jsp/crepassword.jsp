<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.collapse.js" ></script>
</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">

        </div>
        <div class="top-right">
            <a href="">注册</a> |
            <a href="">登录</a>
        </div>
    </div>
    <div class="top-ban">
        <div class="top-mid-box">
            <a href="" class="logo"><img src="images/logo.png"/></a>
            <div class="adv"><img src="images/adv.png"/></div>
        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="">网站首页</a>
        <a href="">了解我们</a>
        <a href="">条件搜索</a>
        <a href="">智能匹配</a>
        <a href="">会员服务 </a>
        <a href="">活动专题 </a>
        <a href="">我的消息 </a>
        <a href="">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <div class="main-right" style="margin-left: 0; margin-right: 14px;"><!--right-->
            <div class="list-main1-title">个人中心</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="personalManager/myHomePage.action">我的主页</a></div>
                <div class="list-top"><a href="personalManager/myPhotograph.action">我的照片</a></div>
                <div class="list-top"><a href="MyFollowManager/getlist.action">我的关注</a></div>
                <div class="list-top"><a href="personalManager/aboutBasic.action">基本资料</a></div>
                <div class="list-top"><a href="personalManager/aboutCP.action">择偶条件</a></div>
                <div class="css3-animated-example">
                    <h3>详情资料</h3>
                    <div>
                        <div class="content">
                            <p><a href="personalManager/aboutWS.action">工作学习</a></p>
                            <p><a href="personalManager/aboutHabit.action">兴趣爱好</a></p>
                            <p><a href="personalManager/aboutLimit.action">个性要求</a></p>
                        </div>
                    </div>
                </div>
                <div class="css3-animated-example">
                    <h3  class="cur" style=" border-bottom: 0;">系统设置</h3>
                    <div>
                        <div class="content">
                            <p><a href="">密码修改</a></p>
                        </div>
                    </div>
                </div>
            </div><!--menu-->
        </div><!--right-->
        <div class="main-left"><!--left-->
            <div class="s-address">当前位置：<a href="">首页 </a>&gt;个人中心&gt;系统设置</div>
            <div class="safty">
                <form onsubmit="return checkData()" action="personalManager/rePassWord.action" method="post">
                    <div class="tit">修改密码    >></div>
                    <ul class="safty-list">
                        <li>
                            <span><i>*</i>原密码：</span>
                            <input type="password" class="name-input" placeholder=" 6-18位字母、数字的组合" id="pw1" onblur="return checkPass()"/>
                            <span id="s1"></span>
                        </li>
                        <li>
                            <span><i>*</i>新密码：</span>
                            <input type="password" class="name-input" placeholder=" 6-18位字母、数字的组合 " id="pw2" onblur="return checkNewPass()"/>
                            <span id="s2"></span>
                        </li>
                        <li>
                            <span><i>*</i>确认新密码：</span>
                            <input type="password" class="name-input" placeholder=" 与新密码保持一致 "  id="pw3"  name="newupass"  onblur="return checkRePass()"/>
                            <span id="s3"></span>
                        </li>
                        <li>
                            <span id="s4" style="color: red"></span>
                        </li>
                    </ul>
                    <div class="btn-box">
                        <input type="submit" value="提交" class="save-btn"/>
                    </div>
                </form>
            </div>
        </div><!--left-->
    </div>

    <div class="copy">
        <p>Copyright©2019    厦门牵手西湖婚恋交友网     版权所有  </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-000-000  技术支持：<a target="_blank" href="http://www.cykjgroup.com/">传一科技</a></p>
    </div>
</div>

<script>
    $(".css3-animated-example").collapse({
        accordion: true,
        open: function() {
            this.addClass("open");
            this.css({ height: this.children().outerHeight() });
        },
        close: function() {
            this.css({ height: "0px" });
            this.removeClass("open");
        }
    });

    var count = 0;
    <%--验证密码是否正确--%>
    function checkPass() {
        var password = $("#pw1").val();
        $.ajax({
            url:"personalManager/checkPassWord.action",   //请求服务器路径
            data:{"upass":password},	//参数请求对象
            // contentType:"application/json;charset=utf-8",
            type:"post", //请求方式
            dataType:"json",  //服务请返回的数据类型
            success:function(data){
                if ("1"==data){
                    $("#s1").html("✔");
                    count++;
                    return true ;
                } else{
                    $("#s1").html(" 密码错误！");
                    return false ;
                }
            }
        })
    }

    <%--密码不为空、格式验证--%>
    function checkNewPass()
    {
        var password = $("#pw2").val();
        var test=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;
        if(null == password || 0 == password.length)
        {
            $("#s2").html(" 密码不可为空！");
            return false;
        }
        else if (!test.test(password))
        {
            $("#s2").html("格式不正确！");
            return false;
        }
        else
        {
            $("#s2").html("✔");
            count++;
            return true;
        }
    }
    <%--重复密码验证--%>
    function checkRePass() {
        var pass = $("#pw2").val();
        var repass = $("#pw3").val();
        if(null == repass || 0 == repass.length)
        {
            $("#s3").html("请确认密码！");
            return false;
        }
        else if(pass != repass)
        {
            $("#s3").html("输入不一致！");
            return false;
        }
        else
        {
            $("#s3").html("✔");
            count++;
            return true;
        }
    }
    <%--提交数据完整性验证--%>
    function checkData() {
        if (count>=3){
            return true ;
        }else {
            $("#s4").html("操作有误！");
            return false ;
        }
    }
</script>
</body>
</html>

