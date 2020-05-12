<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<STYLE>
.cla1 {
FONT-SIZE: 12px; COLOR: #4b4b4b; LINE-HEIGHT: 18px; TEXT-DECORATION: none
}
.login_msg{
	font-family:serif;
}
.login_msg .msg{
	background-color: #acf;
}
.login_msg .btn{
	background-color: #9be;
	width: 73px;
	font-size: 18px;
	font-family: 微软雅黑;
}
</STYLE>

<TITLE></TITLE>
	<script type="text/javascript">
		if(self != top){
			top.location = self.location;
		}
	</script>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="${pageContext.request.contextPath }/css/adminLogin.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<LINK href="${pageContext.request.contextPath }/easyui/themes/icon.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css" type=text/css rel=stylesheet>
<style type="text/css">
	body{
  background:url("${pageContext.request.contextPath }/image/right1.jpg") no-repeat;
  background-size: 100%;
}
</style>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" >
<div ALIGN="center">
	<table border="0" width="1140px" cellspacing="0" cellpadding="0" id="table1">
		<tr>
			<td height="93"></td>
			<td></td>
		</tr>
		<tr>
			<td background="${pageContext.request.contextPath }/image/right11.jpg"  width="740" height="412"></td>
			<td class="login_msg" width="400">
			<form id="loginForm" action="${pageContext.request.contextPath }/admin/login" method="post">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width:160; height:26"><i><font size="+2">网络教学系统后台</font></i></span>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<font color="#ff0000">
						${error }
					</font> 
					<br/>
					用户名：<input  id="name" type="text" name="name" class="msg"/><br/><br/>
					密&nbsp;码：<input id="pwd" type="password" name="password" class="msg"/><br/><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:submitForm();" style="text-decoration: none;font-size: 20px">登录</a>
				</form>
			</td>
		</tr>
	</table>
	
	
</div>
<script type="text/javascript">
		function submitForm(){
			var username=$("#name").val();
			if(username ==""){
				$.messager.alert('提示','用户名不能为空','warning');
				return;
			}
			var pwd=$("#pwd").val();
			if(pwd ==""){
				$.messager.alert('提示','密码不能为空','warning');
				return;
			}
			$("#loginForm").submit();
		}
	</script>
</BODY></HTML>