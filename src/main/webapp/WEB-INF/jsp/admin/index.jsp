<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络教学系统后台管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.8.3.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	// 初始化ztree菜单
	$(function() {
		var setting = {
			data : {
				key : {
					title : "t" // 鼠标在停留在菜单上提示
				},
				simpleData : { // 简单数据 
					enable : true
				}
			},
			callback : {
				onClick : onClick
			}
		};
		
		// 基本功能菜单加载
		/* $.ajax({
			url : '${pageContext.request.contextPath}/easyui/json/menu.json',
			type : 'POST',
			dataType : 'text',
			success : function(data) {
				var zNodes = eval("(" + data + ")");
				$.fn.zTree.init($("#treeMenu"), setting, zNodes);
			},
			error : function(msg) {
				alert('菜单加载异常!');
			}
		}); */
		zNodes = [
			{"id":"11","pId":"0","name":"学生信息管理","page":"${pageContext.request.contextPath}/admin/student/list"},
			{ "id":"12","pId":"0","name":"老师信息管理", "page":"${pageContext.request.contextPath}/admin/teacher/list"},
			{ "id":"13","pId":"0","name":"专业信息管理", "page":"${pageContext.request.contextPath}/admin/profession/list"},
			{ "id":"14","pId":"0","name":"班级信息管理", "page":"${pageContext.request.contextPath}/admin/banji/list"},
			{ "id":"15","pId":"0","name":"教学视频管理", "page":"${pageContext.request.contextPath}/admin/video/list"},
			{ "id":"16","pId":"0","name":"公告管理", "page":"${pageContext.request.contextPath}/admin/notice/list"},
			{ "id":"17","pId":"0","name":"友情链接管理", "page":"${pageContext.request.contextPath}/admin/link/list"},
			{ "id":"18","pId":"0","name":"留言解惑管理", "page":"${pageContext.request.contextPath}/admin/liuyan/list"},
			{ "id":"19","pId":"0","name":"资料管理", "page":"${pageContext.request.contextPath}/admin/doc/list"},
			{ "id":"20","pId":"0","name":"作业管理", "page":"${pageContext.request.contextPath}/admin/job/list"}
		
		
	];
		
	$.fn.zTree.init($("#treeMenu"), setting, zNodes);
		
		$("#btnCancel").click(function(){
			$('#editPwdWindow').window('close');
		});
		
		$("#btnEp").click(function(){
			//获取用户输入的密码 、确认密码
			var pwd=$("#txtNewPass").val();
			var rePwd=$("#txtRePass").val();
			if($.trim(pwd)==""){
				$.messager.alert('警告','密码不能为空或空字符串','warning');
				return;
			}
			if($.trim(pwd)!=$.trim(rePwd)){
				$.messager.alert('警告','两次密码不一致','warning');
				return;
			}
			//通过ajax将新密码发送到服务器
			$.post("${pageContext.request.contextPath}/admin/editpassword",{password:rePwd},function(data){
				//返回json数据
				if(data=="200"){
					alert("密码修改成功");
					//跳到登录页面
					window.location.href="${pageContext.request.contextPath}/admin/login";
				}else{
					$.messager.alert('提示','密码修改失败','info');
				}
				//将密码框关闭
				$("#editPwdWindow").window('close');
			});
		});
	});

	function onClick(event, treeId, treeNode, clickFlag) {
		if (treeNode.click != false) {
			open(treeNode.name, treeNode.page);
		}
	}

	// 开启一个新的tab页面
	function open(text, url) {
		if ($("#tabs").tabs('exists', text)) {
			$('#tabs').tabs('select', text);
		} else {
			var content = '<div style="width:100%;height:100%;overflow:hidden;">'
					+ '<iframe src="'
					+ url
					+ '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';

			$('#tabs').tabs('add', {
				title : text,
				content : content,
				//href : url
				closable : true
			});
		}
	}

	/*******顶部特效 *******/
	/**
	 * 更换EasyUI主题的方法
	 * @param themeName
	 * 主题名称
	 */
	changeTheme = function(themeName) {
		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/'
				+ themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);
		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			}
		}
	};
	// 退出登录
	function logoutFun() {
		$.messager.confirm("确认窗口","你确定要退出系统吗?",function(r){
			if(r){
				location.href="${pageContext.request.contextPath}/admin/loginOut";
			}
		});
	}
	// 修改密码
	function editPassword() {
		$('#editPwdWindow').window('open');
	}
	
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height:90px;padding:10px;background:url('${pageContext.request.contextPath }/easyui/images/header_bg.jpg') no-repeat right;">
		<div>
			<img src="${pageContext.request.contextPath }/easyui/images/gy.png" style="width: 150px;height: 80px"
				border="0">
		</div>
	
		<div style="position: absolute; right: 5px; bottom: 10px; ">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
		</div>
		
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div onclick="editPassword();">修改密码</div>
			<div class="menu-sep"></div>
			<div onclick="logoutFun();">退出系统</div>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'菜单导航'"
		style="width:200px">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="基本功能" data-options="iconCls:'icon-mini-add'" style="overflow:auto">
				<ul id="treeMenu" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tabs" fit="true" class="easyui-tabs" border="false">
			<div title="消息中心" id="subWarp"
				style="width:100%;height:100%;overflow:hidden">
				<iframe src="${pageContext.request.contextPath }/admin/tip"
					style="width:100%;height:100%;border:0;"></iframe>
				<%--				这里显示公告栏、预警信息和代办事宜--%>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false"
		style="height:50px;padding:10px;background:url('${pageContext.request.contextPath}/easyui/images/header_bg.png') no-repeat right;">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;">
							网络教学系统 &nbsp;- &nbsp;后台管理 | Powered by <a href="http://blog.csdn.net/com_it">网站</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!--修改密码窗口-->
    <div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 160px; padding: 5px;
        background: #fafafa">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
</body>
</html>