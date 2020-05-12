<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告信息管理</title>
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
		 $('#noticeForm').form( 'clear');
		/* $("#name").val("");
		$("#gender").val("");
		$("#education").val("");
		$("#job").val("");
		$("#age").numberbox('setValue',null);  
		$("#id").val(''); */
		$("#bianhao").hide();
		//将添加窗口打开			
		$('#addNoticeWindow').window("open");
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
			       $.post("${pageContext.request.contextPath}/admin/notice/delete",{"ids":ids},function(data){
			       		if(data=="200"){
			       			location.href="${pageContext.request.contextPath}/admin/notice/list";
			       		}
			       });
			};
		});
	}
	//工具栏
	var toolbar = [ 
	 {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}];
	// 定义列
	var columns = [ [ {
		field : 'f',
		checkbox : true,
	}, {
		field : 'title',
		title : '标题',
		width : 300,
		align : 'center'
	},{
		field : 'content',
		title : '内容',
		width : 650,
		align : 'left'
		
	}, {
		field : 'noticeTime',
		title : '发布时间',
		width : 120,
		align : 'center'
	}, {
		field : 'admin.id',
		title : '发布者',
		width : 100,
		align : 'center',
		formatter:function(value,row){
			if(row["admin"]){
				return row["admin"]["name"];
			}
		}
	}
	 ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 员工数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			/* pageList: [5,10,30], */
			//pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/admin/notice/list/json",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加员工窗口
		$('#addNoticeWindow').window({
            title: '添加员工信息',
            width: 450,
            modal: true,
            shadow: true,
            closed: true,
            height: 400,
            resizable:false
        });
		
	});
	
	//修改 收货标准数据，双击修改，修改必须有id（隐藏)
	function doDblClickRow(rowIndex, rowData){
		//将添加窗口弹出
		$("#addNoticeWindow").panel({
			title:"修改员工信息"
		});
		$("#addNoticeWindow").window('open');
		
		$("#isUpdate").val("1");
		//将数据回显,查看easyui的帮助文档
		$("#title").val(rowData.title);
		$("#content").val(rowData.content);
		$("#id").val(rowData.id);
		$("#bianhao").show();
		$("#id").attr("readonly","readonly");
	}
	
	//提交表单
	function commitnoticeForm(){
		if($("#noticeForm").form("validate")){ //执行easyui的验证方法
			//如果easyui的验证通过
			$("#noticeForm").submit();
		}else{
			//验证失败
			$.messager.alert("警告","你输入的内容非法","warning");
		}
	}
		
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<form id="delBacth"  method="post"><!-- -action="${pageContext.request.contextPath }/delStaffServlet" -->
	    <div region="center" border="false">
	    	<table id="grid">
	    		<input type="hidden" name="id" value="id">
	    	</table>
		</div>
	</form>
	<div class="easyui-window" title="添加新公告" id="addNoticeWindow" collapsible="false" minimizable="false" maximizable="false" style="top:30px;left:300px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:commitnoticeForm();" class="easyui-linkbutton"  plain="true" >保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
		 <form id="noticeForm" action="${pageContext.request.contextPath }/admin/notice/addOrUpdate" method="post">
		 	<input type="hidden" name="isUpdate" name="isUpdate"> 
			<table class="table-edit" width="80%" align="center">
					<tr class="title1">
						<td colspan="2">员工信息</td>
					</tr>
					<tr id="bianhao">
						<td>编号</td>
						<td><input id="id" type="text" name="id" class="easyui-validatebox"  /></td>
					</tr>
					<tr>
						<td>标题</td>
						<td><input id="title" type="text" name="title" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>内容</td>
						<td>
						<textarea rows="4" cols="40" name="content" id="content" class="easyui-validatebox" ></textarea>
						<!-- <input id="content" type="text" name="content"  /></td> -->
					</tr>
					
				</table>
			</form> 
		</div>
	</div>
</body>
</html>