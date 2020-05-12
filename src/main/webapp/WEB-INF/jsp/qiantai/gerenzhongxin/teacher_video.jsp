<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>视频上传</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#video").change(function(){
			var formData= new FormData();
			var file =$("#video")[0].files[0];
			formData.append("job",file);
			$.ajax({
					url : '${pageContext.request.contextPath}/upload/job',
					data : formData,
					type : "POST",
					contentType : false, //上传文件要设置成false
					processData : false,
					success : function(result) {
						 $("#videoUrl").val(result);
					}
				});
		});
		
		
		$("#image").change(function(){
			var formData= new FormData();
			var file =$("#image")[0].files[0];
			formData.append("job",file);
			$.ajax({
					url : '${pageContext.request.contextPath}/upload/job',
					data : formData,
					type : "POST",
					contentType : false, //上传文件要设置成false
					processData : false,
					success : function(result) {
						 $("#imgUrl").attr("src","${pageContext.request.contextPath}/upload/"+result);
						 $("#imageUrl").val(result);
					}
				});
		})
	})
</script>
</head>
<body>

<form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
<!-- 第一行-->
  <div class="layui-form-item">
		<label class="layui-form-label">视频名称</label>
		<div class="layui-input-inline">
			<input type="text" name="name" id="name" autocomplete="off" class="layui-input" >
		</div>
	</div>
	<div class="layui-form-item">
    	<div class="layui-inline">
        	<label class="layui-form-label">封面图片</label>
			<img id="imgUrl"  style="height:100px; width:100px;border-radius:50%;"  class="layui-upload-img" />
			 <input type="text" class="layui-hide" id="imageUrl" name="imageUrl"/>
        </div>
        <input type="file" class=" form-control-file" name="image" id="image"/>
	</div>
	
	<div class="layui-form-item">
    	<div class="layui-inline">
        	<label class="layui-form-label">视频</label>
        </div>
        <input type="text" class="layui-hide" id="videoUrl" name="videoUrl"/>
        <input type="file" class=" form-control-file" name="video" id="video"/>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">视频描述</label>
		<div class="layui-input-block">
      		<textarea placeholder="请输入内容" class="layui-textarea" name="description" id="description"></textarea>
    	</div>
	</div>
	<div class="layui-form-item">
		<button class="layui-btn" id="upload">上传</button>
		
	</div>
</form>  

<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','element','jquery'], function(){
  var form = layui.form;
  layer = layui.layer,
	element=layui.element,
	$=layui.jquery;
  //各种基于事件的操作，下面会有进一步介绍
  $(document).on('click','#upload',function(){
 		var name= $("#name").val();
 		var imageUrl=$("#imageUrl").val()
 		var videoUrl=$("#videoUrl").val()
 		var description=$("#description").val();
			$.post("${pageContext.request.contextPath}/gerenzhongxin/teacher/addVideo",{"name":name,"imageUrl":imageUrl,"videoUrl":videoUrl,"description":description},function(result){
				if(result=="200"){
					layer.msg('上传成功');
				}
			});   
	});
});

</script>


</body>
</html>