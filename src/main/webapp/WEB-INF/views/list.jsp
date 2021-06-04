<%--
  Created by IntelliJ IDEA.
  User: zzzzzzzzzz
  Date: 2021/6/3
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("road",request.getContextPath());
%>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<html>
<head>
    <title>员工列表</title>
</head>
<body>
<%--搭建显示页面，简单分别四行来显示--%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-ITEM</h1>
            </div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <%--显示表格信息--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#id</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>操作</th>
                    </tr>

                    <%--拿出pageInfo中的专门封装对象的list--%>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    新增
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--显示分页信息按钮--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                <h4>当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总共${pageInfo.total}记录</h4>
            </div>
            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${road}/emps?pn=1">首页</a></li>
                        <%--判断是否为第一页，是第一页就让前进按钮取消--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${road}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                            <%--添加高亮，和第一页禁用首页，最后一页禁用末页选项--%>
                            <c:if test="${num==pageInfo.pageNum}">
                                <li class="active"><a href="#">${num}</a></li>
                            </c:if>
                            <c:if test="${num!=pageInfo.pageNum}">
                                <li ><a href="${road}/emps?pn=${num}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${road}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${road}/emps?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
