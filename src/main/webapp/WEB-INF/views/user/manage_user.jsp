<%--
  Created by IntelliJ IDEA.
  User: 芋头
  Date: 2019/6/22
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
    </style>
    <script type="text/javascript" src="../../../js/main/jquery-1.10.2.js"></script>
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
            <a class="navbar-brand" href="#"><i class="fa fa-comments"></i> <strong>News </strong></a>
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
                    <a href="${ctx}/section?state=listSection"><i class="fa fa-dashboard"></i> 新闻首页</a>
                </li>
                <li>
                    <a href="${ctx}/news?state=myNews&userId=${user.id}" ><i class="fa fa-desktop"></i> 我的新闻</a>
                </li>
                <li>
                    <a href="${ctx}/Category/list"><i class="fa fa-bar-chart-o"></i>类别管理</a>
                </li>

                <li>
                    <a href="${ctx}/user/main"><i class="fa fa-bar-chart-o"></i>个人中心</a>
                </li>

                <%--<c:if test="${user.status == '1'}">--%>
                    <li>
                        <a href="${ctx}/user/manage" class="active-menu"><i class="fa fa-qrcode"></i> 管理用户</a>
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
                        用户列表 <small>管理用户身份与权限</small>
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

                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>

                                        <th>姓名</th>
                                        <th>身份</th>
                                        <th>删除</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%--<tr class="odd gradeX">--%>

                                    <%--<td>Internet Explorer 4.0</td>--%>
                                    <%--<td>Win 95+</td>--%>
                                    <%--<td class="center"><a href="#" class="btn btn-info btn-sm">删除</a></td>--%>
                                    <%--<td class="center"><a href="#" class="btn btn-info btn-sm">修改</a></td>--%>
                                    <%--</tr>--%>



                                    <c:forEach items="${users.content}"  var="user" varStatus="status">
                                        <tr class="odd gradeX" id="par">

                                            <td>${user.userName}</td>

                                            <input type="hidden" id="userId" value="${user.id}">
                                            <td>
                                                <c:if test="${user.role == 0}">
                                                    <select id="updateStatus" onchange="optionChange(this)">
                                                        <option value="0" selected="selected">普通用户</option>
                                                        <option value="1">管理员</option>
                                                    </select>
                                                </c:if>
                                                <c:if test="${user.role == 1}">管理员</c:if>
                                            </td>

                                            <td class="center"><a href="${ctx}/user/delete/${user.id}" class="btn btn-info btn-sm">删除</a></td>

                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                                <tags:pagination page="${users}" paginationSize="${PAGE_SIZE}"/>
                                <br>


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

<script type="text/javascript">
    function optionChange(obj){
        var res = confirm('要将其升级为管理员吗？');
        if(res == true){
            $.ajax({
                type:"POST",
                url:"${ctx}/user/updateRole",
                data:{userId:$(obj).parents().parents("#par").children("#userId").val()},
                datatype:"json",
                success:function (data) {
                    console.info(data);
                    if(data.res==true){
                        alert("该用户已升级为管理员！");
                    }

                }
            })

        }
    }
</script>
</html>
