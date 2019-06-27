
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: TestUser
  Date: 2019/6/22
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看子类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${ctx}/static/jquery-1.8.3.min.js"></script>
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
    <%--<script src="${ctx}/js/"></script>--%>
    <style>
        *{ margin:0; padding:0; list-style:none;}
        a{ text-decoration:none;}
        a:hover{ text-decoration:none;}
        .tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
        .tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px; line-height: 25px;  padding: 0 10px;border: 1px solid #ddd; margin: 0 2px;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
        .tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode span.disabled{ display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px; color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
    </style>
    <script type="text/javascript" src="../../../js/main/jquery-1.10.2.js"></script>
    <%--<script src="${ctx}/js/"></script>--%>
    <script>
        $(document).ready(function () {

            $(".delete").bind("click",function () {
                if(confirm("确定要删除吗？")){
                    var id = $(this).attr("dict");
                    window.location.href = "${ctx}/Category/subCategoryDelete/"+id;
                }
            });
        });
    </script>
</head>


<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">用户管理</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i class="fa fa-comments"></i> <strong>Article </strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <%--<span>欢迎您，<c:if test="${user.status == '1'}">[管理员]</c:if>${user.username}</span>--%>
                    <span>欢迎您，${user.userName}</span>
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
                    <a href="${ctx}/news?state=myNews&userId=${user.id}" ><i class="fa fa-desktop"></i> 我的文章</a>
                </li>
                <li>
                    <a href="${ctx}/Category/list" class="active-menu"><i class="fa fa-qrcode"></i> 类别管理</a>
                </li>


                <li>
                    <a href="${ctx}/user/main"><i class="fa fa-bar-chart-o"></i>个人中心</a>
                </li>
                <%--<c:if test="${user.status == '1'}">--%>
                <li>
                    <a href="${ctx}/user/manage" ><i class="fa fa-qrcode"></i> 管理用户</a>
                </li>
                <%--</c:if>--%>

                <li>
                    <a href="${ctx}/user/exit"><i class="fa fa-table"></i>退出登录</a>
                </li>

            </ul>

        </div>

    </nav>
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        子类型 <small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <tags:nav/>
                    <div class="panel panel-default">

                        <div class="panel-body">

                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center">
                                    <thead>
                                    <tr style="text-align: center">
                                        <%--<th>序号</th>--%>
                                        <th style="text-align: center">类型名称</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>

                                    <c:forEach items="${CategoryList.content}"  var="Category" varStatus="status">
                                        <c:if test="${Category.parents_id == id}">
                                        <tr class="odd gradeX" id="par">
                                                <%--<td>${status.index+1}</td>--%>
                                                <td style="text-align: center">  ${Category.typename} </td>
                                                <td style="text-align: center"><a href="${ctx}/Category/updateSubCategory/${Category.id}"  class="btn btn-info btn-sm">编辑</a>
                                                    |<a href="#"  dict="${Category.id}"  class="delete btn btn-info btn-sm  ">删除</a></td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                    <td colspan="3">
                                        <a href="${ctx}/Category/subCategoryAdd/${id}">添加子类</a></li>
                                    </td>
                                    </tbody>
                                </table>
                                <tags:pagination1 page="${CategoryList}" paginationSize="${PAGE_SIZE}"/>
                                <br>

                                ${msg}
                            </div>

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
<script type="text/javascript" src="../../../js/main/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../../js/main/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../../js/main/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../../js/main/dataTables/jquery.dataTables.js"></script>
<script src="../../../js/main/dataTables/dataTables.bootstrap.js"></script>





<%--<table cellSpacing="1" cellPadding="0" width="80%" bgColor="#e0ffff" border="0">--%>
    <%--<tr><th>类型名称</th>--%>
        <%--<th>操作</th></tr>--%>

    <%--<c:forEach items="${subCategoryList}" var="subCategory">--%>
        <%--<tr align="center">--%>
            <%--<td>${subCategory.typename}</td>--%>
            <%--<td>--%>
             <%--<a href="${ctx}/Category/updateSubCategory/${subCategory.id}">编辑</a>--%>
                <%--|<a href="#" class="delete" dict="${subCategory.id}">删除</a></td>--%>
        <%--</tr>--%>

    <%--</c:forEach>--%>
<%--</table>--%>
<%--${msg}--%>
<%--<ul>--%>
    <%--<li> --%>
<%--</ul>--%>
</body>
</html>
