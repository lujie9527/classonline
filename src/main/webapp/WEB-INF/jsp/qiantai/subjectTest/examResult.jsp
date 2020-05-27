<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>考试成绩</title>
</head>
<meta name="referrer" content="no-referrer-when-downgrade">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="images/css2.css">
<link rel="stylesheet" href="https://layui.hcwl520.com.cn/layui-v2.5.4/css/layui.css" media="all">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

<body>

<%--<table width="1003" height="485" class="layui-table" id="examResults">--%>
<%--    <tr>--%>
<%--        <td width="149" height="485">&nbsp;</td>--%>
<%--        <td width="741" valign="top" class="rightbian">--%>
<%--            <table width="60%" align="center" cellpadding="10" cellspacing="0" border="1" class="layui-table">--%>
<%--                <tr>--%>
<%--                    <td height="35" colspan="2"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td height="49" colspan="2">--%>
<%--                        <div align="center"><span class="STYLE4"><strong>学生</strong>考试情况表</span></div>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td colspan="2">&nbsp;</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        <div align="center">考试姓名:${sessionScope.user.name}</div>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <div align="center">考生得分:${sessionScope.user.grade}分</div>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td colspan="2">--%>
<%--                        <div align="center">--%>
<%--                            <a href="showSubjectAnswer.action">查看答案</a>--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </td>--%>
<%--        <td width="113">&nbsp;</td>--%>
<%--    </tr>--%>
<%--</table>--%>
<div id="rs">考生得分:${stuGrade}分</div>
</body>
</html>
