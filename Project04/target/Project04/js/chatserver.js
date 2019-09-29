
		var ws = null;
		var websocket = null;
		var nowuserid = '';
		var serverurl = '';
		function getConfig(userid,url) {
			nowuserid = userid;
			serverurl = url;

			//获取服务端地址
			ws = "ws://localhost:8080" + serverurl + "/server";

			//判断当前浏览器是否支持WebSocket
			if ('WebSocket' in window) {
				alert(ws);
				websocket = new WebSocket(ws);
			} else {
				alert('对不起，你的浏览器不支持WebSocket');
			};

			//连接成功建立的回调方法
			websocket.onopen = function() {
				//显示在线状态
				//告诉好友自己已经上线,通知自己的所有好友自己上线啦
				alert('连接成功');

			};

			//接收到消息的回调方法
			websocket.onmessage = function(event) {
				alert('收到消息');
				//接收到消息，处理消息
				handleReceiveMessage(event.data);
			};

			//连接发生错误的回调方法
			websocket.onerror = function() {
				alert('连接异常，请见谅');
			};

			//连接关闭的回调方法
			websocket.onclose = function() {
				//连接关闭，告诉所有好友我下线啦
				alert('感谢您的使用，再见');
			};
		}
        screenFuc();

		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onbeforeunload = function() {
			onLineStatusNotice(4);
			closeWebSocket();
		};

		//关闭WebSocket连接
		function closeWebSocket() {
			websocket.close();
		}
		// "message"{
		//			"from": "xxxx",
		//			"to":["xxx"],
		//			"content":"xxxxx",
		//			"type":0,
		//			"time":"xxxx.xx.xx xx.xx.xx"
		//		}

		//处理接收到的数据
		function handleReceiveMessage(message) {
		    alert(message);
			messages = JSON.parse(message);
			//判断是否为上下线通知
			if(messages.type == 3 || messages.type == 4){

			}
			else if(messages.type == 5 || messages.type == 6){

			}
			else if(messages.type == 0 ||messages.type == -1 || messages.type == 1)
				showReceiveMessage(messages.content, messages.from, messages.to,messages.type,messages.time,message);
		}
		
		//发送消息
		function sendMessage(content, usersId, type) {
			var test = nowuserid+usersId+content+type+getDateFull();
			alert(test);
            websocket.send(JSON.stringify({
              from : nowuserid,
              to : usersId,
              content : content,
              type : type,
              time : getDateFull()
			}));
		}

		//将消息显示在网页上
		function showReceiveMessage(content, from, to, type, time, message) {
			var times = time.split(' ');
			var now = getDateFull();
			var nows = now.split(' ');
			var showTime = times[1];
			if(nows[0]!=times[0]){
				showTime = time;
			}

			$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">\n" +
				"<small class=\"chat-date\">"+
				showTime + "</small></div><div class=\"left\">" +
				"<div class=\"chat-avatars\"><img src="+
				"\"img/icon01.png\"" + " alt=\"头像\"></div><div class=\"chat-message\">" +
				content + "</div></div></div>");
		}

		//消息通知
		function doMessageNotice(content,from, to,type, time,message){

		}

        //补0函数
		function appendZero(s) {
			return ("00" + s).substr((s + "").length);
		}

		//获取当前时间日期
		function getDateFull() {
			var date = new Date();
			var currentdate = date.getFullYear() + "-"
					+ appendZero(date.getMonth() + 1) + "-"
					+ appendZero(date.getDate()) + " "
					+ appendZero(date.getHours()) + ":"
					+ appendZero(date.getMinutes()) + ":"
					+ appendZero(date.getSeconds());
			return currentdate;
		}

		//窗口关闭
		function closeWindow() {
			window.opener = null;
			window.open('', '_self');
			window.close();
		}
		
		//使用ajax获取当前用户的所有好友
		function getAllRelations(){
			var allRelations = null;
			var currentUser = {};
			currentUser.userId = nowuserid;
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : serverurl+'/getRelations',
				data : currentUser,
				dataType : 'json',
				success : function(result) {
					if (result!=null) {
						allRelations = result.relations;
					}
					else{
						alert('查询错误');
					}
				},
				error : function(result) {
					alert('查询错误');
				}
				});
			//划重点划重点，这里的eval方法不同于prase方法，外面加括号
			allRelations = eval("("+allRelations+")");
			return allRelations;
		}

		//上下线通知
		function onLineStatusNotice(type){
			var allRelations = getAllRelations();
			var content = null;
			if(type==3)
				content='上线通知';
			else if(type==4)
				content='下线通知';
			var usersId = new Array();
			for(var i=0;i<allRelations.length;i++){
				usersId[i] = allRelations[i].userId;
			}
			sendMessage(content,usersId,type);
		}

		//改变在线状态
		function changeToOnlineStatus(content,from,to,type,time,message){
			var onLineStatus = document.getElementById(from+'onlineStatus');
			var offLineStatus = document.getElementById(from+'offlineStatus');
			//判断如果找不到这个id，那么和普通消息一样放入缓存区
			if(onLineStatus && type==3){
				onLineStatus.style.opacity = 1;
				offLineStatus.style.opacity = 0;
			}
			else if(offLineStatus && type==4){
				onLineStatus.style.opacity = 0;
				offLineStatus.style.opacity = 1;
			}
			else{
				doMessageNotice(content,from, to,type, time,message);
			}
		}

		//列出好友列表
		var relationListIndex = null;
		function listRelation() {

		}

		//搜索/添加好友
		function searchFriend() {

		}

		function findUser(userName) {

		}
		
		var addFriendIndex = null;
		function addFriend(userId, userName, userNickName) {

		};
		
		function addThisUser(userId){
			var text = document.getElementById('addFriendMessage').value;
			var usersId = new Array();
			usersId[0] = userId;
			sendMessage(text,usersId,5);
		}
		
		function openRelationApply(content, from, to,type,time,message){
		}
		
		//ajax获取两用户之间的消息记录
		function getMessageRecordBetweenUsers(userId){

		}

		//监听输入框回车键
		function binfEnter(obj, toUserId) {
			if (obj.keyCode == 13) {
				sendMessagePre(toUserId);
				obj.preventDefault();
			}
		}

		//发送消息传递准备工作
		function sendMessagePre(toUserId) {
			var textAreaId = toUserId + 'messageText';
			var message = document.getElementById(textAreaId).value;
			if(message != ''){
				var toUsersId = new Array();
				toUsersId[0] = toUserId;
				sendMessage(message, toUsersId ,0);
				document.getElementById(textAreaId).value = '';
			}
		}
      
