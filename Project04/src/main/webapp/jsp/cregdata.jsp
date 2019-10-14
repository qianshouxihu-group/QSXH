<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-fileinput.css" rel="stylesheet">

    <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.collapse.js" charset="utf-8" ></script>
    <script src="js/bootstrap-fileinput.js"></script>
    <link type="text/css" rel="stylesheet" href="css/chat.css"/>
    <script type="text/javascript" src="js/chatserver.js" ></script>
    <script type="text/javascript" src="js/chat.js" ></script>

</head>
<body>
<div class="head">
    <div class="top">
        <div class="top-left">

        </div>
        <div class="top-right">
            <c:choose>
                <c:when test="${ sessionScope.user!=null }">
                    <a>${ sessionScope.user.uname },欢迎您！</a>|
                    <a href="testManager/outLogin.action">注销</a>
                </c:when>
                <c:otherwise>
                    <a href="<%=path%>/jsp/clientReg.jsp">注册</a> |
                    <a href="<%=path%>/jsp/login.jsp">登录</a>
                </c:otherwise>
            </c:choose>
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
        <a href="matchUser/matchByTime.action?limitString=12">网站首页</a>
        <a href="jsp/clientAboutUs.jsp">了解我们</a>
        <a id="searchUser" href="matchUser/smartMatch.action?limitString=30&usex=${user.usex}&condition=charm">条件搜索</a>
        <a href="matchUser/smartUser.action?id=${sessionScope.user.userid}&roleid=${sessionScope.user.roleid}">智能匹配</a>
        <a href="jsp/beVip.jsp">会员服务 </a>
        <a href="jsp/clientActiveList.jsp">活动专题 </a>
        <a href="<%=path%>/informManager/systemInform.action">我的消息 <div class="my-notice">${countList.get(0)+countList.get(1)+countList.get(2)+countList.get(3)}</div></a>
        <a href="personalManager/aboutBasic.action">个人中心</a>
    </div>
