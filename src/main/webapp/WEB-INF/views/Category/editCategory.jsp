<%--
  Created by IntelliJ IDEA.
  User: TestUser
  Date: 2019/6/16
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改类型</title>
</head>
<body>
<form action="${ctx}/Category/update" method="post">
    <table>
        <tr><td>文章类型</td></tr>
        <tr><td><input type="test" name="typename" value="${Category.typename}"></td></tr>
        <tr><input type="test" name="id" value="${Category.id}" hidden></tr>
        <tr><input type="test" name="parents_id" value="${Category.parents_id}" hidden></tr>
    </table>
    <button>提交</button>
</form>
</body>
</html>
