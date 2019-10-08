
		var ws = null;
		var websocket = null;
		var nowuserid = '';
		var serverurl = '';

		function getConfig(userid,url) {
			nowuserid = userid;
			serverurl = url;

			//获取服务端地址
			ws = "ws://" + serverurl + "/ws";

			//判断当前浏览器是否支持WebSocket
			if ('WebSocket' in window) {
				websocket = new WebSocket(ws);
			} else {
				alert('对不起，你的浏览器不支持WebSocket');
			};

			//连接成功建立的回调方法
			websocket.onopen = function() {
				//显示在线状态
                alert('连接成功')


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
		//			"fromid": "xxxx",
		//			"toid":"xxx",
		//			"content":"xxxxx",
		//			"type":0,
		//			"time":"xxxx.xx.xx xx.xx.xx"
		//		}

		//处理接收到的数据
		function handleReceiveMessage(message) {
		    // alert(message);
			messages = JSON.parse(message);

			//判断是否为申请通知
			if(messages.type == "apply" || messages.type == 4){
			    if (confirm('是否接受来自 '+ messages.content +' 的聊天申请？')){
                    sendMessage(messages.content,messages.fromid,'agree');
                }
                else {
                    sendMessage(messages.content,messages.fromid,'refuse');
                }
			}
			else if (messages.type == 'img'){
				showReceiveImage(messages.content, messages.time);
			}
			else if(messages.type == 'agree'){
				alert(messages.content + '同意了您的聊天请求');
				showChatList();
			}
			else if (messages.type == 'refuse'){
				alert(messages.content + '拒绝了您的聊天请求');
			}
			else if(messages.type == 0 ||messages.type == -1 || messages.type == 'text'){
                showReceiveMessage(messages.content, messages.time);
            }

		}
		
		//发送消息
		function sendMessage(content, usersId, type) {
			var test = nowuserid+usersId+content+type+getDateFull();
			// alert(test);
            websocket.send(JSON.stringify({
              fromid : nowuserid,
              toid : usersId,
              content : content,
              type : type,
              time : getDateFull()
			}));
		}

		//将消息显示在网页上
		function showReceiveMessage(content, time) {

			$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">\n" +
				"<small class=\"chat-date\">"+
				time + "</small></div><div class=\"left\">" +
				"<div class=\"chat-avatars\"><img src=" +
				"\"img/icon01.png\"" + " alt=\"头像\"></div><div class=\"chat-message\">" +
				content + "</div></div></div>");

			//聊天框默认最底部
			$(document).ready(function () {
				$("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
			});
		}

		//展示收到的图片
		function showReceiveImage(url,time) {

			$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">\n" +
				"<small class=\"chat-date\">"+
				time + "</small></div><div class=\"left\">" +
				"<div class=\"chat-avatars\"><img src=" +
				"\"img/icon01.png\"" + " alt=\"头像\"></div><div class=\"chat-message\"><img src=\""+
				url+"\" alt=\"\"></div></div></div>");

			//聊天框默认最底部
			$(document).ready(function () {
				$("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
			});

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
		
		function addThisUser(userId){
			var text = document.getElementById('addFriendMessage').value;
			var usersId = new Array();
			usersId[0] = userId;
			sendMessage(text,usersId,5);
		}
		
		//ajax获取两用户之间的消息记录
		function getMessageRecordBetweenUsers(userId){

		}

      
