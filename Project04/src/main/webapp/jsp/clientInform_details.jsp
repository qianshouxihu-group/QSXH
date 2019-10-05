<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>牵手西湖婚恋交友网</title>
    <base href="<%=basePath%>">
    <meta name="Keywords" content="牵手西湖婚恋交友网" />
    <meta name="Description" content="牵手西湖婚恋交友网"/>
    <link type="image/x-icon" rel=icon href="images/icon.png" />
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script  src="js/jquery.min.js" type="text/javascript"></script>
    <%--bootstrap--%>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%--layui--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>

    <style>#detailsDiv{width:800px;height:auto;background-color:pink;
            box-shadow: 10px 10px 5px #888888;margin: 50px auto auto 50px;
            padding-left: 50px;}
    </style>
    <style>
        .button {
            background-color: pink; /* Green */
            border: none;
            color: black;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            box-shadow: 10px 10px 5px #888888;
        }

        .button2 {background-color: pink;} /* pink */
        /*.button3 {background-color: #f44336;} !* Red *!*/
        /*.button4 {background-color: #e7e7e7; color: black;} !* Gray *!*/
        /*.button5 {background-color: #555555;} !* Black *!*/
    </style>

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
            <a href="" class="logo"><img src="<%=basePath%>images/logo.png"/></a>
            <div class="adv"><img src="<%=basePath%>images/adv.png"/></div>
        </div>
    </div>
</div>
<div class="nav-box">
    <div class="nav">
        <a href="">网站首页</a>
        <a href="">条件搜索</a>
        <a href="">智能匹配</a>
        <a href="">我的关注</a>
        <a href="">个人中心</a>
        <a href="">我的消息</a>
        <a href="">会员服务</a>
        <a href="">活动专题</a>
    </div>
</div>
<div class="main">
    <div class="main-box1" style="width:1200px; height:600px;">
        <!--<div class="login-left"><img src="images/loginpic.png"/></div> -->
        <div class="login-right">
            <div class="list-main1-title">我的消息</div>
            <div class="col c2"><!--menu-->
                <div class="list-top"><a href="<%=path%>/informManager/systemInform.action">系统消息</a></div>
                <div class="list-top"><a href="<%=path%>/informManager/activeInform.action">活动消息</a></div>
                <div class="list-top"><a href="<%=path%>/informManager/messageInform.action">我的留言</a></div>
                <div class="list-top"><a href="<%=path%>/informManager/datingInform.action">我的约会</a></div>
                <!-- 模板的伸缩菜单 -->
                <!--                   <div class="css3-animated-example">
                                     <h3 class="cur">详情资料</h3>
                                      <div>
                                        <div class="content">
                                        <p><a href="">生活方式</a></p>
                                        <p><a href="">工作学习</a></p>
                                        <p><a href="">关于婚姻</a></p>
                                        </div>
                                      </div>
                                  </div> -->
                <!-- <div class="list-top"><a href="">关于举报</a></div>	 -->
                <!--                 <div class="css3-animated-example">
                                   <h3 style=" border-bottom: 0;">系统设置</h3>
                                      <div>
                                        <div class="content">
                                        <p><a href="">密码修改</a></p>
                                        <p><a href="">更换手机</a></p>
                                        </div>
                                      </div>-->
            </div>

        </div><!--menu-->
<%--        <!-- layui表格本体 -->--%>
<%--        <div class="layui-card-body" align="center" >--%>
<%--            <table class="layui-table" lay-filter="test" id="utable" align="center">--%>
<%--            </table>--%>
<%--        </div>--%>
        <div style="float: right ; width: 85% ;" id="tableAndPageInfo">
            <div id="detailsDiv">
                <%--表格--%>
                <div style="height: 200px;" id="table">
                    <table class="table table-hover" id="table1" style="table-layout: fixed;">
                        <tr>
                            <%--标题--%><th colspan="2"><h3 style="color:black ; text-shadow:2px 2px white;">${inform.ititle}${msg.mtitle}${dating.dpay}</h3></th>
                        </tr>
                        <tr>
                            <%--时间--%><th><h3 style="color:black ; text-shadow:2px 2px white;">${inform.itime}${msg.mtime}${dating.ddate}&nbsp;${dating.dtime}</h3></th>
                            <%--状态--%><th><h3 style="color:black ; text-shadow:2px 2px white;">${inform.istate}${msg.mstate}${dating.dstate}</h3></th>
                        </tr>
                        <tr>
                            <%--内容--%><td colspan="3"><h4 style="color:black ; text-shadow:2px 2px white;">${inform.icontext}${msg.mcontext}${dating.dcontext}</h4></td>
                        </tr>
                    </table>
                    <div style="text-align: right">
                        <%--系统消息 详情--%>
                        <c:if test="${inform.itype == '81'}">
                            <a href="<%=path%>/informManager/systemInform.action"><input type="button" class="button" value="返回"/></a>
                        </c:if>
                        <%--活动消息 详情--%>
                        <c:if test="${inform.itype == '82'}">
                            <a href="<%=path%>/jsp/${inform.iurl}.jsp"><input type="button" class="button" value="前往活动页"/></a>
                            <a href="<%=path%>/informManager/activeInform.action"><input type="button" class="button" value="返回"/></a>
                        </c:if>
                        <%--我的留言 详情--%>
                        <c:if test="${msg.mstate == '31' || msg.mstate == '32'}">
                            <input type="button" class="button" value="回复" id="reply"/>
                            <a href="<%=path%>/informManager/messageInform.action"><input type="button" class="button" value="返回"/></a>
                        </c:if>
                        <%--我的约会 详情--%>
                        <c:if test="${dating.dstate == '52'}">
                            <input type="button" class="button" value="回复并接受"/>
                            <input type="button" class="button" value="拒绝"/>
                        </c:if>
                        <c:if test="${dating.dstate == '52' || dating.dstate == '53' || dating.dstate == '54'}">
                            <a href="<%=path%>/informManager/datingInform.action"><input type="button" class="button" value="返回"/></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="copy">
        <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
        <p>地址：厦门市软件园二期观日路56号  电话：400-8282-8888</p>
    </div>
