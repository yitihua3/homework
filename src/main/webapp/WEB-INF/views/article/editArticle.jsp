<%--
  Created by IntelliJ IDEA.
  User: wangh
  Date: 2019/6/23
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改文章</title>
</head>
<body>
<h1>修改文章</h1>
<hr>

<form action="${ctx}/article/update" method="post">
    <input type="text" style="width: 100%; height: 45px;margin-bottom: 10px;" name="title" placeholder="输入新闻标题" class="form-control">
    <textarea id="ueditor" name="content" style="width:100%;height: 500px;overflow: auto"></textarea>
    <input type="submit" name="submit"  class="btn btn-info btn-sm" value="修改">
</form>
</body>
</html>
