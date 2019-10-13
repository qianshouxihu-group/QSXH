<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>牵手西湖婚恋交友网</title>
		<meta name="Keywords" content="牵手西湖婚恋交友网" />
        <meta name="Description" content="牵手西湖婚恋交友网"/>
		<link type="image/x-icon" rel=icon href="images/icon.png" />
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
		<link rel="stylesheet" href="css/jquery.range.css">
		<link rel="stylesheet" href="css/loading.css">
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery.range.js"></script>
        <script type="text/javascript" src="js/popup.mini.js"></script>
		<script src="js/loading.js"></script>
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
				<a href="matchUser/matchByTime.action?limitString=12">网站首页</a>
				<a href="">了解我们</a>
				<a id="searchUser" href="matchUser/smartMatch.action?limitString=30&usex=${sessionScope.user.usex}&conditin=charm">条件搜索</a>
				<a href="matchUser/smartUser.action?id=${sessionScope.user.userid}">智能匹配</a>
				<a href="">会员服务 </a>
				<a href="">活动专题 </a>
				<a href="">我的消息 </a>
				<a href="">个人中心</a>
			</div>
		</div>
		
		<div class="main">
			<div class="main-box1">
			<div class="main-left"><!--left-->
				<ul class="find-infor" style="padding-top: 15px;">
						<li style="margin-bottom: 15px;">
							<span>年龄</span>
							<div class="infor-link">
								<select id="uageRange">
									 <option value="不限">不限</option>
									<option value="18-23">18-23</option>
									<option value="24-29">24-29</option>
									<option value="30-35">30-35</option>
									<option value="36-41">36-41</option>
									<option value="42-47">42-47</option>
									<option value="48-53">48-53</option>
									<option value="53以上">53以上</option>
								</select>
							</div>
							<span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</span>
							<div class="infor-link">
								<select id="uedu">
									<option value="不限">不限</option>
									<option value="高中">高中</option>
									<option value="专科">专科</option>
									<option value="本科">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
								</select>
							</div>
							<span>婚姻状况</span>
							<div class="infor-link">
								<select id="umerried">
									<option value="不限">不限</option>
									<option value="未婚">未婚</option>
									<option value="离异">离异</option>
									<option value="丧偶">丧偶</option>
								</select>
							</div>
							<span>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;房</span>
							<div class="infor-link">
								<select id="uhouse">
									<option value="不限">不限</option>
									<option value="有房">有房</option>
									<option value="无房">无房</option>
								</select>
							</div>
						</li>
						<li>
							<span>从事行业</span>
							<div class="infor-link">
								<select id="uwork">
									<option value="不限">不限</option>
									<option value="在校学生">在校学生</option>
									<option value="计算机/IT">计算机/IT</option>
									<option value="通信技术">通信技术</option>
									<option value="销售">销售</option>
									<option value="市场拓展">市场拓展</option>
									<option value="公关/商务">公关/商务</option>
									<option value="采购/贸易">采购/贸易</option>
									<option value="客户服务">客户服务</option>
									<option value="人力/行政">人力/行政</option>
									<option value="高级管理">高级管理</option>
									<option value="制造/加工">制造/加工</option>
									<option value="质控/安检">质控/安检</option>
									<option value="工程机械">工程机械</option>
									<option value="技工">技工</option>
									<option value="财会/审计">财会/审计</option>
									<option value="金融">金融</option>
									<option value="装修/物业">装修/物业</option>
									<option value="家政/月嫂">家政/月嫂</option>
									<option value="航空">航空</option>
									<option value="教育/培训">教育/培训</option>
									<option value="咨询/顾问">咨询/顾问</option>
									<option value="学术/科研">学术/科研</option>
									<option value="法律">法律</option>
									<option value="设计/创意">设计/创意</option>
									<option value="文学/媒体">文学/媒体</option>
									<option value="餐饮/旅游">餐饮/旅游</option>
									<option value="能源/化工">能源/化工</option>
									<option value="地质勘探">地质勘探</option>
									<option value="医疗/护理">医疗/护理</option>
									<option value="保健/美容">保健/美容</option>
									<option value="生物工程">生物工程</option>
									<option value="制药/器械">制药/器械</option>
									<option value="体育工作者">体育工作者</option>
									<option value="翻译">翻译</option>
									<option value="公务员/干部">公务员/干部</option>
									<option value="个体/电商">个体/电商</option>
									<option value="警察">警察</option>
									<option value="其他">其他</option>
								</select>
							</div>
							<span>月 &nbsp;收 &nbsp;入</span>
							<div class="infor-link">
								<select id="uincome">
									<option value="不限">不限</option>
									<option value="0-5000">0-5000</option>
									<option value="5000-10000">5000-10000</option>
									<option value="10000-15000">10000-15000</option>
									<option value="15000-20000">15000-20000</option>
									<option value="20000以上">20000以上</option>
								</select>
							</div>
							<span>所在地</span>
							<div class="infor-link" style="width: 200px;margin-top: -10px;">
								<select id="s_province" name="s_province"></select>
								<select id="s_city" name="s_city" ></select>
								<script class="resources library" src="js/area.js" type="text/javascript"></script>
								<script type="text/javascript">_init_area();</script>
							</div>
							<%--<input type="submit" value="搜索" style="width:100px; height: 30px; background: #76fabc;">--%>
							<button id="search" onclick="search()" style=" margin-left: 30px;width:100px; height: 30px; background: rosybrown;">搜索</button>
						</li>
				</ul>
				<ul class="main-member">
					<c:if test="${!empty MatchUserList}">
						<c:forEach items="${MatchUserList}" var="list">
							<li>
								<a href="">
									<img src="images/test.png">
									<p class="mem-num">昵称：${list.uname}</p>
									<p class="mem-text">${list.uage}岁  |  ${list.uwork}  |  ${list.uheight}cm</p>
									<p class="mem-text">♥${list.ucharm}</p>
								</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${empty MatchUserList}">
						<li>
							未找到符合条件的用户
						</li>
					</c:if>
				</ul>
			</div><!--left-->
			<div class="main-right"><!--right-->
				<div class="main-log">
					<div class="tit">会员登录</div>
					<div class="main-logbox">
						<i class="main-user"></i>
						<input placeholder="账户名" type="text" class="main-user-input" />
					</div>
					<div class="main-logbox">
						<i class="main-password"></i>
						<input placeholder="密码" type="text" class="main-user-input" />
					</div>
					<button type="button"  class="main-btn">立即登录</button>
					<div class="main-pass-text">没有帐号？<a href="">免费注册</a><a href="" class="forget">忘记密码 ></a></div>
				</div>
				<div class="main-radv"><img src="images/adv2.png"/></div>
				<div class="main-radv"><img src="images/adv1.png"/></div>
				<div class="main-message">
					<div class="tit">最新会员推荐</div>
					<ul class="member-list">
						<c:forEach items="${Memberlist}" var="list">
							<li>
								<a href="">
									<img src="images/bgimg.jpg" />
									<p>昵称：${list.uname}</p>
									<p>年龄：${list.uage}岁</p>
									<p>身高：${list.uheight}cm</p>
									<p> ♥${list.ucharm}</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="main-message1">
					<div class="tit">联系我们</div>
					<div class="main-contact">
						<p>公司名称：</p>
						<p>联系人：</p>
						<p>联系电话：400-400-400</p>
						<p>电子邮箱：</p>
						<p>实体店地址：厦门软件园</p>
						<p>厦门牵手西湖婚恋交友官方微信</p>
						<p><img src="images/weixin.jpg"/></p>
						<p style="text-align: center;">“ 扫一扫与牵手西湖亲密互动 ”</p>
					</div>
				</div>
			</div><!--right-->
			</div>
		 <div class="copy">
			 <p>Copyright©2019  厦门牵手西湖婚恋交友网  版权所有 </p>
			 <p>地址：厦门市软件园二期观日路56号  电话：400-0000-0000</p>
		</div>
