<%--
  Created by IntelliJ IDEA.
  User: chenf
  Date: 2019/6/16
  Time: 19:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加大类</title>
</head>
<body>
<h1 class="page-header">
    添加文章类别 <small>Add article category</small>
</h1>
<form action="${ctx}/Category/add" method="post">
    <table>
        <tr><td>文章类型</td>
            <td><input type="test" name="typename"style="width: 100%; height: 45px;"  placeholder="输入类别名称" class="form-control"></td></tr>
        <tr><input type="test" name="parents_id" value="0" hidden></tr>
    </table>
    <button>提交</button>
</form>

</body>
</html>
