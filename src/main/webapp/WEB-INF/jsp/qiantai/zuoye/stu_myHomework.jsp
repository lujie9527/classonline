<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/6/2
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的作业</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
    <style>
        table tbody tr td{
            vertical-align: middle;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

    <a class="navbar-brand " href="${pageContext.request.contextPath }">C++</a>

    <ul class="navbar-nav">

        <li class="nav-item active">
            <a class="nav-link " href="${pageContext.request.contextPath }">首页</a>
        </li>

        <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/notice/all">公告通知</a>
        </li>
        <!-- Dropdown -->
        <c:if test="${isStu==1}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">作业</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/all">提交作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/stuHomework">我的作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/sub/onlinehw">在线做题</a>
                </div>
            </li>
        </c:if>

        <c:if test="${isStu==2}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop3" data-toggle="dropdown">作业管理</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/teacher/show_fabu">发布作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/showJobList/">批改作业</a>
                </div>
            </li>
        </c:if>

        <c:if test="${isStu==2}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/sub/allSub">试题管理</a>
            </li>
        </c:if>

        <!-- Dropdown -->
        <c:if test="${isStu==1}">
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 资源中心 </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/doc/all">资料下载</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/video/all">教学视频</a>
                </div>
            </li>
        </c:if>

        <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/liuyan/all">留言答疑</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/gerenzhongxin/home" target="_blank">个人中心</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a>
        </li>

    </ul>

    <c:if test="${user==null}">
        <ul class="navbar-nav ml-auto" style="margin-right:70px;">
            <button type="button" class="btn btn-light"
                    onclick="window.location.href='${pageContext.request.contextPath }/toLogin'">登录
            </button>
        </ul>
    </c:if>
    <c:if test="${user!=null}">
        <ul class="navbar-nav ml-auto" style="margin-right:70px;">
            <button type="button" class="btn btn-light"
                    onclick="window.location.href='${pageContext.request.contextPath}/qiantai/loginOut'">退出
            </button>
        </ul>
    </c:if>
</nav>

<h2 style="text-align: center">我的作业</h2>
<table class="table table-bordered" align="center">
    <thead>
        <th>序号</th>
        <th>题目</th>
        <th>回答</th>
        <th>得分</th>
        <th>完成时间</th>
    </thead>

    <tbody>
    <c:forEach items="${stuJobList}" var="stuJob">
        <tr>
            <td>${stuJob.id}</td>
            <td style="width: 500px">${stuJob.job.jobDetail}</td>
            <td style="width: 500px">${stuJob.homework}</td>
            <td>${stuJob.jobGrade}</td>
            <td>${stuJob.finishTime}</td>
        </tr>
    </c:forEach>

    </tbody>

</table>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>
</html>
