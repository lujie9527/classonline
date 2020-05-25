<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
    <style>
        body {
            background: url("${pageContext.request.contextPath }/image/bg.jpg");
            background-size: 100%;
        }
    </style>

    <title>管理员登录界面</title>

    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <meta content="mshtml 6.00.2600.0" name=generator>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>

<body>

<%--<form class="form-horizontal" role="form" id="loginForm" method="post" action="${pageContext.request.contextPath }/admin/login">--%>
<%--    <div class="form-group">--%>
<%--        <label class="col-sm-5 control-label">用户名</label>--%>
<%--        <br>--%>
<%--        ${error}--%>
<%--        <br>--%>
<%--        <div class="col-sm-3">--%>
<%--            <input id="name" type="email" class="form-control" placeholder="用户名">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label class="col-sm-5 control-label">密码</label>--%>
<%--        <div class="col-sm-3">--%>
<%--            <input id="pwd" type="password" class="form-control" placeholder="密码">--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!--    <div class="form-group">-->--%>
<%--    <!--        <div class="col-sm-offset-3 col-sm-10">-->--%>
<%--    <!--            <div class="checkbox">-->--%>
<%--    <!--                <label>-->--%>
<%--    <!--                    <input type="checkbox">记住密码-->--%>
<%--    <!--                </label>-->--%>
<%--    <!--            </div>-->--%>
<%--    <!--        </div>-->--%>
<%--    <!--    </div>-->--%>

<%--    <div class="form-group">--%>
<%--        <div class="col-sm-offset-5 col-sm-5">--%>
<%--            <a href="javascript:submitForm();" class="btn btn-default btn-lg" role="button">登录</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>

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
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">作业</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="${pageContext.request.contextPath }/job/all">下载试题</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath }/sub/student/onlinehw/">在线做题</a>
            </div>
        </li>
        <!-- Dropdown -->
        <li class="nav-item dropdown ">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 资源中心 </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="${pageContext.request.contextPath }/doc/all">资料下载</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath }/video/all">教学视频</a>
            </div>
        </li>

        <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/liuyan/all">留言答疑</a>
        </li>

<%--        <li class="nav-item ">--%>
<%--            <a class="nav-link" href="${pageContext.request.contextPath }/link/all">友情链接</a>--%>
<%--        </li>--%>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/gerenzhongxin/home" target="_blank">个人中心</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a>
        </li>
    </ul>

<%--    <c:if test="${user==null}">--%>
<%--        <ul class="navbar-nav ml-auto" style="margin-right:70px;">--%>
<%--            <button type="button" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath }/toLogin'">登录</button>--%>
<%--        </ul>--%>
<%--    </c:if>--%>
<%--    <c:if test="${user!=null}">--%>
<%--        <ul class="navbar-nav ml-auto" style="margin-right:70px;">--%>
<%--            <button type="button" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath}/qiantai/loginOut'" >退出</button>--%>
<%--        </ul>--%>
<%--    </c:if>--%>

</nav>

<div align="center">
    <table border="0" width="1140px" cellspacing="0" cellpadding="0" id="table1">
        <tr>
            <td width="740" height="412"></td>
            <td class="login_msg" width="400">
                <form id="loginForm" action="${pageContext.request.contextPath }/admin/login" method="post">
                    <span style="width:160px; height:26px"><h2>网络教学系统后台</h2></span>
                    <br/>
                    <h4 style="color: red">${error }</h4>
                    <br/>
                    用户名：<input id="name" type="text" name="name" class="msg"/><br/><br/>
                    密 &nbsp;&nbsp;码：<input id="pwd" type="password" name="password" class="msg"/><br/><br/>
<%--                    <a href="javascript:submitForm();" style="text-decoration: none;font-size: 20px">登录</a>--%>
                    <button type="button" class="btn btn-primary" style="width: 80px" onclick="submitForm()">登录</button>
                </form>
            </td>
        </tr>
    </table>

    <div class="foot" style="height: 60px;">
        <div class="wraper">
            <div class="copyright">
                <p>copyright © 2020 <a href="http://http://www.guit.edu.cn//" target="_blank">桂林电子科技大学信息科技学院</a></p>
            </div>
        </div>
    </div>
</div>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.8.3.js"></script>--%>
<%--<script type="javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.0.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>

<script type="text/javascript">
    function submitForm() {
        var username = $("#name").val();
        if (username == "") {
            $.messager.alert('提示', '用户名不能为空', 'warning');
            return;
        }
        var pwd = $("#pwd").val();
        if (pwd == "") {
            $.messager.alert('提示', '密码不能为空', 'warning');
            return;
        }
        $("#loginForm").submit();
    }
</script>
<%--<script type="text/javascript">--%>
<%--    if (self != top) {--%>
<%--        top.location = self.location;--%>
<%--    }--%>
<%--</script>--%>

<%--使别人不能把你的框架网页装到他自已的框架中--%>
</body>
</html>