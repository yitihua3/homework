<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${ctx}/static/jquery-1.8.3.min.js"></script>
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
<button type="button" id="aa"><a href="${ctx}/Category/list">类型列表</a></button>
<table cellSpacing="1" cellPadding="0" width="80%" bgColor="#e0ffff" border="0">
    <tr><th>类型名称</th>
        <th>操作</th></tr>

    <c:forEach items="${subCategoryList}" var="subCategory">
        <tr align="center">
            <td>${subCategory.typename}</td>
            <td>
             <a href="${ctx}/Category/updateSubCategory/${subCategory.id}">编辑</a>
                |<a href="#" class="delete" dict="${subCategory.id}">删除</a></td>
        </tr>


    </c:forEach>
</table>
${msg}
<ul>
    <li> <a href="${ctx}/Category/subCategoryAdd/${parents_id}">添加子类</a></li>
</ul>
</body>
</html>
