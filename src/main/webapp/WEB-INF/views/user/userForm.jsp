<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户增加</title>
</head>
<body>
    <form action="/index/create" method="post">
        <p><input type="text" value="" placeholder="用户登录名"></p>
        <p> <input type="text" value="" placeholder="用户密码"></p>
        <p><input type="text" value="" placeholder="用户姓名"/></p>

        <p><button type="submit" name="">保存</button></p>
    </form>
</body>
</html>
