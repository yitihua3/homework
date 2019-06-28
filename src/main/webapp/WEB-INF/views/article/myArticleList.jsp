<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/23
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>我的文章</title>
    <!-- Bootstrap Styles-->
    <link href="../../../css/main/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../../../css/main/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../../../css/main/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
            <a class="navbar-brand" href="#"><i class="fa fa-comments"></i> <strong>article </strong></a>
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
                    <a href="${ctx}/login?state=single&userName=${user.userName}"><i class="fa fa-bar-chart-o"></i>个人中心</a>
                </li>

                <c:if test="${user.role == '1'}">
                    <li>
                        <a href="${ctx}/login?state=main"><i class="fa fa-qrcode"></i> 管理用户</a>
                    </li>
                </c:if>

                <li>
                    <a href="${ctx}/login?state=exit"><i class="fa fa-table"></i>退出登录</a>
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
                        我的文章 <small>My article</small>
                    </h1>
                    <a href="${ctx}/article/add" class="btn btn-info btn-sm" style="display: inline-block;position: relative;bottom: 62px;margin-left: 280px;">写文章</a>
                </div>
            </div>
            <!-- /. ROW  -->


            <div class="row">

                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            我发布的文章列表
                        </div>


                        <c:forEach items="${articleList}" var="article" varStatus="role">
                            <div class="panel-body" style="position: relative;">

                                <div class="alert alert-info" style="padding-bottom: 37px;">
                                    <a href="${ctx}/article?state=checkarticle&articleId=${article.id}" style="position: relative;top:10px;">${article.title}</a>



                                    <span style="position: absolute;top:43px;left:55%;">

                                        <fmt:parseDate value="${article.createTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${date}" pattern="yyyy-MM-dd  HH:mm"/>
                                        <%--fmt:formatDate这里的value只能是Date类型，因此要先使用fmt:parseDate转换格式--%>
                                        <%--jstl标签设置日期格式--%>
                                        &nbsp;&nbsp;&nbsp;
                                         类别：${article.category.typename}
                                        <%--<c:forEach items="${sectionList}" var="section">--%>
                                            <%--<c:if test="${article.sectionId eq section.sectionId}">--%>
                                                <%--${section.sectionName}--%>
                                            <%--</c:if>--%>
                                        <%--</c:forEach>--%>
                                        &nbsp;&nbsp;

                                        赞：${article.praise} &nbsp;&nbsp; 浏览：${article.view}
                                    </span>


                                    <a href="#" class="delete" articleId="${article.id}"><button type="button" class="btn btn-warning btn-circle" style="position: absolute;right:10%;opacity: 0.7"><span>删除</span></button></a>
                                    <a href="${ctx}/article/update/${article.id}"><button type="button" class="btn btn-primary btn-circle" style="position: absolute;right: 5%;opacity: 0.7"><span>编辑</span></button></a>

                                </div>

                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>

            <br><br><br>

            <tags:pagination page="${users}" paginationSize="${PAGE_SIZE}"/>



            <%--<div id="page" style="text-align: center;">--%>
                <%--共<span class="all">${splitPage.totalRows}</span>条--%>
                <%--<span class="now">${splitPage.currentPage}/</span><span class="total">${splitPage.totalPage}</span>--%>
                <%--<a href="${ctx}/article?state=myarticle&flag=first&current=${splitPage.currentPage}">首页</a>--%>
                <%--<a href="${ctx}/article?state=myarticle&flag=previous&current=${splitPage.currentPage}">上页</a>--%>
                <%--<a href="${ctx}/article?state=myarticle&flag=next&current=${splitPage.currentPage}">下页</a>--%>
                <%--<a href="${ctx}/article?state=myarticle&flag=last&current=${splitPage.currentPage}">尾页</a>--%>
            <%--</div>--%>
            <%--<div align="center">--%>
                <%--<c:forEach begin="1" end="${splitPage.totalPage}" var="page">--%>
                    <%--<a href="${ctx}/article?state=myarticle&flag=${page}&current=${splitPage.currentPage}">${page}</a>--%>
                <%--</c:forEach>--%>
            <%--</div>--%>





        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../../../js/main/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../../js/main/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../../js/main/jquery.metisMenu.js"></script>
<!-- Custom Js -->
<script src="../../../js/main/custom-scripts.js"></script>
<script src="${ctx}/static/jquery-1.8.3.min.js"></script>

</body>

<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
        alert(msg);
    }
</script>

<script>
    $(document).ready(function () {

        $(".delete").bind("click",function () {
            if(confirm("确定要删除吗？")){
                var id = $(this).attr("articleId");
                window.location.href = "${ctx}/article/delete/"+id;
            }
        });
    });
</script>

</html>
