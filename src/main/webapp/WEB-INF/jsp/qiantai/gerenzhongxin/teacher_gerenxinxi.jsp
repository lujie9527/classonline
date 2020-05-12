<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#touxiang").change(function(){
			var formData= new FormData();
			var file =$("#touxiang")[0].files[0];
			formData.append("touxiang",file);
			$.ajax({
					url : '${pageContext.request.contextPath}/upload/touxiang',
					data : formData,
					type : "POST",
					contentType : false, //上传文件要设置成false
					processData : false,
					success : function(result) {
						 $("#imgUrl").attr("src","${pageContext.request.contextPath}/upload/"+result);
					}
				});
		})
	})
</script>
</head>
<body>

<!-- <form class="layui-form"> --> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
<!-- 第一行-->
	<div class="layui-form-item">
    	<div class="layui-inline">
        	<label class="layui-form-label">头像</label>
			<img id="imgUrl"  style="height:100px; width:100px;border-radius:50%;" src="${pageContext.request.contextPath }/upload/${user.url}" class="layui-upload-img"/>
        </div>
        <input type="file" class=" form-control-file" name="touxiang" id="touxiang"/>
		<!-- <button class="layui-btn layui-btn-warm" id="touxiang_upload">上传</button> -->
	</div>

  <div class="layui-form-item">
	<div class="layui-inline">
		<label class="layui-form-label">工号</label>
		<div class="layui-input-inline">
			<input type="text" name="id" autocomplete="off" class="layui-input" value="${user.id }" readonly>
		</div>
	</div>
	
	<div class="layui-inline">
		<label class="layui-form-label">姓名</label>
		<div class="layui-input-inline">
			<input type="text" name="name" autocomplete="off" class="layui-input" value="${user.name }" readonly>
		</div>
	</div>
	
	<div class="layui-inline">
		<label class="layui-form-label">密码</label>
		<div class="layui-input-inline">
			<input type="password" name="password" id="password" autocomplete="off" class="layui-input" value="${user.password }">
            
		</div>
        <button class="layui-btn layui-btn-danger layui-btn-radius" id="updatePwd">修改</button>
	</div>
  </div>
  
	
  <!-- 第二行-->
  <div class="layui-form-item">
	<div class="layui-inline">
		<label class="layui-form-label">性别</label>
		<div class="layui-input-inline">
			<input type="text" name="sex" autocomplete="off" class="layui-input" value="${user.sex }" readonly>
		</div>
	</div>
	<div class="layui-inline">
		<label class="layui-form-label">年龄</label>
		<div class="layui-input-inline">
			<input type="text" name="age" autocomplete="off" class="layui-input" value="${user.age }" readonly>
		</div>
	</div>

<!-- </form>  --> 

<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','element','jquery'], function(){
  var form = layui.form;
  layer = layui.layer,
	element=layui.element,
	$=layui.jquery;
  //各种基于事件的操作，下面会有进一步介绍
  $(document).on('click','#updatePwd',function(){
  
  		var newPwd=window.prompt("请输入新密码");
			if(newPwd.length<5){
				alert("密码长度须大于5");
				return;
			}
			$.post("${pageContext.request.contextPath}/teacher/updatepwd",{"password":newPwd},function(result){
				if(result=="200"){
					alert("密码修改成功");
					window.top.location.href="${pageContext.request.contextPath}/qiantai/loginOut";
				}
			}); 
	});
});

</script>


</body>
</html>