</div>
<%--=======================================回复弹出层=========================================--%>
<div class="layui-row" id="test" style="display: none;">
    <div class="layui-col-md10">
            <form class="layui-form" action="" method="post" id="replyOthers">
                <input type="hidden" name="mtoid" value="${msg.mfromid}" ><%--toid--%>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="padding-left:-50px;">标题:</label>
                        <div class="layui-input-block">
                            <input type="text" autofocus placeholder="请输入标题" lay-verify="myTitle"
                                    name="mtitle" id="myTitle" class="layui-input">
                        </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="padding-left:-50px;">内容:</label>
                        <div class="layui-input-block">
                            <textarea cols="10" rows="3" placeholder="请输入内容" lay-verify="myContext"
                                      name="mcontext" id="myContext" class="layui-textarea"
                                      maxlength="100" style="resize: none;"></textarea>
                        </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="padding-left: 50px;">
                        <button lay-submit="" lay-filter="suu" class="layui-btn layui-btn-normal tijiao">提交</button>
                    </div>
                </div> 
            </form>
    </div>
</div>
<!--=========================================回复弹出层开始=================================================-->
<%--<div style="display: none;padding: 20px" id="replyDiv" >--%>
<%--    <form class="layui-form " action="" lay-filter="dataFrm" id="dataForm">--%>
<%--        <div class="layui-form-item">&lt;%&ndash;一行&ndash;%&gt;--%>
<%--            <div class="layui-inline">&lt;%&ndash;一格&ndash;%&gt;--%>
<%--                <label class="layui-form-label">标题:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="mtitle" name="mtitle"  lay-verify="required" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">内容:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <textarea rows="5" cols="20" id="mcontext" name="mcontext" lay-verify="required" autocomplete="off"--%>
<%--                              class="layui-textarea"></textarea>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">身高:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="uheight" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">体重:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="uweight" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">婚姻状况:</label>--%>
<%--                <div class="layui-input-block" style="width:150px">--%>
<%--                    <select name="umerried"  lay-verify="required">--%>
<%--                        <option value="未婚">未婚</option>--%>
<%--                        <option value="离异">离异</option>--%>
<%--                        <option value="丧偶">丧偶</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">月收入:</label>--%>
<%--                <div class="layui-input-block" style="width:150px">--%>
<%--                    <select name="uincome"  lay-verify="required">--%>
<%--                        <option value="0-5000">0-5000</option>--%>
<%--                        <option value="5000-10000">5000-10000</option>--%>
<%--                        <option value="10000-15000">10000-15000</option>--%>
<%--                        <option value="15000-20000">15000-20000</option>--%>
<%--                        <option value="20000以上">20000以上</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">星座:</label>--%>
<%--                <div class="layui-input-block" style="width:150px">--%>
<%--                    <select name="conste"  lay-verify="required">--%>
<%--                        <option value="白羊座">白羊座</option>--%>
<%--                        <option value="金牛座">金牛座</option>--%>
<%--                        <option value="双子座">双子座</option>--%>
<%--                        <option value="巨蟹座">巨蟹座</option>--%>
<%--                        <option value="狮子座">狮子座</option>--%>
<%--                        <option value="处女座">处女座</option>--%>
<%--                        <option value="天秤座">天秤座</option>--%>
<%--                        <option value="天蝎座">天蝎座</option>--%>
<%--                        <option value="射手座">射手座</option>--%>
<%--                        <option value="魔羯座">魔羯座</option>--%>
<%--                        <option value="水瓶座">水瓶座</option>--%>
<%--                        <option value="双鱼座">双鱼座</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">血型:</label>--%>
<%--                <div class="layui-input-block" style="width:150px">--%>
<%--                    <select name="ublood"  lay-verify="required">--%>
<%--                        <option value="A">A型</option>--%>
<%--                        <option value="B">B型</option>--%>
<%--                        <option value="AB">AB型</option>--%>
<%--                        <option value="O">O型</option>--%>
<%--                        <option value="其它">其它血型</option>--%>
<%--                    </select>--%>
<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">性别：</label>--%>
<%--                <div class="layui-input-block">--%>
<%--                    <input type="radio" name="usex" value="男" title="男">--%>
<%--                    <input type="radio" name="usex" value="女" title="女">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">出生日期:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="ubirthday" lay-verify="required" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">学历</label>--%>
<%--                <div class="layui-input-block" style="width:150px">--%>
<%--                    <select name="uedu"  lay-verify="required">--%>
<%--                        <option value="高中及以下">高中及以下</option>--%>
<%--                        <option value="专科">专科</option>--%>
<%--                        <option value="本科">本科</option>--%>
<%--                        <option value="硕士">硕士</option>--%>
<%--                        <option value="博士">博士</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">地址:</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="uaddress" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>


