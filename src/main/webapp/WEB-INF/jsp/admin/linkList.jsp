<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接管理</title>
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
		 $('#linkForm').form( 'clear');
		/* $("#name").val("");
		$("#gender").val("");
		$("#education").val("");
		$("#job").val("");
		$("#age").numberbox('setValue',null);  
		$("#id").val(''); */
		$("#bianhao").hide();
		//将添加窗口打开			
		$('#addLinkWindow').window("open");
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
			       $.post("${pageContext.request.contextPath}/admin/link/delete",{"ids":ids},function(data){
			       		if(data=="200"){
					       		location.href="${pageContext.request.contextPath}/admin/link/list";
			       			
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
		field : 'name',
		title : '名称',
		width : 150,
		align : 'center'
	}, {
		field : 'url',
		title : '链接',
		width : 200,
		align : 'center'
	}, {
		field : 'imgUrl',
		title : '封面图片',
		width : 200,
		align : 'center',
		formatter:function(value, row, index){
			/* if(row.url){ */
				return "<img style='width:36px;height:36px;border-radius:50%' border='1' src='${pageContext.request.contextPath}/upload/"+row.imgUrl+"'/>";
			//}
		}
		
	}] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		$("body").delegate('#job', 'change', function(){
			var formData= new FormData();
			var file =$("#job")[0].files[0];
			formData.append("job",file);
			$.ajax({
					url : '${pageContext.request.contextPath}/upload/job',
					data : formData,
					type : "POST",
					contentType : false, //上传文件要设置成false
					processData : false,
					success : function(result) {
						 $("#imgUrl").val(result);
					}
				});
		})
		
		
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
			url : "${pageContext.request.contextPath}/admin/link/list/json",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加员工窗口
		$('#addLinkWindow').window({
            title: '添加员工信息',
            width: 400,
            modal: true,
            shadow: true,
            closed: true,
            height: 350,
            resizable:false
        });
		
	});
	
	//修改 收货标准数据，双击修改，修改必须有id（隐藏)
	function doDblClickRow(rowIndex, rowData){
		//将添加窗口弹出
		$("#addLinkWindow").panel({
			title:"修改员工信息"
		});
		$("#addLinkWindow").window('open');
		
		$("#isUpdate").val("1");
		//将数据回显,查看easyui的帮助文档
		$("#name").val(rowData.name);
		$("#url").val(rowData.url);
		$("#id").val(rowData.id);
		$("#bianhao").show();
		$("#id").attr("readonly","readonly");
	}
	
	//提交表单
	function commitlinkForm(){
		if($("#linkForm").form("validate")){ //执行easyui的验证方法
			//如果easyui的验证通过
			$("#linkForm").submit();
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
	<div class="easyui-window" title="添加友情链接" id="addLinkWindow" collapsible="false" minimizable="false" maximizable="false" style="top:100px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:commitlinkForm();" class="easyui-linkbutton"  plain="true" >保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
		 <form id="linkForm" action="${pageContext.request.contextPath }/admin/link/addOrUpdate" method="post">
		 <input type="hidden" name="isUpdate" id="isUpdate">
			<table class="table-edit" width="80%" align="center">
					<tr class="title1">
						<td colspan="2">员工信息</td>
					</tr>
					<tr id="bianhao">
						<td>编号</td>
						<td><input id="id" type="text" name="id" class="easyui-validatebox"  /></td>
					</tr>
					<tr>
						<td>名称</td>
						<td><input id="name" type="text" name="name" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>链接</td>
						<td><input id="url" type="text" name="url" class="easyui-validatebox" required="true"  /></td>
					</tr>
					<tr>
						<td>封面图片</td>
						<td>
							 <input name="job" type="file"  id="job"/>
                    		<input type="hidden" name="imgUrl" id="imgUrl">
						</td>
					</tr>
				</table>
			</form> 
		</div>
	</div>
</body>
</html>