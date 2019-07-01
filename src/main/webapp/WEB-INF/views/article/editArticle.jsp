<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/23
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>编辑文章</title>
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
                    <a href="${ctx}/section?state=listSection" class="active-menu"><i class="fa fa-dashboard"></i> 文章首页</a>
                </li>
                <li>
                    <a href="${ctx}/article/mylist" ><i class="fa fa-desktop"></i> 我的文章</a>
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
                        编辑文章 <small>This is for edit article</small>
                    </h1>

                    <div class="jumbotron">

                        <%--<form action="${ctx}/article?state=updatearticle" method="post">--%>
                        <form id="form" action="${ctx}/article/update" method="post" enctype="multipart/form-data">
                            <input id="id" name="id" type="hidden" value="${article.id}">
                            <input type="text" name="title" style="width: 100%; height: 45px;margin-bottom: 10px;" id="title" value="${article.title}" class="form-control">
                            <textarea id="ueditor" name="content" style="width:100%;height: 500px;overflow: auto">${article.content}</textarea>

                            类别
                            <select id="categoryId" name="categoryId">
                                <c:forEach items="${subCategoryList}" var="category">
                                    <c:choose>
                                        <c:when test="${article.category.id eq category.id}">
                                            <option value="${category.id}" selected="selected">${category.typename}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.id}">${category.typename}</option>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </select>

                            <div class="file-box">
                                上传附件
                                <input  type="file" id="file" name="file" class="file-btn"  size="28"  />
                            </div>


                            <%--<input type="button" class="btn btn-info btn-sm" id="save" value="保存修改">--%>
                            <input type="submit" name="submit"  class="btn btn-info btn-sm" value="保存修改">

                            <a href="${ctx}/article?state=checkarticle&articleId=${id}"  class="btn btn-info btn-sm" id="check" style="display: none">查看文章</a>
                        </form>



                    </div>
                </div>
            </div>


        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<script src="../../../js/main/bootstrap.min.js"></script>
<script src="../../../js/main/jquery.metisMenu.js"></script>
<script src="../../../js/main/morris/raphael-2.1.0.min.js"></script>
<script src="../../../js/main/morris/morris.js"></script>
<script src="../../../js/main/easypiechart.js"></script>
<script src="../../../js/main/easypiechart-data.js"></script>

<script src="../../../js/main/custom-scripts.js"></script>
<script src="../../../js/main/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="../../../utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="../../../utf8-jsp/ueditor.all.js"></script> 




<script type="text/javascript">
    $(document).ready(function () {

        $("#save").click(
                function () {
                    var fileObj = document.getElementById("file").files[0]; //获取文件对象
                    $.ajax({
                        type:"POST",
                        url:"${ctx}/article/update",
                        data:{id:$("#id").val(),categoryId:$("#categoryId").val(),title:$("#title").val(),content:UE.getEditor('ueditor').getContent(),file:fileObj},
                        datatype:"json",
                        success:function (data) {
                            console.info(data);
                            if(data.res==true){
                                alert("修改成功！");
                            }
                            $("#check").css("display","");

                        }
                    })
                }
        )

    })

</script>


<script type="text/javascript">
    //    让标题获得焦点
    //    docuent.getElementById("title").focus() //这个只能让光标在字的最前面
    var t=$("#title").val();
    $("#title").val("").focus().val(t); //让光标在最后一个字后面，原理就是获得焦点后重新把自己复制粘帖一下
</script>


<script type="text/javascript">
    UE.getEditor("ueditor");
    // var content = UE.getPlainTxt();//content就是编辑器的带格式的内容  
</script>


<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
        alert(msg);
    }
</script>
</body>
</html>