<%--        <div class="layui-form-item" style="text-align: center;">--%>
<%--            <div class="layui-input-block">--%>
<%--                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>--%>
<%--                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>

<%--</div>--%>
</body>
<%--========================================回复AJAX===============================================--%>
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        var form=layui.form;
        var layer=layui.layer;
        $=layui.jquery;



        $("#reply").on('click',function(){
            layer.open({
                type:1,
                title:"回复对方",
                skin:"myclass",//自定样式
                area:["600px","520px"],
                resize:false,
                content:$("#test").html(),

                success: function(layero, index){},
                yes:function(){
                }
            });
            form.render();//动态渲染

        });

        //标题表单验证
        form.verify({
            myTitle: function(value){
                if(value.length < 5){
                    return '标题至少5个字符！';
                }
            }
        });
        //内容表单验证
        form.verify({
            myContext: function(value){
                if(value.length == 0){
                    return '请输入内容！';
                }
            }
        });
        //表单提交
        form.on('submit(suu)', function(data){
            $.ajax({
                url:'<%=path%>/informManager/reply.action',
                method:'post',
                data:data.field,
                dataType:'text',
                success:function(res){
                    if(res == 'replySuccess')
                    {
                        layer.msg("回复成功！");
                    }
                    else if(res == 'replyFail')
                    {
                        layer.msg("回复失败！");
                    }
                },

                //     if(res.code='0'){
                //         parent.closeIframe(res.msg);
                //     }
                //     else
                //         alert(res.msg);
                // },
                error:function (data) {
                    alert("未连接");
                }
            }) ;

        });
    });
</script>

<script type="text/javascript">
    /*打开弹窗  发送回复AJAX*/
    <%--function openReply(toid)--%>
    <%--{--%>
    <%--    layui.use(['layer','form'], function(){--%>
    <%--    var layer = layui.layer;--%>
    <%--    var url;--%>
    <%--    var mainIndex;--%>
    <%--    var form = layui.form;--%>
    <%--        alert("回复给："+toid);--%>
    <%--        mainIndex = layer.open({--%>
    <%--            type:1,//1为div，2为jsp--%>
    <%--            title:'回复',--%>
    <%--            content:$("#replyDiv"),--%>
    <%--            area:['800px','400px'],--%>
    <%--            offset: 'auto',--%>
    <%--            btn:['发送','取消'],--%>
    <%--            shade:false,--%>
    <%--            success:function(index){--%>
    <%--                //清空表单数据--%>
    <%--                $("#dataFrm")[0].reset();--%>
    <%--                url="<%=path%>/informManager/reply.action";--%>
    <%--            }--%>
                <%--btn1:function(index , layero) {--%>
                <%--    alert("发送");--%>
                <%--    $.ajax({--%>

                <%--        async: true,--%>
                <%--        type: "post",--%>
                <%--        url: "<%=path%>/informManager/reply.action",--%>
                <%--        dataType: "json",--%>
                <%--        data: {"mtoid": toid, "mtitle": $("#mtitle"), "mcontext": $("#mcontext")},--%>
                <%--        success: function (dat) {--%>
                <%--            layer.msg(dat);--%>
                <%--            layer.msg("发送成功！");--%>
                <%--            //关闭弹出层--%>
                <%--            layer.close(mainIndex);--%>
                <%--        },--%>
                <%--        error:function (dat) {--%>
                <%--            alert("error");--%>
                <%--        }--%>

                <%--    });--%>
                <%--},--%>
    //             btn2:function(index){
    //                 layer.close(index);
    //             }
    //             success:function(index){
    //                 //清空表单数据
    //                 // $("#dataFrm")[0].reset();
    //                 // url="user/addUser.action";
    //             }
    //
    //         })
    //     });
    // }

</script>

</html>

