<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<body>
<h2>首页</h2>

<ul>
    <%--<li><a href="${ctx}/login">用户登录</a></li>--%>
    <%--<li><a href="${ctx}/user">用户管理</a></li>--%>
    <li><a href="${ctx}/dict/list">字典管理</a></li>
</ul>
</body>
</html>