<!--在线客服-->
<div id="floatTools" class="rides-cs" style="height:246px;">
  <div class="floatL">
  	<a id="aFloatTools_Show" class="btnOpen" title="查看在线客服" style="top:20px;display:block" href="javascript:void(0);">展开</a>
  	<a id="aFloatTools_Hide" class="btnCtn" title="关闭在线客服" style="top:20px;display:none" href="javascript:void(0);">收缩</a>
  </div>
  <div id="divFloatToolsView" class="floatR" style="display: none;height:237px;width: 140px;">
    <div class="cn">
      <h3 class="titZx">厦门牵手西湖在线客服</h3>
      <ul>
        <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服1</span></li>
        <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a><span>客服2</span> </li>
        <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服3</span></li>
        <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="images/qq.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> <span>客服4</span></li>
        <li style="border:none;"><span>电话：400-000-0000</span> </li>
      </ul>
    </div>
  </div>
</div>
</div>

<script type='text/javascript'>
	(function(){
		 new PopUp_api({el:'.s-jubao',html:'.ddd'});	 
	})()

    //loading全屏，加载等待效果
    $('#searchUser').click(function(){
        var load = new Loading();
        load.init();
        load.start();
        setTimeout(function() {
            load.stop();
        }, 30000)
    });
	/*
	保存选中的下拉框属性
	 */
	$(function () {
			getSelectState("uageRange","${userAndData.uageRange}");
			getSelectState("uedu","${userAndData.uedu}");
			getSelectState("umerried","${userAndData.umerried}");
			getSelectState("uhouse","${userAndData.uhouse}");
			getSelectState("uwork","${userAndData.uwork}");
			getSelectState("uincome","${userAndData.uincome}");
			getSelectState("s_province","${userAndData.s_province}");
			getSelectState("s_city","${userAndData.s_city}");
        })

	function getSelectState(selectId,optionValue){
	    var sel = document.getElementById(selectId);
	    for(var i=0;i<sel.length;i++){
	        if(sel.options[i].value == optionValue){
	            sel.selectedIndex = i;
	            break;
			}
		}
	}

	//点击搜索按钮时
	function search(){
	    var uageRange = $("#uageRange").val();
	    var uedu = $("#uedu").val();
	    var umerried = $("#umerried").val();
	    var uhouse = $("#uhouse").val();
	    var uwork = $("#uwork").val();
	    var uincome = $("#uincome").val();
	    var s_province = $("#s_province").val();
        var s_city = $("#s_city").val();
        window.location.href="matchUser/matchByCondition.action?uageRange="+uageRange+"&uedu="+uedu+"&umerried="+umerried+"&uhouse="+uhouse+"&uwork="+uwork+"&uincome="+uincome+"&s_province="+s_province+"&s_city="+s_city+"&limitString=30&usex=女&condition=charm";
    }


    //滑至底部时加载用户数据
    var throldHold = 400; //两次scroll事件触发之间最小的事件间隔

    window.onscroll  = function(){

        //主要是解决Firefox问题。Firefox你滑动的过程可能会出现加载多次，

        //而其它浏览器只加载一次，所以延迟加载，导致在某段时间只执行一次

        if (arguments.callee.timer) {
            clearTimeout(arguments.callee.timer);
        }
        arguments.callee.timer = setTimeout(isDivScroll, throldHold);
    }

    var isDivScroll = function(){
        var marginBot = -1;
        if (document.compatMode === "CSS1Compat"){
            marginBot = document.documentElement.scrollHeight - (document.documentElement.scrollTop+document.body.scrollTop)-  document.documentElement.clientHeight;
        } else {
            marginBot = document.body.scrollHeight - document.body.scrollTop - document.body.clientHeight;
        }

        //这里不要设置为<=0，因为IE监控不到
        if(marginBot <= 10) {
            var uageRange = $("#uageRange").val();
            var uedu = $("#uedu").val();
            var umerried = $("#umerried").val();
            var uhouse = $("#uhouse").val();
            var uwork = $("#uwork").val();
            var uincome = $("#uincome").val();
            var s_province = $("#s_province").val();
            var s_city = $("#s_city").val();
            //执行数据加载
            $.ajax({
                // url:"matchUser/MatchForPage.action?uageRange="+uageRange+"&uedu="+uedu+"&umerried="+umerried+"&uhouse="+uhouse+"&uwork="+uwork+"&uincome="+uincome+"&s_province="+s_province+"&s_city="+s_city+"&limitString=30&usex=女",
                url:"matchUser/MatchForPage.action",
                type: "GET",
                contentType: "application/json; charset=utf-8",
                data:{
                    "uageRange":uageRange,
                    "uedu":uedu,
                    "umerried":umerried,
                    "uhouse":uhouse,
                    "uwork":uwork,
                    "uincome":uincome,
                    "s_province":s_province,
                    "s_city":s_city,
                    "limitString":'30',
                    "usex":'女',
                    "condition":'charm'
                },
                dataType: "json",
                success:function (data) {
                    for (var o in data){
                        var str = "<li>"+
                            "<a href=''>"+
                            "<img src='images/test.png'>"+
                            "<p class='mem-num'>昵称："+data[o].uname+"</p>"+
                            "<p class='mem-text'>"+data[o].uage+"岁  |  "+data[o].uwork+"  |  "+data[o].uheight+"cm</p>"+
                            "<p class='mem-text'>♥"+data[o].ucharm+"</p>"+
                            "</a>"+
                            "</li>";

                        $(".main-member").append(str);
                    }
                },
                error:function () {
                    
                }
            })
        }
    }
</script>
</body>
</html>
