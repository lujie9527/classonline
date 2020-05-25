<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>学生提交作业</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/new.css"/>
    <style>
        .secondImg {
            position: relative;
            width: 1130px;
            height: 154px;
            margin: auto;
            cursor: pointer;
            background: url(${pageContext.request.contextPath}/image/second.jpg) no-repeat;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //选择文件后自动上传
            $("#job").change(function () {
                var formData = new FormData();
                var file = $("#job")[0].files[0];
                formData.append("job", file);
                $.ajax({
                    url: '${pageContext.request.contextPath}/upload/job',
                    data: formData,
                    type: "POST",
                    contentType: false, //上传文件要设置成false
                    processData: false,
                    success: function (result) {
                        $("#url").val(result);
                        /*$("#coverImg").attr("src",obj); */
                    }
                });
            });

            //提交表单
            $("#ok").click(function () {
                var jobId = $("#jobId option:selected").val();
                if (jobId == -1) {
                    alert("请选择作业");
                    return;
                }
                var url = $("#url").val();
                if (url == "") {
                    alert("请上传作业");
                    return;
                }
                var formData = new FormData();
                formData.append("jobId", jobId);
                formData.append("url", url);
                $.ajax({
                    url: '${pageContext.request.contextPath}/job/stu/tijiao',
                    data: formData,
                    type: 'POST',
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        if (result == "200") {
                            alert("提交成功");
                            window.location.href = "${pageContext.request.contextPath}/job/all"
                        }
                    }
                })
            })
        });
    </script>
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
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">作业</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/all">下载试题</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/sub/onlinehw/">在线做题</a>
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

<%--            <li class="nav-item ">--%>
<%--                <a class="nav-link" href="${pageContext.request.contextPath }/link/all">友情链接</a>--%>
<%--            </li>--%>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/gerenzhongxin/home" target="_blank">个人中心</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a>
            </li>
        </ul>

        <c:if test="${user==null}">
            <ul class="navbar-nav ml-auto" style="margin-right:70px;">
                <button type="button" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath }/toLogin'">登录</button>
            </ul>
        </c:if>
    </nav>

    <div class="container">
        <div class="secondImg"></div>
    </div>

    <!-- 中间内容-->
    <div class="container">
        <div class="row">
            <!-- 学生-->
            <div class="col-md-2 text-center" style="margin-top:10px;">
                <ul class="nav nav-tabs flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath }/job/all"
                           style=" width:120px;">下载作业</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath }/job/stu/show_tijiao"
                           style=" width:120px;">提交作业</a>
                    </li>
                </ul>
            </div>

            <div class="col-md-2"></div>
            <div class="col-md-4">
                <div class="container">
                    <form>
                        <div class="form-group" style="margin:20px;">
                            <select name="jobId" class="form-control" id="jobId">
                                <option value="-1">---请选择要提交的作业---</option>
                                <c:forEach items="${jobs }" var="job">
                                    <option value="${job.id }">${job.name }</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="url" id="url"/>
                            <input name="job" type="file" class="form-control" id="job" style=" margin-top:20px;"/>
                            <input type="button" id="ok" class="btn" value="提交" style="margin-top:20px;"/>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
    <!-- 页脚-->
    <div class="footer" style="position:fixed; height:40px;width:100%;bottom:0px;">
        <div class="foot">
            <div class="copyright">
                <p>copyright © 2020 <a href="http://http://www.guit.edu.cn//" target="_blank">桂林电子科技大学信息科技学院</a></p>
            </div>
        </div>
    </div>
</body>
</html>
