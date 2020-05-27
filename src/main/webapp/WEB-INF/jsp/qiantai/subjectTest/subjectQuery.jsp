
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
        #showSubject table  td{
            font-size:12px;
        }
        -->
    </style>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="17" valign="top" background="images/mail_leftbg.gif">
            <img src="images/left-top-right.gif" width="17" height="29" />
        </td>
        <td valign="top" background="images/content-bg.gif">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td height="31">
                        <div class="titlebt">查看试题</div>
                    </td>
                </tr>
            </table>
        </td>
        <td width="16" valign="top" background="images/mail_rightbg.gif">
            <img src="images/nav-right-bg.gif" width="16" height="29" />
        </td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                                            <input name="subjectTitle" size="50" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div align="center">
                                                <input type="submit" name="Submit" value="查询">
                                                <input type="reset" name="Submit2" value="重置">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </span>

                    <div class="container" style="width: 800px">
                        <c:forEach items="${findSubject}" var="findSubject">
                            <div class="col-md-6">${findSubject.subjectId} ${findSubject.subjectTitle}</div>
                            <div class="col-md-6">${findSubject.subjectOptionA}</div>
                            <div class="col-md-6">${findSubject.subjectOptionB}</div>
                            <div class="col-md-6">${findSubject.subjectOptionC}</div>
                            <div class="col-md-6">${findSubject.subjectOptionD}</div>
                            <div class="col-md-6">${findSubject.subjectAnswer}</div>
                            <div class="col-md-6">${findSubject.subjectParse}</div>
                        </c:forEach>
                    </div>
                </td>
            </tr>
        </table>
        </td>
    </tr>
</table>

</body>
</html>
