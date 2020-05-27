<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试题管理</title>
    <link rel="stylesheet" href="https://layui.hcwl520.com.cn/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="images/skin.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://layui.hcwl520.com.cn/layui-v2.5.4/layui.js"></script>

    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
        }

        #manageSubject table td {
            font-size: 12px;
        }

        -->
    </style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="layui-table">
    <tr>
        <td valign="top">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td height="31">
                        <div class="titlebt">管理试题</div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="middle">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="53%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td valign="middle">
                        <span class="left_txt">
			                <div id="manageSubject" align="center"><!--管理试题-->
                                <form action="${pageContext.request.contextPath}/sub/allSub">
                                    <table width="95%" cellspacing="10">
				                    <tr align="center">
					                    <td>试题编号</td>
					                    <td>试题标题</td>
					                    <td>正确答案</td>
					                    <td>查看试题</td>
					                    <td>更新试题</td>
					                    <td>删除试题</td>
				                    </tr>
                                    <c:forEach items="${manageSubList}" var="subject">
				  	                    <tr align="center">
							                <td>${subject.subjectId}</td>
							                <td align="left">${subject.subjectTitle}</td>
							                <td>${subject.subjectAnswer}</td>
							                <td>
                                                <a href="${pageContext.request.contextPath}/">查看</a>
                                            </td>
							                <td>
                                                <a href="${pageContext.request.contextPath}/">更新</a>
                                            </td>
							                <td>
                                                <a href="${pageContext.request.contextPath}/">删除</a>
                                            </td>
					                    </tr>
                                    </c:forEach>
                                    </table>
                                </form>
			                </div>
                        </span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