</div>
<div class="main">
    <div class="main-box1">
        <form onsubmit="return checkDate()" action="personalManager/improving.action" method="post" enctype="multipart/form-data">
            <div class="m-title">基本资料完善 </div>
            <ul class="con-list">

                <li>
                    <p>
                        <span>会&nbsp;&nbsp;&nbsp;员 &nbsp;&nbsp;号：&nbsp;</span>
                        <input type="text" class="con-sel" value="<% if( null != request.getParameter("userid"))
                        {%><%=request.getParameter("userid")%><%}
                        else{%>${requestScope.userid}<%}%>" id="text1" name="userid" readonly />
                    </p>
                    <p>
                        <span>身份证号码：</span>
                        <input type="password" class="con-sel" placeholder="  必填 " id="text2" name="idcard" onblur="return isCardNo()"/>
                        <span id="s1" style="color: red"> *</span>
                    </p>
                    <p>
                        <span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名：</span>
                        <input type="text" class="con-sel" placeholder="  必填 " id="text3" name="realname" onblur="return isName()" />
                        <span id="s2" style="color: red"> *</span>
                    </p>
                    <p style="line-height: 30px; color: #999;">温馨提示：</p>
                    <p style="line-height: 30px; color: #999;">填写信息真实完整，以便提升审核速度；</p>
                    <p style="line-height: 30px; color: #999;">关于你填写的个人信息，本网站全程保密，请放心填写。</p>
                </li>

                <li style="margin-left: 80px;">
                    <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                        <div class="h4">上传头像</div>
                        <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                            <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                <img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="images/noimage.png" alt="" />
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                            <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="upload" id="picID" accept="image/gif,image/jpeg,image/x-png">
                        </span>
                                <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

            <ul class="cond-list">
                <li>
                    <p>
                        <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 称：</span>
                        <input type="text" class="conditon-select" placeholder="  必填" name="uname" id="text4" onblur="return isUname()"/>
                        <span id="s3" style="color: red"> *</span>
                    </p>
                    <p>
                        <span>出生年月： </span>
                        <input type="text" class="conditon-select" name="ubirthday" readonly id="text5"/>
                    </p>
                    <p>
                        <span> 星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 座：</span>
                        <input type="text" class="conditon-select" name="constellation" readonly id="text6"/>
                    </p>
                </li>
                <li>
                    <p>
                        <span>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：</span>
                        <input type="text" class="conditon-select" placeholder="  必填，单位CM" id="text7" name="uheight" onblur="return isHeight()"/>
                        <span id="s4" style="color: red"> *</span>
                    </p>
                    <p>
                        <span> 婚姻状况：</span>
                        <select class="conditon-select" name="umerried">
                            <option value="未婚">未婚</option>
                            <option value="离异">离异</option>
                            <option value="丧偶">丧偶</option>
                        </select>
                        <span id="s5" style="color: red"> *</span>
                    </p>
                    <p>
                        <span>月&nbsp;&nbsp;收 &nbsp;入： </span>
                        <select class="conditon-select" name="uincome">
                            <option value="0-5000">0-5000</option>
                            <option value="5000-10000">5000-10000</option>
                            <option value="10000-15000">10000-15000</option>
                            <option value="15000-20000">15000-20000</option>
                            <option value="20000以上">20000 以上</option>
                        </select>
                        <span id="s6" style="color: red"> *</span>
                    </p>

                </li>
                <li>
                    <p>
                        <span> 性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别： </span>
                        <input type="text" class="conditon-select" name="usex" readonly id="text8"/>
                    </p>
                    <p>
                        <span> 学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历： </span>
                        <select class="conditon-select" name="uedu">
                            <option value="高中">高中</option>
                            <option value="专科">专科</option>
                            <option value="本科">本科</option>
                            <option value="硕士">硕士</option>
                            <option value="博士">博士</option>
                        </select>
                        <span id="s7" style="color: red"> *</span>
                    </p>
                    <p>
                        <span> 血 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型： </span>
                        <select class="conditon-select" name="ublood">
                            <option value="A">A 型</option>
                            <option value="B">B 型</option>
                            <option value="O">O 型</option>
                            <option value="AB">AB 型</option>
                            <option value="其它">其它血型</option>
                        </select>
                        <span id="s8" style="color: red"> *</span>
                    </p>
                </li>
            </ul>
            <ul class="address" style="margin-top: 0;margin-left: 120px;">
                <li>
                    <p>
                        <span>所&nbsp;在&nbsp;地：</span>
                        <select id="s_province" name="s_province" class="conditon-select"></select>
                        <select id="s_city" name="s_city" class="conditon-select"></select>
                        <script src="<%=basePath%>js/area.js" type="text/javascript" charset="utf-8"></script>
                        <script type="text/javascript">_init_area();</script>
                        <span id="s9" style="color: red"> *</span>
                    </p>
                    <p id="ptext" style="color: red" ></p>
                </li>

            </ul>
            <div class="regwan">
                <input type="submit" value="提交信息" style="width: 200px;  color: #fff; border-radius: 5px; height: 50px; border: 0; display: block;  font-size:30px; line-height: 50px; background: #eb6877; margin: 0 auto;" >
            </div>
        </form>
    </div>
    <div class="copy">
        <p>Copyright©2019   厦门牵手西湖婚恋交友网   版权所有  </p>
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

    //正则表达式验证

    var count = 0;
    var message = 0;
    //身份证输入格式验证
    function isCardNo() {
        var idNo = $('#text2').val();
        var regIdNo = /^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        var flag = regIdNo.test(idNo);
        if(false==flag){
            $('#s1').html("  格式错误或没有输入");
            return false;
        }else{
            $("#s1").html("  ✔");
            count++;
            message++;
            if (message>=2){
                ajaxDate()
            }
            return true;
        }
    }
    //真是姓名验证
    function isName(){
        var name = $('#text3').val();
        var regName =/^[\u4e00-\u9fa5]{2,4}$/;
        var flag = regName.test(name);
        if(false==flag){
            $('#s2').html("  格式错误或没有输入");
            return false;
        }else{
            $("#s2").html("  ✔");
            count++;
            message++;
            if (message>=2){
                ajaxDate()
            }
            return true;
        }
    }

    //验证昵称不为空或空字符串
    function isUname() {
        var uname =$('#text4').val();
        if (uname.length ==0||null==uname){
            $('#s3').html("输入异常");
            return false;
        }else{
            $('#s3').html("✔");
            count++;
            return  true;
        }
    }
    //身高正则表达式验证
    function isHeight(){
        var height =$('#text7').val();
        var heightReg =  /^([1,2][0-9]{1,2})$/;
        var flag = heightReg.test(height);
        if (false==flag||height.length==0){
            $('#s4').html("  输入异常");
            return false;
        }else{
            $('#s4').html("  ✔");
            count++;
            return  true;
        }
    }
    //验证提交信息
    function checkDate() {
        if (count>=5){
            $('#ptext').html("提交信息成功！");
            return true;
        } else{
            $('#ptext').html("必填项未填写或填写错误！");
            return false;
        }
    }

    function ajaxDate(){

        var idNo = $('#text2').val();
        var name = $('#text3').val();
        var allDate={"idcard":idNo,"name":name};
        $.ajax({
            url:"uploadManager/ajaxCheckIdCard.action",   //请求服务器路径
            data:JSON.stringify(allDate),	//参数请求对象
            contentType:"application/json;charset=utf-8",
            type:"post", //请求方式
            dataType:"json",  //服务请返回的数据类型
            success:function(result){
                if (result.isok=="true"){
                    count++;
                    $("#text5").val(result.birthday);  //生日
                    $("#text8").val(result.sex);  //性别
                    $("#text6").val(result.constellations);  //星座
                } else{
                    $('#ptext').html("输入姓名与身份证信息不一致，请核实！");
                }
            }
        })

    }

</script>
</body>
</html>
