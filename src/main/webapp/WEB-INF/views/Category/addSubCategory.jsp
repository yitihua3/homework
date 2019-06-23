<%--
  Created by IntelliJ IDEA.
  User: chenf
  Date: 2019/6/16
  Time: 19:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加子类</title>
</head>
<body>
<form action="${ctx}/Category/addSubCategory" method="post">
    <table>
        <tr><td>文章子类型</td><td>
            <input type="test" name="typename"></td></tr>
        <tr><input type="test" name="parents_id" value="${id}" hidden></tr>
    </table>
    <button>提交</button>
</form>

</body>
</html>
