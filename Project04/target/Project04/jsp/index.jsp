<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>牵手西湖婚恋交友网</title>
		<meta name="Keywords" content="牵手西湖婚恋交友网" />
        <meta name="Description" content="牵手西湖婚恋交友网"/>
		<link type="image/x-icon" rel=icon href="images/icon.png" />
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/loading.css">
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/koala.min.1.5.js"></script>
        <script type="text/javascript" src="js/jquery.collapse.js" ></script>
        <script src="js/loading.js"></script>
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
				<a href="matchUser/matchByTime.action?limitString=12&userid=${sessionScope.user.userid}">网站首页</a>
				<a href="jsp/clientAboutUs.jsp">了解我们</a>
				<a id="searchUser" href="matchUser/smartMatch.action?limitString=30&usex=${sessionScope.user.usex}&condition=charm&userid=${sessionScope.user.userid}">条件搜索</a>
				<a id="match"  href="matchUser/smartUser.action?id=${sessionScope.user.userid}&roleid=${sessionScope.user.roleid}">智能匹配</a>
				<a href="jsp/beVip.jsp">会员服务 </a>
				<a href="jsp/clientActiveList.jsp">活动专题 </a>
				<a href="<%=path%>/informManager/systemInform.action">我的消息 <div class="my-notice">${countList.get(0)+countList.get(1)+countList.get(2)+countList.get(3)}</div></a>
				<a href="personalManager/aboutBasic.action">个人中心</a>
			</div>
		</div>
		<div class="banner"><img src="images/banner.jpg"/></div>
		<div class="main">
			<div class="main-box">
			<div class="main-left"><!--left-->
				<div class="main-l-top">
					<div class="main-lt-pic">
						<img src="images/slogo.png"/>
						<p><a href="" class="more">了解更多 ></a></p>
					</div>
					<div class="main-lt-text">
						牵手西湖婚恋交友网是由一批婚恋专家，网络专家精心打造的。专为厦门地区有婚恋交友需求的单身人士服务的，专业正规的交友网站。主创团队在花费数年时间仔细研究，比较国内外多种婚恋服务后，取其精华，去其糟粕。并创造性地加入了一些本网站独有的元素，逐渐形成了现在这个克服了网络交友种种弊端的“安全高效”的交友平台。我们经过仔细研究，发现大众对于网络交友主要存在以下顾虑，我们针对大家的担心，提出了相应的，积极的对策，力求给您提供最满意的服务。
					</div>
				</div>
				<div class="main-l-ban">
					<div id="fsD1" class="focus" >  
                      <div id="D1pic1" class="fPic">  
                        <div class="fcon"><a href=""><img src="images/sbanner.png"></a> </div>
                        <div class="fcon"><a href=""><img src="images/sbanner.png" style="opacity: 1; "></a></div>
                        <div class="fcon"><a href=""><img src="images/sbanner.png" style="opacity: 1; "></a></div>
                        <div class="fcon"><a href=""><img src="images/sbanner.png" style="opacity: 1; "></a> </div>    
                       </div>
                    <div class="fbg">  
                      <div class="D1fBt" id="D1fBt">  
                        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>1</i></a>  
                        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>  
                        <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>3</i></a>  
                        <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a>  
                      </div>  
                    </div>  
                    </div>  
				</div>
				<div class="main-title">
					近期佳人<span>全城为您找到最靠谱的佳人</span>
					<a href="">更多></a>
				</div>
				<ul class="main-member" id="woman">
				</ul>
				<div class="main-title">
					近期熟男<span>全城为您找到最靠谱的帅哥</span>
					<a href="">更多></a>
				</div>
				<ul class="main-member" id="man">
				</ul>
			    <div class="main-title">
					友情链接<span>以下商家为“牵手西湖”合作伙伴</span>
				</div>
				<ul class="friend-link">
					<li><a href=""><img src="images/link3.png"/></a></li>
					<li><a href=""><img src="images/link1.png"/></a></li>
					<li><a href=""><img src="images/link4.png"/></a></li>
					<li><a href=""><img src="images/link2.png"/></a></li>
				</ul>
			</div><!--left-->
				<div class="main-right"><!--right-->

					<c:if test="${!empty user}">
						<div class="main-log">
							<div class="tit">${user.uname}</div>
							<div class="mem-pic"><img src="${user.uimgurl}"/></div>
							<div class="main-pass-text" style="margin-top: 25px;">
								<a href="" class="entermem" style="color: #fff;">进入我的主页</a>
							</div>
						</div>
					</c:if>
					<c:if test="${empty user}">
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
					</c:if>






				<div class="main-radv"><img src="images/adv2.png"/></div>
				<div class="main-radv"><img src="images/adv1.png"/></div>
				<div class="main-message">
					<div class="tit">通告栏</div>
					<p>一、请各用电客户尽快与开户银行联系，按照中国人民银行XX分行的统一要求签订《定期借记业务授权委托书》，并于2002年1月31日前将复印件送达所在区供电局。</p>
					<p>二、部分商业银行由于系统升级原因更改了开户银行账号格式，请客户在签订《定期借记业务授权委托书》的同时与贵开户银行确认新的银行账号，并于2002年1月31日前以正式公函形式通知我局，若届时未受到客户的《定期借记业务授权委托书》及新的银行帐号的，客户将无法使用定期借记方式缴交电费，我局将采取现金方式收取电费。</p>
					<p>三、由于定期借记业务系统投运后，银行系统将不再代为传递电费票据，故我局将统一采取邮政递送，客户签收的方式派发系统将不再代为传递电费票据，故我局将统一采取邮政递送，客户签收的方式派发</p>
				</div>
				<div class="main-message1">
					<div class="tit">联系我们</div>
					<div class="main-contact">
						<p>公司名称：</p>
						<p>联系人：</p>
						<p>联系电话：400-400-400</p>
						<p>电子邮箱：</p>
						<p>实体店地址：厦门软件园二期</p>
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
	
