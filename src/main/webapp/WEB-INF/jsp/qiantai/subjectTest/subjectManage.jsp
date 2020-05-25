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
        #manageSubject table  td{
            font-size:12px;
        }
        -->
    </style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="layui-table">
    <tr>
        <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
        <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
            <tr>
                <td height="31"><div class="titlebt">管理试题</div></td>
            </tr>
        </table></td>
        <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="53%" valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td valign="middle"><span class="left_txt">
			<div id="manageSubject" align="center"><!--管理试题-->
			<table width="95%" cellspacing="10">
				  <tr align="center">
					<td>试题编号</td>
					<td>试题标题</td>
					<td>正确答案</td>
					<td>查看试题</td>
					<td>更新试题</td>
					<td>删除试题</td>
				  </tr>
				  <s:iterator value="#request.subjects" var="subject">
				  	 <tr align="center">
							<td>${subject.subjectId}</td>
							<td align="left">${subject.subjectTitle}</td>
							<td>${subject.subjectAnswer}</td>
							<td><a href="subjectParticular.action?subjectId=${subject.subjectId}">查看</a></td>
							<td><a href="subjectUpadateBefore.action?subjectId=${subject.subjectId}">更新</a></td>
							<td><a href="subjectDelete?subjectId=${subject.subjectId}">删除</a></td>
					  </tr>
                  </s:iterator>
				  <tr>
				  	<td colspan="6" align="center">
				  		共${pages.totalCount}条纪录，当前第${pages.currentPage}/${pages.totalPage}页，每页${pages.everyPage}条纪录
				  	<s:if test="#request.pages.hasPrePage">
                        <a href="subjectQuery.action?currentPage=1">首页</a> |
                        <a href="subjectQuery.action?currentPage=${pages.currentPage - 1}">上一页</a> |
                    </s:if>
               		<s:else>
                        首页 | 上一页 |
                    </s:else>
               		<s:if test="#request.pages.hasNextPage">
                        <a href="subjectQuery.action?currentPage=${pages.currentPage + 1}">下一页</a> |
                        <a href="subjectQuery.action?currentPage=${pages.totalPage}">尾页</a>
                    </s:if>
               		<s:else>
                        下一页 | 尾页
                    </s:else>
				  	</td>
				  </tr>
			</table>
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
