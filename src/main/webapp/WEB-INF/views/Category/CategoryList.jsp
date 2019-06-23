
<%--
  Created by IntelliJ IDEA.
  User: chenf
  Date: 2019/6/16
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>类型列表</title>
    <script src="${ctx}/static/jquery-1.8.3.min.js"></script>
    <%--<script src="${ctx}/js/"></script>--%>
    <script>
        $(document).ready(function () {
            $(".delete").bind("click",function () {
                if(confirm("确定要删除吗？")){
                    var id = $(this).attr("dict");
                    window.location.href = "${ctx}/Category/delete/"+id;
                }
            });
        });
    </script>
</head>


<body>
<button type="button" id="aa">类型列表</button>
<table cellSpacing="1" cellPadding="0" width="80%" bgColor="#e0ffff" border="0">
    <tr><th>类型名称</th>
        <th>查看子类</th>
        <th>操作</th></tr>

    <c:forEach items="${CategoryList}" var="Category">
        <tr align="center">
            <td>${Category.typename}</td>
            <td><a href="${ctx}/Category/todetail/${Category.id}">查看子类</a></td>
            <td><a href="${ctx}/Category/toupdate/${Category.id}">编辑</a>
                |<a href="#" class="delete" dict="${Category.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>
${msg}
<ul>
<li><a href="${ctx}/Category/toadd">添加</a></li>
</ul>
</body>
</html>
