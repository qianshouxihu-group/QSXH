
    var fromid = '';
    var toid = '';
    var chatState = 'close';

    !function(e, t, a) {
        function r() {
            for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");
            requestAnimationFrame(r)
        }
        function n() {
            var t = "function" == typeof e.onclick && e.onclick;
            e.onclick = function(e) {
                t && t(),
                    o(e)
            }
        }
        function o(e) {
            var a = t.createElement("div");
            a.className = "heart",
                s.push({
                    el: a,
                    x: e.clientX - 5,
                    y: e.clientY - 5,
                    scale: 1,
                    alpha: 1,
                    color: c()
                }),
                t.body.appendChild(a)
        }
        function i(e) {
            var a = t.createElement("style");
            a.type = "text/css";
            try {
                a.appendChild(t.createTextNode(e))
            } catch(t) {
                a.styleSheet.cssText = e
            }
            t.getElementsByTagName("head")[0].appendChild(a)
        }
        function c() {
            return "rgb(" + "240" + "," + "80" + "," + ~~ (255 * Math.random()) + ")"
        }
        var s = [];
        e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame ||
            function(e) {
                setTimeout(e, 1e3 / 60)
            },
            i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),
            n(),
            r()
    } (window, document);

    function getParam(userid) {
        fromid = userid;
    }
    
    //布局
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 260);
        }
    }

    (window.onresize = function () {
        screenFuc();
    })();

    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(0);
        //获得聊天列表
        if (chatState=='close'){
            showChatList(fromid);
            actionControl();
            chatState = 'list';
        }
        else if (chatState=='show') {
            $(".chat-return").trigger("click");
            chatState = 'close';
        }
        else if (chatState=='list'){
            chatState = 'close';
        }
    })

    //关闭聊天框
    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
        if (chatState=='show') {
            $(".chat-return").trigger("click");
        }
        chatState = 'close';
    })

    var totalNum = $(".chat-message-num").html();
    if (totalNum == "") {
        $(".chat-message-num").css("padding", 0);
    }

    //聊天列表加载后的绑定事件
    function actionControl() {
        //未读信息数量为空时
        var totalNum = $(".chat-message-num").html();
        if (totalNum == "") {
            $(".chat-message-num").css("padding", 0);
        }
        $(".message-num").each(function () {
            var wdNum = $(this).html();
            if (wdNum == "") {
                $(this).css("padding", 0);
            }
        });

        // 进聊天页面
        $(".chat-list-people").each(function () {
            $(this).click(function () {

                var offline = $(this).next().val();
                if (offline=="12"){
                    alert('对方不在线！')
                    return false;
                }

                toid = $(this).prev().val();

                $(".chatBox-content-demo").html('');

                var n = $(this).index();
                $(".chatBox-head-one").toggle();
                $(".chatBox-head-two").toggle();
                $(".chatBox-list").fadeToggle();
                $(".chatBox-kuang").fadeToggle();

                //传名字
                $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

                chatState = 'show';

                //加载送礼图标
                var giftText="<div class='gift-send'><a href='javascript:void(0);' title='赠送礼物'><img  src='images/gift.png' alt='赠送礼物'></a></div>";
                $(".ChatInfoName").append(giftText);

                //
                var emptyText="<div class='gift-send'><img  src='images/chatempty.png' alt='哈哈'></div>";
                $(".ChatInfoName").append(emptyText);

                //加载约会图标
                var dateText="<div class='fast-date'><a href='javascript:void(0);' title='发起约会'><img  src='images/cdating.png' alt='发起约会'></a></div>";
                $(".ChatInfoName").append(dateText);

                //赠送礼物
                $(".gift-send").click(function(){
                    if (confirm('将扣除100金币，确认赠送礼物？')){
                        var sendState = giftSend(toid);
                        if (sendState==true){
                            yanhua();
                        }
                    }
                });

                //传头像
                $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

                //获得聊天记录
                showMessages(fromid,toid,'images/icon01.png','images/icon01.png');

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });

            })
        });

        //返回列表
        $(".chat-return").off("click");
        $(".chat-return").click(function () {
            $(".chatBox-head-one").toggle(1);
            $(".chatBox-head-two").toggle(1);
            $(".chatBox-list").fadeToggle(1);
            $(".chatBox-kuang").fadeToggle(1);
            $(".chatBox-content-demo").html('');
            chatState = 'list';
        });

        //删除对象
        $(".chat-delete").off("click");
        $(".chat-delete").click(function (event) {
            if (confirm('是否删除？（将清空聊天记录）')){
                toid = $(this).parent().prev().val();
                deleteChatUser(fromid,toid);
            }
            event.stopPropagation();
        });



        //发送信息
        $("#chat-fasong").off("click");
        $("#chat-fasong").click(function () {
            var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
            if (textContent != "") {
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+
                    getDateFull() +"</small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
                //发送后清空输入框
                $(".div-textarea").html("");


                //请求到服务器
                sendMessage(textContent,toid,'text');

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            }
        });

        //发送表情
        $("#chat-biaoqing").off("click");
        $("#chat-biaoqing").click(function () {
            $(".biaoqing-photo").toggle();
        });

        $(document).off("click");
        $(document).click(function () {
            $(".biaoqing-photo").css("display", "none");
        });

        $("#chat-biaoqing").click(function (event) {
            event.stopPropagation();//阻止事件
        });


        $(".emoji-picker-image").each(function () {
            $(this).off("click");
            $(this).click(function () {
                var bq = $(this).parent().html();
                console.log(bq)
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+
                    getDateFull() +"</small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + bq + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
                //发送后关闭表情框
                $(".biaoqing-photo").toggle();

                //请求到服务器
                sendMessage(bq,toid,'text');

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            })
        });
    }

    //发送图片
    function selectImg(pic) {
        if (!pic.files || !pic.files[0]) {
            return false;
        }
        var uploadResult = uploadFile(pic);

    }

    //通过ajax获得聊天列表
    function getChatList(cfromid) {
        var chatListData;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : 'ChatOnline/chatList.action',
            data : {userid:cfromid},
            dataType : 'json',
            success : function(result){
                chatListData = result;
            },
            error : function(result){
                alert('获取聊天列表异常');
            }
        });
        return chatListData;
    }

    //展示列表信息
    function showChatList(scfromid) {
        var userList = getChatList(scfromid);
        var listData = "";
        var online = "";
        for (i = 0; i < userList.length; i++) {
            var chatUser = userList[i];
            if (chatUser.uonline=="12") {
                online = "<i class='fa fa-circle offline'>&nbsp;&nbsp;离线</i>";
            }
            else {
                online = "<i class='fa fa-circle online'>&nbsp;&nbsp;在线</i>";
            }
            listData = listData +
                "<input type='hidden' value=\"" +
                chatUser.userid +"\" id=\"" + chatUser.userid + "\">" +
                "<div class='chat-list-people'>" +
                "<div><img src=\"" +
                "images/icon01.png" + "\" alt='头像'></div>" +
                "<div class=\"chat-name\">" +
                "<p>"+ chatUser.uname + "</p></div>" +
                online + "<div class='chat-delete'>删除</div></div>"+
                "<input type='hidden' value=\""+chatUser.uonline+"\">";
        }
        $(".chatBox-list").html(listData);
    }

    //文件上传
    function uploadFile(pic){
        var backData = "no"
        //创建一个FormData对象：用一些键值对来模拟一系列表单控件：
        // 即把form中所有表单元素的name与value组装成一个queryString
        var form = new FormData();
        var fileObj = pic.files[0];
        form.append("img",fileObj);

        $.ajax({
            type:"post",
            data:form,
            url:"MyUpload/imgFile.action",
            contentType: false,
                //必须false才会自动加上正确的Content-Type
                /*
                必须false才会避开jQuery对 formdata 的默认处理
                XMLHttpRequest会对 formdata 进行正确的处理
                */
            processData: false,
            success:function(data){
                if (data!='no'){
                    var reader = new FileReader();
                    reader.onload = function (evt) {
                        var images = evt.target.result;
                        $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                            "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                            "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                            "<div class=\"chat-avatars\"><img src=\"images/icon01.png\" alt=\"头像\" /></div> </div> </div>");

                        //发送信息
                        sendMessage(data,toid,'img');

                        $(document).ready(function () {
                            $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                        });

                        backData = "yes"
                    };
                    reader.readAsDataURL(pic.files[0]);
                }
            }
        });

        return backData;
    }

    //删除聊天对象
    function deleteChatUser(dfromid,dtoid) {
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : 'ChatOnline/delete.action',
            data : {fromid:dfromid,toid:dtoid},
            success : function(result){
                alert(result);
                if (result=="yes"){
                    alert('删除成功');
                    showChatList(dfromid);
                }
                else if (result=="no"){
                    alert('删除失败，未知错误')
                }
            },
            error : function(result){
                alert('删除失败，连接异常');
            }
        });
    }

    //赠送送礼
    function giftSend(gtoid) {
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : 'MyFollowManager/gift.action',
            data : {toid:gtoid},
            success : function(result){
                if (result=='yes'){
                    alert('赠送成功');
                    return true;
                }
                else if (result=='noenough') {
                    alert('您的金币不足');
                }
                else if (result=='no'){
                    alert('赠送礼物失败，未知异常');
                }
                return false;
            },
            error : function(result){
                alert('赠送礼物失败，连接异常');
                return false;
            }
        });
    }

    //简陋烟花特效
    function yanhua() {

            var aDiv=[];
            var oDiv=null;
            var _oDiv=document.createElement('div');
            var i=0;

            var chatBox = $(".chatBox-content-demo");
            var x  = (document.body.clientWidth-chatBox.offset().left)/2+chatBox.offset().left;
            var y = (document.body.clientHeight-chatBox.offset().top)/2+chatBox.offset().top;

            _oDiv.style.position='absolute';
            _oDiv.style.background='red';
            _oDiv.style.width='3px';
            _oDiv.style.height='30px';
            _oDiv.style.left=x+'px';
            _oDiv.style.top=document.documentElement.clientHeight-30+'px';

            document.body.appendChild(_oDiv);

            var t=setInterval(function (){
                if(_oDiv.offsetTop<=y)
                {
                    clearInterval(t);
                    show();
                    document.body.removeChild(_oDiv);
                }
                _oDiv.style.top=_oDiv.offsetTop-30+'px';
            }, 30);

            function show()
            {
                var oDiv=null;

                for(i=0;i<100;i++)
                {
                    oDiv=document.createElement('div');

                    oDiv.style.width='3px';
                    oDiv.style.height='3px';
                    oDiv.style.background='#'+Math.ceil(Math.random()*0xEFFFFF+0x0FFFFF).toString(16);
                    oDiv.style.position='absolute';
                    oDiv.style.left=x+'px';
                    oDiv.style.top=y-30+'px';

                    var a=Math.random()*360;

                    //oDiv.speedX=Math.random()*40-20;
                    //oDiv.speedY=Math.random()*40-20;

                    oDiv.speedX=Math.sin(a*180/Math.PI)*20*Math.random();
                    oDiv.speedY=Math.cos(a*180/Math.PI)*20*Math.random();

                    document.body.appendChild(oDiv);

                    aDiv.push(oDiv);
                }
            }

            setInterval(doMove, 30);

            function doMove()
            {
                for(i=0;i<aDiv.length;i++)
                {
                    aDiv[i].style.left=aDiv[i].offsetLeft+aDiv[i].speedX+'px';
                    aDiv[i].style.top=aDiv[i].offsetTop+aDiv[i].speedY+'px';
                    aDiv[i].speedY+=1;

                    if(aDiv[i].offsetLeft<0 || aDiv[i].offsetLeft>document.documentElement.clientWidth || aDiv[i].offsetTop<0 || aDiv[i].offsetTop>document.documentElement.clientHeight)
                    {
                        document.body.removeChild(aDiv[i]);
                        aDiv.splice(i, 1);
                    }
                }
            }

    }


