<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示试题答案</title>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/css2.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style type="text/css">
    <!--
    .style3 {
        font-size: 18px;
    }

    .style4 {
        font-size: 18px;
        font-weight: bold;
    }

    .STYLE5 {
        color: #FF0000
    }

    -->
</style>

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
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/all">下载试题</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/sub/onlinehw/">在线做题</a>
                </div>
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
        <c:if test="${user!=null}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a>
            </li>
        </c:if>
        <c:if test="${isStu==2}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/sub/allSub">管理试题</a>
            </li>
        </c:if>
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

<table class="table table-responsive" style="width: 1100px; margin: auto;">
    <tr>
        <td>
            <div align="center" class="style3">考试时间：120 分钟</div>
        </td>
        <td>
            <div align="center" class="style3">考生：${sessionScope.user.name}</div>
        </td>
        <td>
            <div align="center" class="style3">总分 ：100 分</div>
        </td>
    </tr>

    <tr>
        <td colspan="3" bgcolor="#999999" class="style4">选择题(每小题5分，共20个)</td>
    </tr>

    <c:forEach items="${subjectList}" var="subject" varStatus="sta">
        <tr>
            <td colspan="3">

                <strong>第<span>${sta.index + 1}</span>题&nbsp;${subject.subjectTitle}</strong>
            </td>
        </tr>
        <tr>
            <td colspan="3"><strong>A．</strong>${subject.subjectOptionA}</td>
        </tr>
        <tr>
            <td colspan="3"><strong>B．</strong>${subject.subjectOptionB}</td>
        </tr>
        <tr>
            <td colspan="3"><strong>C．</strong>${subject.subjectOptionC}</td>
        </tr>
        <tr>
            <td colspan="3"><strong>D．</strong>${subject.subjectOptionD}</td>
        </tr>
        <tr>
            <td height="32" colspan="3" bgcolor="#CCCCCC">
                <strong>【正确答案】：${subject.subjectAnswer}</strong><br/>
                <strong>【参考解析】：${subject.subjectParse}</strong>
        </tr>
    </c:forEach>
    <!--题目结束-->
</table>


</body>
</html>
