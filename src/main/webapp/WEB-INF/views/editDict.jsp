<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/5/17
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改字典</title>
</head>
<body>
<form action="${ctx}/dict/update" method="post">
    <table>
        <input type="hidden" name="id" value="${dict.id}">
        <tr><td>字典类型</td><td><input type="test" name="type" value="${dict.type}"></td></tr>
        <tr><td>属性编码</td><td><input type="test" name="code" value="${dict.code}"></td></tr>
        <tr><td>属性名称</td><td><input type="test" name="name" value="${dict.name}"></td></tr>

    </table>
    <button>提交修改</button>
</form>

</body>
</html>
