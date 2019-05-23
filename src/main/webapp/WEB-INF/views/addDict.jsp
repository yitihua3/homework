<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/5/17
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加字典</title>
</head>
<body>
<form action="${ctx}/dict/add" method="post">
    <table>
        <tr><td>字典类型</td><td><input type="test" name="type"></td></tr>
        <tr><td>属性编码</td><td><input type="test" name="code"></td></tr>
        <tr><td>属性名称</td><td><input type="test" name="name"></td></tr>
    </table>
    <button>提交</button>
</form>

</body>
</html>
