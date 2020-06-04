<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示试题详情</title>

    <link rel="stylesheet" href="images/skin.css">

    <style type="text/css">

        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
        }
        #showSubject table  td{
            font-size:12px;
        }

    </style>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td>
                        <h2 style="text-align: center">查看试题</h2>
                    </td>
                </tr>
            </table>
        </td>

    </tr>
    <tr>
        <td valign="top" bgcolor="#F7F8F9">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="53%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td valign="middle"><span class="left_txt">
                        <div align="center"><!--显示试题-->
                            <table border="0" cellspacing="10" cellpadding="0">
                                <tr>
                                    <td>试题编号:</td>
                                    <td>${subjectOne.subjectId}</td>
                                </tr>
                                <tr>
                                    <td>试题题目:</td>
                                    <td>${subjectOne.subjectTitle}</td>
                                </tr>
                                <tr>
                                    <td>选项A:</td>
                                    <td>${subjectOne.subjectOptionA}</td>
                                </tr>
                                <tr>
                                    <td>选项B:</td>
                                    <td>${subjectOne.subjectOptionB}</td>
                                </tr>
                                <tr>
                                    <td>选项C:</td>
                                    <td>${subjectOne.subjectOptionC}</td>
                                </tr>
                                <tr>
                                    <td>选项D:</td>
                                    <td>${subjectOne.subjectOptionD}</td>
                                </tr>
                                <tr>
                                    <td>答案:</td>
                                    <td>${subjectOne.subjectAnswer}</td>
                                </tr>
                                <tr>
                                    <td valign="top">答案解析:</td>
                                    <td valign="top">${subjectOne.subjectParse}</td>
                                </tr>
                            </table>
                        </div>
                    </span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <button type="button" class="btn btn-primary"
                                onclick="window.location.href='${pageContext.request.contextPath}/sub/allSub'">返回</button>
                    </td>
                </tr>
            </table>
        </td>
        <td background="images/mail_rightbg.gif">&nbsp;</td>
    </tr>
</table>

</body>
</html>
