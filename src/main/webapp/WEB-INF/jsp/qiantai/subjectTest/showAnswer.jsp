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
<table width="1003" height="485" border="0" cellpadding="0" cellspacing="0" class="centerbg">
    <tr>
        <td width="149" height="485">&nbsp;</td>
        <td width="741" valign="top" class="rightbian">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="10">
                <tr>
                    <td>
                        <div align="center" class="STYLE3">考试时间：120 分钟</div>
                    </td>
                    <td>
                        <div align="center" class="STYLE3">考生：${sessionScope.student.studentName}</div>
                    </td>
                    <td>
                        <div align="center" class="STYLE3">总分 ：100 分</div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" bgcolor="#999999" class="STYLE4">选择题(每小题5分，共20个)</td>
                </tr>
                <!--题目开始-->
<%--                <c:forEach value="#request.subjects" var="subject" status="sta">--%>
                <c:forEach items="" var="">
                    <tr>
                        <td colspan="3">
                            <strong>第<span>class="STYLE5">${sta.index + 1}</span>题&nbsp;${subject.subjectTitle}</strong>
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
        </td>
        <td width="113">&nbsp;</td>
    </tr>
</table>

</body>
</html>
