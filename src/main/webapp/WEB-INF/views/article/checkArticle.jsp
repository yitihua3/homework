<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/30
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新闻详情</title>
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
    <script src="../../../js/main/bootstrap.min.js"></script>
    <style type="text/css">
        .pic{
            width: 50px;
            height: 50px;
            margin-bottom: 20px;
            margin-left: 10px;
            display: inline-block;
        }

        .round{
            width: 37px;
            height: 37px;
            display: flex;
            border-radius: 50%;
            margin-bottom: 20px;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            margin-right: 5px;fa fa-dashboard

            display: inline;
            vertical-align: middle;
        }
        .heart {
            width: 100px;
            height: 100px;
            background: url("https://cssanimation.rocks/images/posts/steps/heart.png") no-repeat;
            background-position: 0 0;
            cursor: pointer;
            -webkit-transition: background-position 1s steps(28);
            transition: background-position 1s steps(28);
            -webkit-transition-duration: 0s;
            transition-duration: 0s;
        }
        .heart.is-active {
            -webkit-transition-duration: 1s;
            transition-duration: 1s;
            background-position: -2800px 0;
        }



        .stage {
            position:absolute;
            left: 80%;
            top:10px;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }


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
                    <a href="${ctx}/section?state=listSection"><i class="fa fa-dashboard"></i> 新闻首页</a>
                </li>
                <li>
                    <a href="${ctx}/article?state=myarticle&userId=${user.id}" ><i class="fa fa-desktop"></i> 我的新闻</a>
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
    <div id="page-wrapper">
        <div id="page-inner">


            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1 style="margin-left: 30px;font-size: 50px;">${article.title}</h1>

                        <c:if test="${user.id == article.user.id}">
                            <a href="${ctx}/article/update${article.id}" class="btn btn-info btn-sm" style="display: inline-block;position: relative;bottom: 27px;margin-left: 1120px;">编辑</a>
                        </c:if>

                        <h4 style="margin-left: 30px;">发布时间&nbsp;${article.createTime}</h4>
                        <h4 style="margin-left: 30px;">最后编辑时间&nbsp;${article.lastEditTime}</h4>
                        <h4 style="margin-left: 30px;margin-top: 20px;">类别：${article.category.typename}</h4>
                        <h4 style="margin-left: 30px;">作者：${article.user.userName}</h4>
                        <p style="margin-left: 30px;">${article.content}</p>

                        <div style="position: relative;"><a href="javascript:;" onclick="praise(this)">
                            <div class="stage">
                                <div class="heart"></div>
                            </div>

                        </a><label id="praise" style="position: absolute;left:83%;">${article.praise}</label> <span style="position: absolute;left: 85%;">浏览量：${article.view}</span></div>




                        <div class="row" style="margin-left:20px;">
                            <div class="col-md-11">
                                <div class="form-group" style="margin-top: 100px;">
                                    <label>你的评论</label>
                                    <textarea id="newComment" class="form-control" rows="3"></textarea>
                                </div>
                                <a class="btn btn-info btn-sm" style="margin-bottom: 30px;position: relative;left: 95%" id="submit">评论</a>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        大家的评论
                                    </div>



                                    <div id="comment">
                                        <c:set var="listLength" value="${fn:length(commentList)}"></c:set>
                                        <c:if test="${listLength == 0}"><div style="text-align: center;" id="noComment">暂时还没有评论哦~</div></c:if>


                                        <c:forEach items="${commentList}" varStatus="status">
                                            <div class="panel-body" >
                                                <div class="panel-group" id="accordion">

                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <img src="${commentList[listLength-status.count].user.image}" class="round">
                                                                <span>${commentList[listLength-status.count].user.userName}</span>

                                                                <span style="margin-left: 20px;">
                                                                        ${commentList[listLength-status.count].time}
                                                                </span>

                                                                <input type="hidden" value="${commentList[listLength-status.count].id}" id="commentId">
                                                                <c:if test="${user.id == article.user.id}">
                                                                    <a title="删除" onClick="del(this)" href="javascript:;" style="margin-left: 700px;color: #31708f">删除</a>
                                                                </c:if>
                                                            </h4>

                                                        </div>

                                                        <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                                                            <div class="panel-body">
                                                                    ${commentList[listLength-status.count].content}
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>




                                </div>
                            </div>
                        </div>

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


<!-- Custom Js -->
<script src="../../../js/main/custom-scripts.js"></script>
<script src="../../../js/main/jquery-1.8.3.min.js"></script>


</body>


<script type="text/javascript">
    <%--添加评论--%>
    $(document).ready(function () {

        $("#submit").click(
                function () {
                    $.ajax({
                        type:"POST",
                        url:"${ctx}/article/addComment",
                        data:{content:$("#newComment").val(),userId:${user.id},articleId:${article.id}},
                        datatype:"json",
                        success:function (data) {
                            console.info(data);
                            $("#newComment").val("");

                            var jsonObj=eval("("+data+")");

                            var userName = jsonObj[jsonObj.length-1].user.userName;
                            var time = jsonObj[jsonObj.length-1].time;
                            var commentId = jsonObj[jsonObj.length-1].id;
                            var content = jsonObj[jsonObj.length-1].content;
                            var image = jsonObj[jsonObj.length-1].user.image;
                            var str='<div class="panel-body">'+
                                    '<div class="panel-group" id="accordion">'+

                                    '<div class="panel panel-default">'+
                                    '<div class="panel-heading">'+
                                    '<h4 class="panel-title">'+
                                    '<img src="'+image+'" class="round">'+
                                    '<span>'+userName+'</span>'+

                                    '<span style="margin-left: 20px;">'+
                                    time+
                                    '</span>'+

                                    '<input type="hidden" value="'+commentId+'" id="commentId">'+
                                    '<a title="删除" onClick="del(this)" href="javascript:;" style="margin-left: 712px;color: #31708f">删除</a>'+


                                    '</h4>'+
                                    '</div>'+
                                    '<div id="collapseTwo" class="panel-collapse in" style="height: auto;">'+
                                    '<div class="panel-body">'+
                                    content+
                                    '</div>'+
                                    '</div>'+
                                    '</div>'+
                                    '</div>'+
                                    '</div>';
                            $("#comment").prepend(str);
                            $("#noComment").css('display','none');

                        }
                    })
                }
        )

    })

</script>

<script src="../../../js/loginRegister/jquery.min.js"></script>
<script type="text/javascript">
    //点赞与取消赞
    function praise(obj){
        $.ajax({
            type:"POST",
            url:"${ctx}/article?state=praise",
            data:{articleId:${article.id}},
            datatype:"json",
            success:function (data) {
                console.info(data);
                $(obj).parents().children("#praise").html(data.counts);

            }
        })

    }

    $(function() {
        $(".heart").on("click", function() {
            $(this).toggleClass("is-active");
        });
    });



</script>



<script type="text/javascript">
    //    删除回复
    function del(obj){
        var res = confirm('确认要删除此回复吗？');
//        alert($(obj).parents(".panel-title").children("#commentId").val())
        if(res == true)
        {
            $.ajax({
                type:"POST",
                url:"${ctx}/article?state=deleteComment",
                data:{commentId:$(obj).parents(".panel-title").children("#commentId").val()},
                datatype:"json",
                success:function (data) {
                    console.info(data);
                    if(data.res=="true"){
                        $(obj).parents().parents().parents().parents().parents(".panel-body").remove();
                    }

                }
            })
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
