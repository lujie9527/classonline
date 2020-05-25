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
        #updateSubjectForm table  td{
            font-size:12px;
        }
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
                    <td height="31"><div class="titlebt">更新试题</div></td>
                </tr>
            </table></td>
        <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="53%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td valign="middle"><span class="left_txt">
			<div id="updateSubjectForm" align="center">
				<form action="subjectUpadate.action" method="post"><!--更新试题表单-->
				<table border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td colspan="2"><s:actionmessage/></td>
					</tr>
				  <tr>
					<td>试题题目:</td>
					<td>
						<input name="subjectId" type="hidden" value="${subject.subjectId}">
						<input name="subjectTitle" type="text" size="80"  value="${subject.subjectTitle}">
					</td>
				  </tr>
				  <tr>
					<td>选项A:</td>
					<td><input type="text" name="subjectOptionA" size="80" value="${subject.subjectOptionA}"></td>
				  </tr>
				   <tr>
					<td>选项B:</td>
					<td><input type="text" name="subjectOptionB" size="80" value="${subject.subjectOptionB}"></td>
				  </tr>
				   <tr>
					<td>选项C:</td>
					<td><input type="text" name="subjectOptionC" size="80" value="${subject.subjectOptionC}"></td>
				  </tr>
				   <tr>
					<td>选项D:</td>
					<td><input type="text" name="subjectOptionD" size="80" value="${subject.subjectOptionD}"></td>
				  </tr>
				   <tr>
					<td>答案:</td>
					<td>
						<input name="subjectAnswer" type="radio" value="A"
                        ${subject.subjectAnswer == "A" ? "checked" : ""}>A
						<input name="subjectAnswer" type="radio" value="B"
                        ${subject.subjectAnswer == "B" ? "checked" : ""}>B
						<input name="subjectAnswer" type="radio" value="C"
                        ${subject.subjectAnswer == "C" ? "checked" : ""}>C
						<input name="subjectAnswer" type="radio" value="D"
                        ${subject.subjectAnswer == "D" ? "checked" : ""}>D
					</td>
				  </tr>
				  <tr>
					<td valign="top">答案解析:</td>
					<td>
						<textarea name="answerParse" cols="76" rows="10" value="${subject.subjectParse}"></textarea>
					</td>
				  </tr>
				  <tr>
				  	<td colspan="2"><div align="center">
				  	  <input type="submit" value="录入">
				  	  <input type="reset" value="重置">
			  	  </div>
				</td>
				  </tr>
			</table>
			</form>
			</div>
                    </td>
                </tr>

            </table></td>
        <td background="images/mail_rightbg.gif">&nbsp;</td>
    </tr>
    <tr>
        <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
        <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
    </tr>
</table>
</body>
</html>
