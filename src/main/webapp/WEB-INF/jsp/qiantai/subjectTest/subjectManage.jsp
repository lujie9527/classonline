<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>试题管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>


    <style type="text/css">
        .demo {
            padding: 2em 0;
        }
        a:hover, a:focus {
            text-decoration: none;
            outline: none;
        }
        .tab .nav-tabs {
            border: none;
            border-bottom: 2px solid #079fc9;
            margin: 0;
        }
        .tab .nav-tabs li a {
            padding: 10px 20px;
            margin: 0 10px -1px 0;
            font-size: 17px;
            font-weight: 600;
            color: #293241;
            text-transform: uppercase;
            border: 2px solid #e6e5e1;
            border-bottom: none;
            border-radius: 5px 5px 0 0;
            z-index: 1;
            position: relative;
            transition: all 0.3s ease 0s;
        }
        .tab .nav-tabs li a:hover,  .tab .nav-tabs li.active a {
            background: #fff;
            color: #079fc9;
            border: 2px solid #079fc9;
            border-bottom-color: transparent;
        }
        .tab .nav-tabs li a:before {
            content: "";
            display: block;
            height: 2px;
            background: #fff;
            position: absolute;
            bottom: -2px;
            left: 0;
            right: 0;
            transform: scaleX(0);
            transition: all 0.3s ease-in-out 0s;
        }
        .tab .nav-tabs li.active a:before,  .tab .nav-tabs li a:hover:before {
            transform: scaleX(1);
        }
        .tab .tab-content {
            padding: 10px;
            font-size: 17px;
            color: #6f6f6f;
            line-height: 30px;
            letter-spacing: 1px;
            position: relative;
        }

        @media only screen and (max-width: 479px) {
            .tab .nav-tabs {
                border: none;
            }
            .tab .nav-tabs li {
                width: 100%;
                text-align: center;
                margin-bottom: 15px;
            }
            .tab .nav-tabs li a {
                margin: 0;
                border-bottom: 2px solid transparent;
            }
            .tab .nav-tabs li a:before {
                content: "";
                width: 100%;
                height: 2px;
                background: #079fc9;
                position: absolute;
                bottom: -2px;
                left: 0;
            }
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

<table class="table">
    <tr>

        <td align="right">
            <button type="button" class="btn btn-info"
                    onclick="window.location.href='${pageContext.request.contextPath}/sub/findSub'">查询试题</button>
            <button type="button" class="btn btn-info"
                    onclick="window.location.href='${pageContext.request.contextPath}/sub/boom'">新增试题</button>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

<table class="table table-striped table-hover" style="width: 1100px; margin: auto">

    <tr>

        <td>
            <form action="${pageContext.request.contextPath}/sub/allSub">
                <thead align="center">
                <tr>
                    <th>试题编号</th>
                    <th>试题标题</th>
                    <th>正确答案</th>
                    <th>查看试题</th>
                    <th>更新试题</th>
                    <th>删除试题</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${manageSubList}" var="subject">
                <tr align="center">
                    <td>${subject.subjectId}</td>
                    <td align="left" width="600px">${subject.subjectTitle}</td>
                    <td>${subject.subjectAnswer}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/sub/subShow?subjectId=${subject.subjectId}">查看</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/sub/subUpdate?subjectId=${subject.subjectId}">修改</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/sub/subDelete?subjectId=${subject.subjectId}">删除</a>
                    </td>
                </tr>
                </c:forEach>
            </form>
    </tbody>
    </td>
    </tr>
</table>
</body>
</html>
