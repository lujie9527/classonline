<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/14
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试题更新</title>

    <link rel="stylesheet" href="images/skin.css">

    <style type="text/css">
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
        }

        #updateSubjectForm table td {
            font-size: 12px;
        }
    </style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td height="31">
                        <div class="titlebt">更新试题</div>
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
							<div id="updateSubjectForm" align="center">
								<form action="${pageContext.request.contextPath}/sub/subUpdate2" method="post"><!--更新试题表单-->
									<table border="0" cellspacing="10" cellpadding="0">
<%--										<tr>--%>
<%--											<td colspan="2">--%>
<%--												<s:actionmessage/>--%>
<%--											</td>--%>
<%--										</tr>--%>
										<tr>
											<td>试题编号：</td>
											<td>
												<input name="subjectId" type="text" size="80" value="${subjectUp.subjectId}">
											</td>

										</tr>
										<tr>
											<td>试题题目:</td>
											<td>
												<input name="subjectTitle" type="text" size="80" value="${subjectUp.subjectTitle}">
											</td>
										</tr>
										<tr>
											<td>选项A:</td>
											<td>
												<input type="text" name="subjectOptionA" size="80" value="${subjectUp.subjectOptionA}">
											</td>
										</tr>
										<tr>
											<td>选项B:</td>
											<td>
												<input type="text" name="subjectOptionB" size="80" value="${subjectUp.subjectOptionB}">
											</td>
										</tr>
										<tr>
											<td>选项C:</td>
											<td>
												<input type="text" name="subjectOptionC" size="80" value="${subjectUp.subjectOptionC}">
											</td>
										</tr>
										<tr>
											<td>选项D:</td>
											<td>
												<input type="text" name="subjectOptionD" size="80" value="${subjectUp.subjectOptionD}">
											</td>
										</tr>
										<tr>
											<td>答案:</td>
											<td>
												<input name="subjectAnswer" type="radio" value="A"${subjectUp.subjectAnswer == "A" ? "checked" : ""}>A
												<input name="subjectAnswer" type="radio" value="B"${subjectUp.subjectAnswer == "B" ? "checked" : ""}>B
												<input name="subjectAnswer" type="radio" value="C"${subjectUp.subjectAnswer == "C" ? "checked" : ""}>C
												<input name="subjectAnswer" type="radio" value="D"${subjectUp.subjectAnswer == "D" ? "checked" : ""}>D
											</td>
										</tr>
										<tr>
											<td valign="top">答案解析:</td>
											<td>
												<textarea name="subjectParse" cols="76" rows="10" value="${subjectUp.subjectParse}"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div align="center">
												<input type="submit" value="录入">
												<input type="reset" value="重置">
												<a type="button" class="btn-default" href="${pageContext.request.contextPath}/sub/allSub">返回</a>
											</div>
											</td>
										</tr>
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
