
    var fromid = '';
    var toid = '';
    var serverurl = '';

    function getParam(userid,url) {
        fromid = userid;
        serverurl = url;
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

    var clock = 1;

    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(10);
        //获得聊天列表
        showChatList();
        actionControl();
    })

    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
    })

    var totalNum = $(".chat-message-num").html();
    if (totalNum == "") {
        $(".chat-message-num").css("padding", 0);
    }

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

                clock = 1;

                var n = $(this).index();
                $(".chatBox-head-one").toggle();
                $(".chatBox-head-two").toggle();
                $(".chatBox-list").fadeToggle();
                $(".chatBox-kuang").fadeToggle();

                //传名字
                $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

                //加载送礼图标
                giftText="<div class='gift-send'><a href='javascript:void(0);' title='赠送礼物'><img  src='images/gift.png' alt='赠送礼物'></a></div>";
                $(".ChatInfoName").append(giftText);

                //赠送礼物
                $(".gift-send").click(function(){
                    gifturl = "MyFollowManager/gift.action?toid="+toid;
                    if (confirm('将扣除100金币，确认赠送礼物？')){
                        location.href=gifturl;
                    }
                });

                //传头像
                $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });

            })
        });

        //返回列表
        $(".chat-return").off("click");
        $(".chat-return").click(function () {
            if (confirm('将清空聊天记录，是否返回？')) {
                $(".chatBox-head-one").toggle(1);
                $(".chatBox-head-two").toggle(1);
                $(".chatBox-list").fadeToggle(1);
                $(".chatBox-kuang").fadeToggle(1);
                $(".chatBox-content-demo").html('');
            }

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

        //聊天框默认最底部
        $(document).ready(function () {
            $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
        });

    }

    //通过ajax获得聊天列表
    function getChatList() {
        var chatListData;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : 'MyFollowManager/chat.action',
            data : {userid:fromid},
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
    function showChatList() {
        var userList = getChatList();
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
                alert('图片上传返回信息---'+data);
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

                    };
                    reader.readAsDataURL(pic.files[0]);
                }
            }
        });
    }
