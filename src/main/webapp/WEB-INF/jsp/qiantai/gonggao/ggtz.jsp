<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>公告列表</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/easyui.css"/>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 20%;
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

<h2 style="text-align: center">系统通知公告</h2>
    <!--公告通知 -->
    <div class="container">
        <div class="row justify-content-end">
            <form action="${pageContext.request.contextPath }/notice/all">
                <div class="form-inline">
                    <label>查询到<span style="color:#f00">${pageInfo.total}</span>条记录</label>&nbsp;&nbsp;
                    <input type="text" class="form-control" id="usr" name="keyWord" value="${keyWord }"/>
                    <button type="submit" class="btn btn-info">查询</button>
                </div>
            </form>
        </div>
    </div>
    <br/>
    <div class="container">
        <c:forEach items="${pageInfo.list}" var="notice">
            <div class="row">
                <div class="col text-left">
                    <a href="${pageContext.request.contextPath }/notice/${notice.id}">${notice.title}</a>
                </div>
                <div class="col text-right" style="margin-right: 100px;">${notice.noticeTime}</div>
            </div>
        </c:forEach>
    </div>

    <br/>

    <div class="container">
        <ul class="pagination justify-content-end">
            <c:if test="${pageInfo.size>0 }">
                <li class="pages-item">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=1&keyWord=${keyWord}">首页</a>
                </li>
            </c:if>
            <c:if test="${pageInfo.hasPreviousPage }">
                <li class="pages-item">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pageNum-1}&keyWord=${keyWord}">&laquo;</a>
                </li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                <c:if test="${pageInfo.pageNum ==page_num }">
                    <li class="pages-item active">
                        <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${page_num }&keyWord=${keyWord}">${page_num }</a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.pageNum !=page_num }">
                    <li class="pages-item">
                        <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${page_num }&keyWord=${keyWord}">${page_num}</a>
                    </li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.hasNextPage }">
                <li class="pages-item">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pageNum+1}&keyWord=${keyWord}">&raquo;</a>
                </li>
            </c:if>

            <c:if test="${pageInfo.size>0}">
                <li class="pages-item">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pages }&keyWord=${keyWord}">末页</a>
                </li>
            </c:if>
        </ul>
    </div>
    <br>


</body>
</html>