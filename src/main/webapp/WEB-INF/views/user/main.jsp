<%--
  Created by IntelliJ IDEA.
  User: 芋头
  Date: 2019/6/22
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <!-- Bootstrap Styles-->
    <link href="../../../css/main/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../../../css/main/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../../../css/main/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="../../../js/main/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <style>
        *{ margin:0; padding:0; list-style:none;}
        a{ text-decoration:none;}
        a:hover{ text-decoration:none;}
        .tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
        .tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px; line-height: 25px;  padding: 0 10px;border: 1px solid #ddd; margin: 0 2px;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
        .tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode span.disabled{ display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px; color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}

        .hea{
            color: black;
            margin: 20px;
        }
        .new{
            width: 100px;
            height: 40px;
            margin: 20px;
            background-color: #515c8e;
            border-radius: 10px;
            color: white;
        }
        .new:hover{
            background-color: #CDA1A2;
        }
        .file-box{
            display: inline-block;
            position: relative;
            padding: 3px 5px;
            overflow: hidden;
            color:#fff;
            width: 90px;
            height:30px;
            border-radius: 3px;
            background-color: #5bc0de;
            text-align: center;
            line-height: 25px;
            font-size: 12px;
            margin-top: 10px;
            margin-bottom: 20px;
        }
        .file-btn{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            outline: none;
            background-color: transparent;
            filter:alpha(opacity=0);
            -moz-opacity:0;
            -khtml-opacity: 0;
            opacity: 0;
        }

    </style>
    <script type="text/javascript" src="../../../js/main/jquery-1.10.2.js"></script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i class="fa fa-comments"></i> <strong>News </strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <%--<span>欢迎您，<c:if test="${user.status == '1'}">[管理员]</c:if>${user.username}</span>--%>
                        <span>欢迎您${user.userName}</span>
                        <img src="${user.image}" style="width: 30px;height: 30px;"> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="${ctx}/user/exit"><i class="fa fa-user fa-fw"></i> 退出并切换账号</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>


    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="${ctx}/section?state=listSection"><i class="fa fa-dashboard"></i> 文章首页</a>
                </li>
                <li>
                    <a href="${ctx}/article/mylist"><i class="fa fa-desktop"></i> 我的文章</a>
                </li>
                <li>
                    <a href="${ctx}/user/main"  class="active-menu"><i class="fa fa-bar-chart-o"></i>个人中心</a>
                </li>

                <%--<c:if test="${user.status == '1'}">--%>
                    <li>
                        <a href="${ctx}/user/manage"><i class="fa fa-qrcode"></i> 管理用户</a>
                    </li>
                <%--</c:if>--%>

                <li>
                    <a href="${ctx}/user/exit"><i class="fa fa-table"></i>退出登录</a>
                </li>

            </ul>

        </div>

    </nav>


    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        个人中心 <small>修改个人信息</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">

                        <div class="panel-body">



                            <form id="form1" action="${ctx}/user/update" method="post" enctype="multipart/form-data" onsubmit="return checkPassword()">
                                <p>头像：</p>
                                <img type="text" class="input-xlarge" id="i" style="width: 200px;height: 200px" src="${user.image}"/>
                                <%--图像预览--%>
                                <div id="localImag" class="controls">
                                    <img id="preview" class="input-xlarge" width=-1 height=-1 style="diplay:none"/>
                                </div>

                                <div class="file-box">
                                    请上传文件
                                    <input  type="file" name="file" class="file-btn" id="doc" size="28" value="${user.image}" onchange="setImagePreview()"/>
                                </div>
                                <br>
                                <p>用户名：</p>
                                <input type="text" name="userName" id="userName" value="${user.userName}" align="center" style="background-color:transparent; border: 1px solid #bbbbbb; height: 30px;width: 40%;display: inline" class="form-control">
                                <img src="../../../img/yes.png" alt="" style="width:25px;height: 25px;display: none" id="yes">
                                <img src="../../../img/no.png" alt="" style="width:25px;height: 25px;display: none" id="no"><span id="text"></span>
                                <br>
                                <p>修改密码：</p>
                                <div class="form-group">
                                    <label for="password" class="sr-only">密码</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off" style="width: 40%;">
                                </div>
                                <div class="form-group">
                                    <label for="re-password" class="sr-only">确认密码</label>
                                    <input type="password" class="form-control" id="re-password" name="password2" placeholder="确认密码" autocomplete="off" style="width: 40%;"><span id="msg" style="color: #dd0000"></span>
                                </div>
                                <p>身份：</p>
                                <c:if test="${user.role == '0'}">
                                    <input type="text" name="status"  align="center"  readonly class="form-control" id="disabledInput" type="text" placeholder="普通用户" disabled="" style="width: 40%;">
                                </c:if>
                                <c:if test="${user.role == '1'}">
                                    <input type="text" name="status"  align="center"  readonly class="form-control" id="disabledInput" type="text" placeholder="管理员" disabled="" style="width: 40%;">
                                </c:if>
                                <br>
                                <input type="submit" class="btn btn-info btn-sm"  value="确认修改">
                            </form>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            <!-- /. ROW  -->

        </div>
        <!-- /. PAGE INNER  -->
    </div>
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script type="text/javascript" src="../../../js/main/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../../js/main/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../../js/main/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../../js/main/dataTables/jquery.dataTables.js"></script>
<script src="../../../js/main/dataTables/dataTables.bootstrap.js"></script>

