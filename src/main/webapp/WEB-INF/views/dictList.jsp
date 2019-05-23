
<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/5/17
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>字典列表</title>
    <script src="${ctx}/static/jquery-1.8.3.min.js"></script>
    <%--<script src="${ctx}/js/"></script>--%>
    <script>
        $(document).ready(function () {

            $(".delete").bind("click",function () {
                if(confirm("确定要删除吗？")){
                    var id = $(this).attr("dict");
                    window.location.href = "${ctx}/dict/delete/"+id;
                }
            });
        });
    </script>
</head>


<body>
<button type="button" id="aa">ssss</button>
<table cellSpacing="1" cellPadding="0" width="80%" bgColor="#e0ffff" border="0">
    <tr><th>字典类型</th><th>属性编码</th><th>属性名称</th><th>属性状态</th><th></th></tr>

    <c:forEach items="${dictList}" var="dict">
        <tr align="center">
            <td>${dict.type}</td>
            <td>${dict.code}</td>
            <td>${dict.name}</td>
            <td>${dict.status.value}</td>
            <td><a href="${ctx}/dict/update/${dict.id}">编辑</a>|<a href="#" class="delete" dict="${dict.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>
${msg}
<ul>
<li><a href="${ctx}/dict/add">添加</a></li>
</ul>
</body>
</html>
