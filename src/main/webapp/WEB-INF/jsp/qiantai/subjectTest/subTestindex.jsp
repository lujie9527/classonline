<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线考试</title>
    <%--    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css2.css">--%>
    <link rel="stylesheet" href="https://layui.hcwl520.com.cn/layui-v2.5.4/css/layui.css" media="all">
    <%--    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>--%>
    <script src="https://layui.hcwl520.com.cn/layui-v2.5.4/layui.js"></script>
    <style type="text/css">
        <!--
        .STYLE3 {
            font-size: 18px;
        }

        .STYLE4 {
            font-size: 18px;
            font-weight: bold;
        }

        .STYLE5 {
            color: #FF0000
        }

        -->
    </style>
</head>
<body onload="sT()">
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
<input id="pageContext" type="hidden" value="${pageContext.request.contextPath}"/>
<table width="1003" class="layui-table">
    <tr>
        <td width="741" valign="top" class="rightbian">
            <table width="1003" border="0" align="center" cellpadding="0" cellspacing="10">
                <tr>
                    <td>
                        <div align="center" class="STYLE3">考试时间：120 分钟</div>
                    </td>
                    <td>
                        <div align="center" class="STYLE3">考生：${sessionScope.user.name}</div>
                    </td>
                    <%--                     sessionScope.xx == session.getAttribute("xx");--%>
                    <td>
                        <div align="center" class="STYLE3">总分 ：100 分</div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div id="tTime"></div>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" bgcolor="#999999" class="STYLE4">选择题(每小题5分，共20题)</td>
                </tr>
                <!--题目开始-->
                <form action="" method="post" id="subForm" name="subForm">
                    <c:forEach items="${subjectList}" var="subject" varStatus="sta">
                        <tr>
                            <input type="hidden" name="subjectId"
                                   value="${pageContext.request.contextPath}/sub/getSubList/${subject.subjectId}"/>
                            <td colspan="3">
                                <strong>第<span class="STYLE5">${sta.index + 1}</span>题&nbsp;${subject.subjectTitle}
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"><label class="layui-form-label">A.</label>${subject.subjectOptionA}</td>
                        </tr>
                        <tr>
                            <td colspan="3"><label class="layui-form-label">B.</label>${subject.subjectOptionB}</td>
                        </tr>
                        <tr>
                            <td colspan="3"><label class="layui-form-label">C.</label>${subject.subjectOptionC}</td>
                        </tr>
                        <tr>
                            <td colspan="3"><label class="layui-form-label">D.</label>${subject.subjectOptionD}</td>
                        </tr>
                        <tr>
                            <td height="32" colspan="3" bgcolor="#CCCCCC">选择答案：
                                <input type="radio" name="subjectAnswer${sta.index}" value="A" checked="checked"/>A
                                <input type="radio" name="subjectAnswer${sta.index}" value="B"/>B
                                <input type="radio" name="subjectAnswer${sta.index}" value="C"/>C
                                <input type="radio" name="subjectAnswer${sta.index}" value="D"/>D
                            </td>
                        </tr>
                    </c:forEach>
                    <!--题目结束-->
                    <tr>
                        <td colspan="3">
                            <div align="center">
                                <button class="layui-btn" id="submitTest" name="submitTest">提交试卷</button>
                            </div>
                            <div name="rs" id="rs">
                                试试看吧显示吧
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
        </td>
    </tr>
</table>
<script>
    $("button[name='submitTest']").click(function () {
        var data = [];

        $("input[name^='subjectAnswer']").each(function () {
            if ($(this).prop("checked")) {
                data.push($(this).val());
            }

        });

        var json_data = JSON.stringify(data);

        console.log(json_data);

        $.ajax({
            type: "post",
            url: $("#pageContext").val() + "/sub/subresult",
            dataType: "json",
            data: json_data,
            contentType: "application/json",
            success: function (data) {
                console.log(data);
                // var subjectAnswer = new Array();
                // for (var i = 0;i<20;i++){
                //     subjectAnswer[i] = data[i];
                // }
                //  $("#rs").html(data);
            },
            error: function () {
                alert("提交失败");
            },end:function () {
                alert("查看成绩")
            }
        });

    })
</script>

<%--<script>--%>
<%--    function getSubAnswer(obj,subjectAnswers) {--%>
<%--        for(var i = 0;i<20;i++){--%>
<%--            if (obj.option[i].selected){--%>
<%--                subjectAnswers.push(obj.options[i].value);--%>
<%--            }--%>
<%--        }--%>
<%--        return subjectAnswers;--%>
<%--    }--%>
<%--</script>--%>

<script type="text/javascript">
    var ksTime; //定义考试时间以分钟计算
    ksTime = 120;//设置时间 这里设置为每1个单位代表是60秒
    if (readCookie("ss") == "") {
        setCookie("ss", new Date(), ksTime / 60);
    }

    function sT() {
        var tti = new Date();
        var lt = parseInt((tti - new Date(readCookie("ss"))) / 1000)  //转化成秒
        if ((ksTime * 60 - lt) < 0) {
            setCookie("ss", new Date(), 0);
            alert("考试时间到!\n即将提交试卷!");
            document.forms[0].submit();
        } else {
            lm = Math.floor(lt / 60);	//lm为分钟
            ls = lt % 60;	//ls为秒钟
            allY = ksTime * 60 - lt;	//allY为剩余时间，秒为单位
            ym = Math.floor(allY / 60);		//剩余时间的分钟
            ys = allY % 60;		//剩余时间的秒钟
            document.getElementById("tTime").innerHTML = "考试已经开始了" + lm + "分" + ls + "秒" + ",剩余" + ym + "分" + ys + "秒";
            var ttt = setTimeout("sT()", 1000);
        }
    }

    function readCookie(name) {
        var cookieValue = "";
        var search = name + "=";
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(search);
            if (offset != -1) {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1) {
                    end = document.cookie.length;
                }
                cookieValue = document.cookie.substring(offset, end)
            }
        }
        return cookieValue;
    }

    function setCookie(name, value, hours) {
        var expire = "";
        if (hours != null) {
            expire = new Date((new Date()).getTime() + hours * 3600000);
            expire = "; expires=" + expire.toGMTString();
        }
        document.cookie = name + "=" + value + expire;
    }
</script>


</body>
</html>
