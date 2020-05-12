<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta charset="utf-8">
<title>资料上传</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
</head>
<body>
<script type="text/javascript">
	$(function(){
		$("#doc").change(function(){
			var formData= new FormData();
			var file =$("#doc")[0].files[0];
			formData.append("doc",file);
			$.ajax({
					url : '${pageContext.request.contextPath}/upload/doc',
					data : formData,
					type : "POST",
					contentType : false, //上传文件要设置成false
					processData : false,
					success : function(result) {
					  var json=eval("(" + result + ")");
						 $("#filename").val(json.filename);
						 $("#url").val(json.url);
						 $("#size").val(json.size);
					}
				});
		})
	});
</script>
<form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
<!-- 第一行-->
	 <div class="layui-form-item">
    <label class="layui-form-label">资料分类</label>
    <div class="layui-input-block">
      <select name="docId" id="docId"   lay-filter="docId" >
      <option value="-1">请选择</option>
      	<c:forEach items="${docs }" var="doc">
      		 <option value="${doc.id }">${doc.name}</option>
      	</c:forEach>
      	
      </select>
    </div>
  </div>


  <div class="layui-form-item" id="fenlei">
		<label class="layui-form-label">资料分类名</label>
		<div class="layui-input-inline">
			<input type="text" name="name" id="name" autocomplete="off" class="layui-input" >
		</div>
	</div>
<div class="layui-form-item">
    	<div class="layui-inline">
        	<label class="layui-form-label">资料文件</label>
			 <input type="text" class="layui-hide" id="url" name="url"/>
			 <input type="text" class="layui-hide" id="size" name="size"/>
			 <input type="text" class="layui-hide" id="filename" name="filename"/>
        </div>
        <input type="file" class=" form-control-file" name="doc" id="doc"/>
	</div>
	
	
	
	<div class="layui-form-item">
		<label class="layui-form-label">资料描述</label>
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
	
	form.on('select(docId)', function(data){
		if(data.value!="" && data.value!=0 && data.value!=-1){
			$("#fenlei").attr("class","layui-hide")
		}else{
			$("#fenlei").attr("class","layui-show")
		}
	})
	
  //各种基于事件的操作，下面会有进一步介绍
  $(document).on('click','#upload',function(){
  		var docId=$("#docId").val();
 		var name= $("#name").val();
 		var url=$("#url").val()
 		var size=$("#size").val();
 		var filename=$("#filename").val()
 		var description=$("#description").val();
			$.post("${pageContext.request.contextPath}/gerenzhongxin/teacher/addDoc",{"size":size,"docId":docId,"name":name,"url":url,"filename":filename,"description":description},function(result){
				if(result=="200"){
					layer.msg('上传成功');
				}
			});   
	});
});

</script>


</body>
</html>