<%--<script src="../../../js/main/custom-scripts.js"></script>--%>


</body>


<script>
    function setImagePreview() {
        var docObj = document.getElementById("doc");
        var img = document.getElementById("i");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            img.style.display = 'none'
            imgObjPreview.style.width = '200px';
            imgObjPreview.style.height = '200px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "300px";
            localImagId.style.height = "300px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
//修改用户名，判断该用户名是否已存在
        <%--$(document).ready(function () {--%>

            <%--$("#userName").blur(--%>
                <%--function () {--%>
                    <%--$.ajax({--%>
                        <%--type:"POST",--%>
                        <%--url:"${ctx}/user/checkName",--%>
                        <%--data:{userName:$("#userName").val()},--%>
                        <%--datatype:"json",--%>
                        <%--success:function (data) {--%>
                            <%--console.info(data);--%>
                            <%--var msg=document.getElementById('msg');--%>
                            <%--$("#msg").html(data.msg);--%>

                        <%--}--%>
                    <%--})--%>
                <%--}--%>
            <%--)--%>

        <%--})--%>
        $("#userName").blur(
            function check() {
                $.ajax({
                    type:"POST",
                    url:"${ctx}/user/updateName",
                    data:{userName:$("#userName").val()},
                    datatype:"json",
                    success:function (data) {
                        console.info(data);
//                            var text=document.getElementById('text');
                        if(data.msg=="no"){
                            $("#yes").css("display","none");
                            $("#no").css("display","");
                            $("#text").html("用户名已存在");
                        }

                        if(data.msg=="yes"){
                            $("#yes").css("display","");
                            $("#no").css("display","none");
                            $("#text").html("OK");
                        }

                        if(data.msg=="empty"){
                            $("#yes").css("display","none");
                            $("#no").css("display","");
                            $("#text").html("用户名不能为空");
                        }

                        if(data.msg=="origin"){
                            $("#no").css("display","none");
                            $("#yes").css("display","none");
                            $("#text").html("");

                        }

                    }
                })
            }

        )
    })

    function checkPassword() {
        var psd1=document.getElementById("password").value;
        var psd2=document.getElementById("re-password").value;
        if(psd1!=psd2){
            $("#msg").html("两次密码输入不一致");
            return false;
        }else {
            return true;
        }

    }
</script>


<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
        alert(msg);
    }
</script>
</html>