<script type="text/javascript">
	//==========================================页面加载时查询近期用户=======================
	$(document).ready(function () {
		//执行数据加载
		$.ajax({
			url:"matchUser/matchByTimeajax.action?limitString=12&userid=${sessionScope.user.userid}",
			type: "GET",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success:function (data) {
				//这里的cityInfo1是后端map的key
				var manlist = data["manlist"];
				var firstCity ="";
				$("#man").html("");
				for(var i in manlist){
					var str = "<li>" +
							"<a href='<%=path%>/personalManager/showTaInforn.action?taId="+manlist[i].userid+"'>" +
							"<img src='images/test3.png'>" +
							"<p class='mem-num'>昵称：" + manlist[i].uname + "</p>" +
							"<p class='mem-text'>"+manlist[i].uage+"岁  |  "+manlist[i].uheight +"cm  |  <span style='color: #f2a1a9'>　♥　</span>"+manlist[i].ucharm+"</p>"+
							"</a>" +
							"</li>";
					$("#man").append(str);
				}
				var womanlist = data["womanlist"];
				var firstCity ="";
				$("#woman").html("");
				for(var i in womanlist){
					var str = "<li>" +
							"<a href='<%=path%>/personalManager/showTaInforn.action?taId="+womanlist[i].userid+"'>" +
							"<img src='images/test.png'>" +
							"<p class='mem-num'>昵称：" + womanlist[i].uname + "</p>" +
							"<p class='mem-text'>"+womanlist[i].uage+"岁  |  "+womanlist[i].uheight +"cm  |  <span style='color: #f2a1a9'>　♥　</span>"+womanlist[i].ucharm+"</p>"+
							"</a>" +
							"</li>";
					$("#woman").append(str);
				}
			},
			error:function () {

			}
		})
	})

	//===================================================================

	Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1', 
			conId: "D1pic1",  
			tabId:"D1fBt",  
			tabTn:"a",
			conCn: '.fcon',    
			auto: 1, 
			effect: 'fade',  
			eType: 'click', 
			pageBt:true,
			bns: ['.prev', '.next'],                      
			interval: 3000  
		}) 
	})

	//===============================loading全屏，加载等待效果================
	$('#searchUser').click(function(){
		toload();
	});

	function toload(){
		var load = new Loading();
		load.init();
		load.start();
		setTimeout(function() {
			load.stop();
		}, 20000)
	}
	$('#match').click(function(){
		toload();
	});
</script>
</body>
</html>
