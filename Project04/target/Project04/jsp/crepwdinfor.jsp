<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!--[if IE 8]><style>.ie8 .alert-circle,.ie8 .alert-footer{display:none}.ie8 .alert-box{padding-top:75px}.ie8 .alert-sec-text{top:45px}</style><![endif]-->
    <title></title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #E6EAEB;
            font-family: Arial, '微软雅黑', '宋体', sans-serif
        }
        .alert-box {
            display: none;
            position: relative;
            margin: 96px auto 0;
            padding: 180px 85px 22px;
            border-radius: 10px 10px 0 0;
            background: #FFF;
            box-shadow: 5px 9px 17px rgba(102,102,102,0.75);
            width: 286px;
            color: #FFF;
            text-align: center
        }
        .alert-box p {
            margin: 0
        }
        .alert-circle {
            position: absolute;
            top: -50px;
            left: 111px
        }
        .alert-sec-circle {
            stroke-dashoffset: 0;
            stroke-dasharray: 735;
            transition: stroke-dashoffset 1s linear
        }
        .alert-sec-text {
            position: absolute;
            top: 11px;
            left: 190px;
            width: 76px;
            color: #000;
            font-size: 68px
        }
        .alert-sec-unit {
            font-size: 34px
        }
        .alert-body {
            margin: 35px 0
        }
        .alert-head {
            color: #242424;
            font-size: 28px
        }
        .alert-concent {
            margin: 25px 0 14px;
            color: #7B7B7B;
            font-size: 18px
        }
        .alert-concent p {
            line-height: 27px
        }
        .alert-btn {
            display: block;
            border-radius: 10px;
            background-color: #fa8367;
            height: 55px;
            line-height: 55px;
            width: 286px;
            color: #FFF;
            font-size: 20px;
            text-decoration: none;
            letter-spacing: 2px
        }
        .alert-btn:hover {
            background-color: #fa6442
        }
        .alert-footer {
            margin: 0 auto;
            height: 42px;
            width: 120px
        }
        .alert-footer-icon {
            float: left
        }
        .alert-footer-text {
            float: left;
            border-left: 2px solid #EEE;
            padding: 3px 0 0 5px;
            height: 40px;
            color: #fa6442;
            font-size: 12px;
            text-align: left
        }
        .alert-footer-text p {
            color: #7A7A7A;
            font-size: 22px;
            line-height: 18px
        }
    </style>
</head>
<body class="ie8">

<div id="js-alert-box" class="alert-box" style="display: block;">
    <svg class="alert-circle" width="234" height="234">
        <circle cx="117" cy="117" r="108" fill="#FFF" stroke="#fa6442" stroke-width="17"></circle>
        <circle id="js-sec-circle" class="alert-sec-circle" cx="117" cy="117" r="108" fill="transparent" stroke="#F4F1F1" stroke-width="18" transform="rotate(-90 117 117)" style="stroke-dashoffset: -294;"></circle>
        <text class="alert-sec-unit" x="82" y="172" fill="#BDBDBD">秒</text>
    </svg>
    <div id="js-sec-text" class="alert-sec-text">6</div>
    <div class="alert-body">
        <div id="js-alert-head" class="alert-head">修改密码成功</div>
        <div class="alert-concent">
            <p>修改密码成功</p>
            <p>需请重新登录！</p>
        </div>
        <a id="js-alert-btn" class="alert-btn" href="<%=basePath%>testManager/outLogin.action">立即前往登录</a>
    </div>
</div>


<script type="text/javascript">
    function alertSet(e) {
        document.getElementById("js-alert-box").style.display = "block",
            document.getElementById("js-alert-head").innerHTML = e;
        var t = 5,
            n = document.getElementById("js-sec-circle");
        document.getElementById("js-sec-text").innerHTML = t,
            setInterval(function() {
                    if (0 == t){
                        location.href="<%=basePath%>testManager/outLogin.action";
                    }else {
                        t -= 1,
                            document.getElementById("js-sec-text").innerHTML = t;
                        var e = Math.round(t / 10 * 735);
                        n.style.strokeDashoffset = e - 735
                    }
                },
                970);
    }
</script>

<script>alertSet('前往会员登录');</script>

</body>

</html>