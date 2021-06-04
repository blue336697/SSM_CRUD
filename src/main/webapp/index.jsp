<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: zzzzzzzzzz
  Date: 2021/5/31
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--来到页面就要index.jsp发送请求到list.jsp--%>
<jsp:forward page="/emps"></jsp:forward>



<%--
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("ctp",request.getContextPath());
    %>
</head>
<body>
    <button class="btn btn-success">按钮</button>

</body>
</html>--%>
