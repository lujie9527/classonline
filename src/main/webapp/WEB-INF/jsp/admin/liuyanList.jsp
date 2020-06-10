<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言解惑管理</title>
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
	function doAdd(){
		//在添加之前把数据清空
		$("#name").val("");
		$("#gender").val("");
		$("#education").val("");
		$("#job").val("");
		$("#age").numberbox('setValue',null);
		$("#id").val('');
		//将添加窗口打开			
		$('#addStaffWindow').window("open");
	}
	
	//删除操作
	function doDelete(){
		//获取选中的行
		var array=$("#grid").datagrid('getSelections');
		if(array.length==0){
			//一行也没选
			$.messager.alert('警告','请选择你要删除的数据','warning');
			return;
		}
		$.messager.confirm('提示','你确定要删除吗?',function(r){
			if(r){
			       var ids=[];
			       $.each(array,function(index,item){
			       	ids.push(item.id);
			       });
			       //ajax提交数组参数，必须序列号
			       $.post("${pageContext.request.contextPath}/admin/liuyan/delete",{"ids":ids},function(data){
			       		if(data=="200"){
			       		location.href="${pageContext.request.contextPath}/admin/liuyan/list";
			       			
			       		}
			       });
			};
		});
	}
	//工具栏
	var toolbar = [ 
	/*  {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, */ {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}];
	// 定义列
	var columns = [ [ {
		field : 'f',
		checkbox : true,
	},{
		field : 'title',
		title : '标题',
		width : 250,
		align : 'center'
	}, {
		field : 'content',
		title : '留言内容',
		width : 400,
		align : 'center'
	}, {
		field : 'student.id',
		title : '留言者',
		width : 100,
		align : 'center',
		formatter:function(value,row){
			if(row["student"]){
				return row["student"]["name"];
			}
		}
	}, {
		field : 'liuyanTime',
		title : '留言时间',
		width : 150,
		align : 'center',
		
	}, {
		field : 'answer',
		title : '回答数',
		width : 50,
		align : 'center',
		
	}
	// ,{
	// 	field : 'state',
	// 	title : '留言状态',
	// 	width : 100,
	// 	align : 'center',
	// 	formatter:function(value,row){
	// 		if(row["state"]==0){
	// 			return "待解决";
	// 		}else{
	// 			return "已解决";
	// 		}
	// 	}
	// }
	] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 留言数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			/* pageList: [5,10,30], */
			//pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/admin/liuyan/list/json",
			idField : 'id',
			columns : columns
			/* onDblClickRow : doDblClickRow */
		});
		
		//添加窗口
		$('#addStaffWindow').window({
            title: '添加信息',
            width: 400,
            modal: true,
            shadow: true,
            closed: true,
            height: 350,
            resizable:false
        });
		
	});
	
	//修改 收货标准数据，双击修改，修改必须有id（隐藏)
	/* function doDblClickRow(rowIndex, rowData){
		//将添加窗口弹出
		$("#addStaffWindow").panel({
			title:"修改员工信息"
		});
		$("#addStaffWindow").window('open');
		
		//将数据回显,查看easyui的帮助文档
		$("#name").val(rowData.name);
		$("#gender").val(rowData.gender);
		$("#education").val(rowData.education);
		$("#job").val(rowData.job);
		$("#age").numberbox('setValue',rowData.age);  
		$("#id").val(rowData.id);
	} */
	
	//提交表单
	function commitstaffForm(){
		if($("#staffForm").form("validate")){ //执行easyui的验证方法
			//如果easyui的验证通过
			$("#staffForm").submit();
		}else{
			//验证失败
			$.messager.alert("警告","你输入的内容非法","warning");
		}
	}
		
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<form id="delBacth"  method="post">
	    <div region="center" border="false">
	    	<table id="grid">
	    		<input type="hidden" name="id" value="id">
	    	</table>
		</div>
	</form>
	<div class="easyui-window" title="添加新公告" id="addStaffWindow" collapsible="false" minimizable="false" maximizable="false" style="top:100px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:commitstaffForm();" class="easyui-linkbutton"  plain="true" >保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
		 <form id="staffForm" action="${pageContext.request.contextPath }/saveOrUpdateServlet" method="post">
			<table class="table-edit" width="80%" align="center">
					<tr class="title1">
						<td colspan="2">员工信息</td>
					</tr>
					<input type="hidden" id="id" name="id">
					<tr>
						<td>员工姓名</td>
						<td><input id="name" type="text" name="name" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input id="gender" type="text" name="gender" class="easyui-validatebox"  /></td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input id="age" type="text" name="age" class="easyui-numberbox" /></td>
					</tr>
					<tr>
						<td>学历</td>
						<td><input id="education" type="text" name="education" class="easyui-validatebox" /></td>
					</tr>
					<tr>
						<td>职务</td>
						<td><input id="job" type="text" name="job" class="easyui-validatebox" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>