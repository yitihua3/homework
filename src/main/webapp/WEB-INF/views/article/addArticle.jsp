<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/23
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>写文章</title>
    <!-- Bootstrap Styles-->
    <link href="../../../css/main/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../../../css/main/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="../../../js/main/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../../../css/main/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

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
            <a class="navbar-brand" href="#"><i class="fa fa-comments"></i> <strong>Article </strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <span>欢迎您，<c:if test="${user.role == '1'}">[管理员]</c:if>${user.userName}</span>
                    <img src="${user.image}" style="width: 30px;height: 30px;"> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="${ctx}/login?state=change"><i class="fa fa-user fa-fw"></i> 退出并切换账号</a>
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
                    <a href="${ctx}/article/mylist" class="active-menu"><i class="fa fa-desktop"></i> 我的文章</a>
                </li>
                <li>
                    <a href="${ctx}/user/main"><i class="fa fa-bar-chart-o"></i>个人中心</a>
                </li>

                <c:if test="${user.role == '1'}">
                    <li>
                        <a href="${ctx}/login?state=main"><i class="fa fa-qrcode"></i> 管理用户</a>
                    </li>
                </c:if>

                <li>
                    <a href="${ctx}/user/exit"><i class="fa fa-table"></i>退出登录</a>
                </li>

            </ul>

        </div>

    </nav>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">


            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        添加文章 <small>This is for adding article</small>
                    </h1>

                    <div class="jumbotron" style="padding-top:0px;">

                        <form action="${ctx}/article/add" method="post" enctype="multipart/form-data">

                            <input type="text" style="width: 100%; height: 45px;margin-bottom: 10px;" name="title" placeholder="输入文章标题" class="form-control">
                            <textarea id="ueditor" name="content" style="width:100%;height: 500px;overflow: auto"></textarea>

                            <div class="file-box">
                                上传附件
                                <input  type="file" name="file" class="file-btn" id="doc" size="28"  />
                            </div>

                            类别
                        <select id="first" name="categoryId" onchange="categorySelect()">
                            <c:forEach items="${SubCategoryList}" var="category">
                                <option value="${category.id}">${category.typename}</option>
                            </c:forEach>
                        </select>

                        <%--<select id="second"  name="subCategoryId">--%>

                        <%--</select>--%>



                            <input type="submit" name="submit"  class="btn btn-info btn-sm" value="发布">
                        </form>








                    </div>
                </div>
            </div>


        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<!--  <script src="assets/js/jquery-1.10.2.js"></script> -->
<!-- Bootstrap Js -->
<script src="../../../js/main/bootstrap.min.js"></script>

<!-- Metis Menu Js -->
<script src="../../../js/main/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="../../../js/main/morris/raphael-2.1.0.min.js"></script>
<script src="../../../js/main/morris/morris.js"></script>


<script src="../../../js/main/easypiechart.js"></script>
<script src="../../../js/main/easypiechart-data.js"></script>

<script src="../../../js/main/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="../../../js/main/custom-scripts.js"></script>
<script src="../../../js/main/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="../../../utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="../../../utf8-jsp/ueditor.all.js"></script> 

<script type="text/javascript">
    UE.getEditor("ueditor");
</script>


<script type="text/javascript">

    $(function() {
        $("#second").hide(); //初始化的时候第二个栏目下拉列表隐藏
    });

    function categorySelect(obj){
        var parentCategoryId = $("#first").val();//得到第一个下拉列表的值
        //alert(parentCategoryId);

            $.ajax({
                type:"POST",
                url:"${ctx}/article/subCategory",
                data:{parentCategoryId:parentCategoryId},
                datatype:"json",
                success:function (data) {
                    console.info(data);
                    if(data.res==true){
                        alert("该用户已升级为管理员！");
                    }

                }
            })


    }
</script>


</body>
</html>