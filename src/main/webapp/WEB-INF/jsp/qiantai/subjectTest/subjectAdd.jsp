<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加试题</title>

	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
        }


        -->
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

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
			<tr>
				<td height="31">
					<h2 style="text-align: center">录入试题</h2>
				</td>
			</tr>
		</table>
    </tr>
    <tr>
        <td valign="top" bgcolor="#F7F8F9">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle">
					<span class="left_txt">
					<div align="center">
						<form action="${pageContext.request.contextPath}/sub/addSub" method="post">
							<table border="0" cellspacing="10" cellpadding="0">
								<tr>
									<td valign="top">试题题目:</td>
<%--									valign 垂直对齐--%>
									<td>
										<input name="subjectTitle" type="text" size="50">
									</td>
								</tr>
								<tr>
									<td>选项A:</td>
									<td>
										<input type="text" name="subjectOptionA" size="20">
									</td>
								</tr>
								<tr>
									<td>选项B:</td>
									<td>
										<input type="text" name="subjectOptionB" size="20">
									</td>
								</tr>
								<tr>
									<td>选项C:</td>
									<td>
										<input type="text" name="subjectOptionC" size="20">
									</td>
								</tr>
								<tr>
									<td>选项D:</td>
									<td>
										<input type="text" name="subjectOptionD" size="20">
									</td>
								</tr>
								<tr>
									<td>答案:</td>
									<td>
										<input name="subjectAnswer" type="radio" value="A" checked>A
										<input name="subjectAnswer" type="radio" value="B">B
										<input name="subjectAnswer" type="radio" value="C">C
										<input name="subjectAnswer" type="radio" value="D">D
									</td>
								</tr>
								<tr>
									<td valign="top">试题解析:</td>
									<td>
										<textarea name="subjectParse" cols="76" rows="10"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div align="center">
											<br>
											<input class="btn btn-info" type="submit" value="录入">
											<input class="btn btn-default" type="reset" value="重置">
											<button class="btn btn-default"
													onclick="window.location.href='${pageContext.request.contextPath}/sub/allSub'">返回</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</span>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
