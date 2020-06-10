<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

<%--    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>--%>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<%--    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 20%;
        }
    </style>
    <link rel="stylesheet" href="css/mycss.css"/>

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
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index" target="_blank">后台管理</a>
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

<!--轮播图 -->
<div id="demo" class="carousel slide" data-ride="carousel">
    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="image/lunbo01.jpg">
        </div>
        <div class="carousel-item">
            <img src="image/lunbo02.jpg">
        </div>
        <div class="carousel-item">
            <img src="image/lunbo03.jpg">
        </div>
    </div>
    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>

<!--公告通知-->
<div class="jumbotron text-center ">

    <h3>通知公告</h3>
    <hr align="center" width="5%" style="background-color:#06F">
</div>

<div class="blockModule module5" align="center">
    <div class="notifywrap">
        <div class="notify-ul">
            <ul>
                <c:forEach var="notice" items="${notices }" varStatus="vs">
                    <li class="notify-li${vs.count-1}">
                        <div class="notify-body">
                            <div class="notify-body-title">
                                <a href="${pageContext.request.contextPath }/notice/${notice.id}" class="infolist"
                                   title="${notice.title }"> <b>${notice.title }</b>
                                </a>
                            </div>
                            <div class="notify-text">${notice.content }</div>
                            <div class="notify-info">
                                <div class="date"></div>
                                <div class="time">${notice.noticeTime }</div>
                                <div class="see" style="margin-top: 10px;margin-left:70px; font-size:14px;color:#7f8082; width: 66px;">${notice.admin.name }</div>
<%--                                <div class="count">--%>
<%--                                        ${notice.admin.name }--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="notify-more">
        <a href="${pageContext.request.contextPath}/notice/all">查看更多</a>
    </div>

</div>


<div class="foot" style="height: 60px;">
    <div style="margin: 0px">
        <div class="copyright">
            <p>copyright © 2020 <a href="http://http://www.guit.edu.cn//" target="_blank">桂林电子科技大学信息科技学院</a></p>
        </div>
    </div>
</div>

</body>
</html>