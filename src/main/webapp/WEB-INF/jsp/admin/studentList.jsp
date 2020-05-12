<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理</title>
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
		   $('#studentForm').form( 'clear');//应该使用自带的方法 不然会出现逗号
		   $("#id").val("");
		/* $("#name").val("");
		$("#sex").val("");
		$("#education").val("");
		$("#job").val("");
		$("#age").numberbox('setValue',null);  
		$("#id").val(''); */
		//将添加窗口打开		
		$("#id").removeAttr("readonly");	
		$('#addStudentWindow').window("open");
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
			       $.post("${pageContext.request.contextPath}/admin/student/delete",{"ids":ids},function(data){
			       		if(data=="200"){
				       		location.href="${pageContext.request.contextPath}/admin/student/list";
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
	},{
		field : 'id',
		title : '学号',
		width : 120,
		align : 'center'
	}, {
		field : 'name',
		title : '姓名',
		width : 120,
		align : 'center'
	}, {
		field : 'sex',
		title : '性别',
		width : 100,
		align : 'center'
	}, {
		field : 'age',
		title : '年龄',
		width : 100,
		align : 'center',
		
	}, {
		field : 'ruxueTime',
		title : '入学时间',
		width : 160,
		align : 'center',
		
	},{
		field : 'banji.id',
		title : '班级',
		width : 100,
		align : 'center',
		formatter: function (value, row){
			return row["banji"]["name"];
		}
		
	}, 
	 {
		field : 'profession.idd',
		title : '专业',
		width : 100,
		align : 'center',
		formatter:function(value,row){
			return row["profession"]["name"];
		}
		
	},{
		field : 'url',
		title : '头像',
		width : 160,
		align : 'center',
		formatter:function(value, row, index){
			 if(row.url){ 
				return "<img style='width:36px;height:36px;border-radius:50%' border='1' src='${pageContext.request.contextPath}/upload/"+row.url+"'/>";
			}
		}
		
	} ] ];
	
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
						 $("#url").val(result);
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
			url : "${pageContext.request.contextPath}/admin/student/list/json",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加员工窗口
		$('#addStudentWindow').window({
            title: '添加学生信息',
            width: 490,
            modal: true,
            shadow: true,
            closed: true,
            height: 450,
            resizable:false,
            draggable:false
        });
			
		    $('#professionId').combobox({
        		url:'${pageContext.request.contextPath}/admin/profession/list/json',
        		valueField:'id',
        		textField:'name',
        		onSelect:function(rec){
					$('#banjiId').combobox({
        				url:'${pageContext.request.contextPath}/admin/banji/list/pid?id='+rec.id,
        				valueField:'id',
        				textField:'name'
        			}); 
        		}
    	});
	});
	
	//双击修改，修改必须有id（隐藏)
	function doDblClickRow(rowIndex, rowData){
		//将添加窗口弹出
		$("#addStudentWindow").panel({
			title:"修改学生信息"
		});
		$("#addStudentWindow").window('open');
		
		//将数据回显,查看easyui的帮助文档
		$("#isUpdate").val("1");
		$("#id").val(rowData.id);
		$("#id").attr("readonly","readonly");
		$("#name").val(rowData.name);
		$("#age").val(rowData.age);
		if(rowData.sex=="男"){
			$("#sex").val("男");
		}else{
			$("#sex").val("女");
		}
		
		$("#password").val(rowData.password);
		 
	}
	
	//提交表单
	function commitstudentForm(){
		if($("#studentForm").form("validate")){ //执行easyui的验证方法
			//如果easyui的验证通过
			$("#studentForm").submit();
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
	<div class="easyui-window" title="添加学生" id="addStudentWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:300px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:commitstudentForm();" class="easyui-linkbutton"  plain="true" >保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
		 <form id="studentForm" action="${pageContext.request.contextPath }/admin/student/addOrUpdate" method="post">
			<table class="table-edit" width="80%" align="center">
					<tr class="title1">
						<td colspan="2">学生信息</td>
					</tr>
					
					<input type="hidden" id="isUpdate" name="isUpdate"/>
					<tr>
						<td>学号</td>
						<td><input id="id" type="text" name="id" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input id="name" type="text" name="name" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input id="password" type="password" name="password" class="easyui-validatebox" required="true" /></td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<input id="man" type="radio" name="sex" value="男" checked="checked">男
							<input id="woman" type="radio" name="sex" value="女">女 
						</td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input id="age" type="text" name="age" class="easyui-numberbox" /></td>
					</tr>
					<tr>
						<td>专业</td>
						<td>
							<input id="professionId" name="professionId">	
						</td>
					</tr>
					
					
					<tr>
						<td>班级</td>
						<td>
                			<input id="banjiId" name="banjiId">	
						</td>
					</tr>
					<tr>
						<td>入学时间</td>
						<td>
							<input id="ruxueTime" name="ruxueTime" type="text" class="easyui-datebox">
						</td>
					</tr>
					<tr>
						<td>头像</td>
						<td>
							 <input name="job" type="file"  id="job"/>
                    		<input type="hidden" name="url" id="url">
						</td>
					</tr>
				</table>
			</form> 
		</div>
	</div>
</body>
</html>