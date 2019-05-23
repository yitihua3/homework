<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/5/17
  Time: 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
<c:forEach items="${userList}" var="user">
    <tr>
        <td>${user.userName}</td>
        <td>${user.sex}</td>
        <td></td>
    </tr>
</c:forEach>
</table>
</body>
</html>
