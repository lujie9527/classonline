<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/30
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师发布作业</title>

    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>

    <style>
        label{
            line-height: 50px;
        }
        h2{
            text-align: center;
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

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form method="post" action="${pageContext.request.contextPath}/job/teacher/fabu">
                <br>
                <h2>发布作业</h2>
                <br>
                <div class="row">
                    <div class="col-md-9 col-md-offset-1">
                        <div class="form-inline">
                            <label class="col-md-2 control-label">所属专业：</label>
                            <select name="professionId" class="col-md-3 form-control" id="professionId">
                                <option value="-1">请选择专业</option>
                                <c:forEach items="${professions}" var="profession">
                                    <option value="${profession.id }">${profession.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-9">
                        <div class="form-inline">
                            <label class="col-md-2 control-label">所属班级：</label>
                            <select name="banjiId" class="col-md-3 form-control" id="banjiId">
                                <option>请选择班级</option>
                                <c:forEach items="${banjis}" var="banji">
                                <option value="${banji.id}">${banji.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-9">
                        <div class="form-inline">
                            <label class="col-md-2 control-label">提交截止：</label>
                            <input name="lastTime" type="datetime-local" class="col-md-3 form-control" id="date_info">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class=" col-md-9">
                        <div class="form-inline">
                            <label class="col-md-2 control-label">作业标题：</label>
                            <input name="jobTitle" type="text" class="col-md-7 form-control" id="jobTitle" placeholder="输入题目……">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-inline">
                            <label class="col-md-2 control-label">作业内容：</label><br>
                            <div id="editor" class="col-md-12" ></div>
                            <textarea id="jobDetail" name="jobDetail" hidden="hidden"></textarea>
                        </div>
                    </div>
                </div>
                <br>
                <button type="submit" id="ok" class="btn btn-info" style="width: 100px;margin-left: 50px">发布</button>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/wangEditor-3.1.1/wangEditor.min.js" charset="UTF-8"></script>
<link href="${pageContext.request.contextPath}/wangEditor-3.1.1/wangEditor.min.css">
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');

    var $jobDetail = $('#jobDetail');

    editor.customConfig.onchange = function(html){
        $jobDetail.val(html);
    };
    editor.customConfig.uploadImgServer='${pageContext.request.contextPath}/upload/tupian';

    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = 'myFileName';
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url =result.data;
            insertImg(url);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    };

    editor.create();

    $jobDetail.val(editor.txt.html());

</script>

<%--<script>--%>

<%--    $("#ok").click(function () {--%>
<%--        var jobTitle = $("#jobTitle").val().trim();--%>
<%--        if (jobTitle == "") {--%>
<%--            alert("作业标题不能为空");--%>
<%--            return;--%>
<%--        }--%>
<%--        var professionId = $("#professionId option:selected").val()--%>
<%--        if (professionId == "-1") {--%>
<%--            alert("请选择专业");--%>
<%--            return;--%>
<%--        }--%>
<%--        var banjiId = $("#banjiId option:selected").val();--%>
<%--        if (banjiId == "-1") {--%>
<%--            alert("请选择班级");--%>
<%--            return;--%>
<%--        }--%>
<%--        var lastTime = $("#date_info").val();--%>
<%--        if (lastTime == "") {--%>
<%--            alert("请选择作业提交的截止时间");--%>
<%--            return;--%>
<%--        }--%>
<%--        var jobDetail = $("#editor").text().replace(/^\s+|\s+$/g, "");--%>
<%--        if (jobDetail == "") {--%>
<%--            alert("请填写作业内容");--%>
<%--            return;--%>
<%--        }--%>

<%--    var formData = new FormData();--%>
<%--    formData.append("jobTitle", jobTitle);--%>
<%--    formData.append("jobDetail",jobDetail);--%>
<%--    formData.append("lastTime", lastTime);--%>
<%--    formData.append("banjiId", banjiId);--%>
<%--    formData.append("professionId", professionId);--%>

<%--    $.ajax({--%>
<%--        type: 'POST',--%>
<%--        url: '${pageContext.request.contextPath}/job/teacher/fabu',--%>
<%--        data: formData,--%>
<%--        dataType:"json",--%>
<%--        contentType: false,--%>
<%--        processData: false,--%>
<%--        success: function (result) {--%>
<%--            if (result == "200") {--%>
<%--                alert("发布成功");--%>
<%--                window.location.href = "${pageContext.request.contextPath}/job/showJobList"--%>
<%--            }--%>
<%--        },--%>
<%--        error:function () {--%>
<%--            alert("上传失败");--%>
<%--        }--%>
<%--    })--%>
<%--    });--%>
<%-- </script>--%>
</body>
</html>
