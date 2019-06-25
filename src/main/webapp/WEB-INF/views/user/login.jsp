<%--
  Created by IntelliJ IDEA.
  User: 芋头
  Date: 2019/6/22
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />




    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../../../css/loginRegister/bootstrap.min.css">
    <link rel="stylesheet" href="../../../css/loginRegister/animate.css">
    <link rel="stylesheet" href="../../../css/loginRegister/style.css">


    <!-- Modernizr JS -->
    <script src="../../../js/loginRegister/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../../../js/loginRegister/respond.min.js"></script>
    <![endif]-->
    <script src="../../../js/jquery.min.js"></script>

</head>
<body>

<div class="container">

    <div class="row">
        <div class="col-md-4 col-md-offset-4">


            <!-- Start Sign In Form -->
            <div class="fh5co-form animate-box" data-animate-effect="fadeIn">
                <h2>登录</h2>
                <div id="msg" style="text-align: center">${msg}</div>
                <div class="form-group">
                    <label for="userName" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off">
                </div>
                <%--<div class="form-group">--%>
                <%--<label for="remember"><input type="checkbox" id="remember"> 记住密码</label>--%>
                <%--</div>--%>
                <div class="form-group">
                    <p>还未注册？<a href="${ctx}/user/toRegister">注册</a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="登录" id="login" class="btn btn-primary">
                </div>
            </div>
            <!-- END Sign In Form -->

        </div>

    </div>

</div>

<!-- jQuery -->
<script src="../../../js/loginRegister/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../js/loginRegister/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="../../../js/loginRegister/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="../../../js/loginRegister/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="../../../js/loginRegister/main.js"></script>


</body>

<script type="text/javascript">
    $(document).ready(function () {

        $("#login").click(
            function () {
                $.ajax({
                    type:"POST",
                    url:"${ctx}/user/login",
                    data:{userName:$("#userName").val(),password:$("#password").val()},
                    datatype:"json",
                    success:function (data) {
                        console.info(data);
                        var msg=document.getElementById('msg');

                        if(data.res == "fail"){
                            $("#msg").html(data.msg);
                        }else {
                            window.location.href=data.msg;
                        }


                    }
                })
            }
        )

    })
</script>
</html>
