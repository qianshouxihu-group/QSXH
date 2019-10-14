
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
			if(messages.type == "apply" ){
			    if (confirm('是否接受来自 '+ messages.content +' 的聊天申请？')){
                    sendMessage(messages.content,messages.fromid,'agree');
                }
                else {
                    sendMessage(messages.content,messages.fromid,'refuse');
                }
			}
			else if (messages.type == 'img'|| messages.type == 'text'){
				var inputId = '#'+messages.fromid;
				if (chatState=='close'){
					$(".chatBtn").click();
                    $(".chatBox-list").children(inputId).next().click();
				}
				else if (chatState=='show'&&messages.fromid!=toid){
					$(".chat-return").click();
                    $(".chatBox-list").children(inputId).next().click();
				}
				else if (chatState=='list') {
                    $(".chatBox-list").children(inputId).next().click();
				}
				else if (messages.type == 'img') {
					showReceiveImage(messages.content, messages.time);
				}
				else if (messages.type == 'text'){
					showReceiveMessage(messages.content, messages.time);
				}

			}
			else if(messages.type == 'agree'){
				alert(messages.content + '同意了您的聊天请求');
				showChatList(messages.toid);
			}
			else if (messages.type == 'refuse'){
				alert(messages.content + '拒绝了您的聊天请求');
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

		//展示文字和表情消息
		function showReceiveMessage(content, time) {

			$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">\n" +
				"<small class=\"chat-date\">"+
				time + "</small></div><div class=\"left\">" +
				"<div class=\"chat-avatars\"><img src=" +
				"\"images/icon01.png\"" + " alt=\"头像\"></div><div class=\"chat-message\">" +
				content + "</div></div></div>");

			//聊天框默认最底部
			$(document).ready(function () {
				$("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
			});
		}

		//展示收到的图片
		function showReceiveImage(url,time) {

			$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">" +
				"<small class=\"chat-date\">"+
				time + "</small></div><div class=\"left\">" +
				"<div class=\"chat-avatars\"><img src=" +
				"\"images/icon01.png\"" + " alt=\"头像\"></div><div class=\"chat-message\"><img src=\""+
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



		//通过ajax获取聊天记录
		function getMessages(mfromid,mtoid) {
			var messagesData;
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : 'ChatOnline/messages.action',
				data : {fromid:mfromid,toid:mtoid},
				dataType : 'json',
				success : function(result){
					messagesData = result;
				},
				error : function(result){
					alert('获取聊天记录异常');
				}
			});
			return messagesData;
		}

		//展示聊天记录
		function showMessages(smfromid,smtoid,fromimg,toimg) {
			var messagesList = getMessages(smfromid,smtoid);
			for (i = 0; i < messagesList.length; i++) {
				//取到每一条记录
				var chatMessage = messagesList[i];
				//判断是否是收到还是发出，这里是发出，展示在右边
				if (chatMessage.fromid==smfromid){
					//判断消息类型
					if (chatMessage.type=='img'){
						$(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
							"<div class=\"author-name\"><small class=\"chat-date\">"+
							chatMessage.time +"</small> </div> " +
							"<div class=\"right\"> <div class=\"chat-message\"><img src=" + chatMessage.content + "></div> " +
							"<div class=\"chat-avatars\"><img src=\""+fromimg+"\" alt=\"头像\" /></div> </div> </div>");
					}
					else {
						$(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
							"<div class=\"author-name\"><small class=\"chat-date\">"+
							chatMessage.time +"</small> </div> " +
							"<div class=\"right\"> <div class=\"chat-message\"> " +
							chatMessage.content + " </div><div class=\"chat-avatars\"><img src=\""+
							fromimg + "\" alt=\"头像\" /></div> </div> </div>");
					}

				}
				//收到，展示在左边
				else {
					//图片类型，获取图片
					if (chatMessage.type=='img'){
						$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">" +
							"<small class=\"chat-date\">"+
							chatMessage.time + "</small></div><div class=\"left\">" +
							"<div class=\"chat-avatars\"><img src=" +
							toimg + " alt=\"头像\"></div><div class=\"chat-message\"><img src=\""+
							chatMessage.content+"\" alt=\"\"></div></div></div>");
					}
					else {
						$(".chatBox-content-demo").append("<div class=\"clearfloat\"><div class=\"author-name\">\n" +
							"<small class=\"chat-date\">"+
							chatMessage.time + "</small></div><div class=\"left\">" +
							"<div class=\"chat-avatars\"><img src=" +
							toimg + " alt=\"头像\"></div><div class=\"chat-message\">" +
							chatMessage.content + "</div></div></div>");
					}

				}

			}
		}
      
