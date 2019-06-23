<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/23
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <script src="${ctx}/static/jquery-1.8.3.min.js"></script>
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

    <title>我的文章列表</title>
</head>

<body>
<table cellSpacing="1" cellPadding="0" width="80%" bgColor="#e0ffff" border="0">
    <tr><th>文章标题</th><th>发布时间</th><th>栏目</th><th>浏览量</th><th>点赞量</th><th></th></tr>

    <c:forEach items="${articleList}" var="article">
        <tr align="center">
            <td>${article.title}</td>
            <td>${article.createTime}</td>
            <td>${article.category.typename}</td>
            <td>${article.view}</td>
            <td>${article.praise}</td>
            <td><a href="${ctx}/article/update/${article.id}">编辑</a>|<a href="#" class="delete" articleId="${article.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>

<ul>
    <li><a href="${ctx}/article/add">添加文章</a></li>
</ul>


</body>
</html>
