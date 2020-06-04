<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>查询试题-模糊查询</title>

    <link rel="stylesheet" href="images/skin.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
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

        #showSubject table td {
            font-size: 12px;
        }

        -->
    </style>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td height="31">
                        <div class="titlebt">查询试题</div>
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
                    <td valign="middle">
                    <span class="left_txt">
                        <div align="center"><!--模糊查询试题-->
                            <form action="${pageContext.request.contextPath}/sub/findSub" method="post">
                                <table border="0" cellspacing="10" cellpadding="0">
                                    <tr>
                                        <td>试题题目:</td>
                                        <td>
                                            <input name="subjectTitle" size="50">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div align="center">
                                                <input type="submit" name="Submit" value="查询">
                                                <input type="reset" name="Submit2" value="重置">
                                                <a class="btn-default" href="${pageContext.request.contextPath}/sub/allSub">返回</a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </span>
                <tr>

                    <div class="container" align="center">
                        <c:forEach items="${findSubject}" var="findSubject">

                            <div class="col-md-6" align="left">${findSubject.subjectId} ${findSubject.subjectTitle}</div>

                            <div class="col-md-6" align="left">A.${findSubject.subjectOptionA}</div>

                            <div class="col-md-6" align="left">B.${findSubject.subjectOptionB}</div>

                            <div class="col-md-6" align="left">C.${findSubject.subjectOptionC}</div>

                            <div class="col-md-6" align="left">D.${findSubject.subjectOptionD}</div>

                           <div class="col-md-6" align="left"> 答案：${findSubject.subjectAnswer}</div>

                           <div class="col-md-6" align="left"> 解析：${findSubject.subjectParse}</div>
                            <a href="${pageContext.request.contextPath}/sub/subUpdate?subjectId=${findSubject.subjectId}">修改</a>
                            <a href="${pageContext.request.contextPath}/sub/subDelete?subjectId=${findSubject.subjectId}">删除</a>
                        </c:forEach>
                    </div>
                </tr>
                </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
