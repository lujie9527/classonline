<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <title>提交作业</title> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1" /> 
  <meta http-equiv="pragma" content="no-cache"> 
  <meta http-equiv="cache-control" content="no-cache"> 
  <meta http-equiv="expires" content="0">
   <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 

  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 

  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/new.css" /> 
   


<style>
	.secondImg{
		position: relative;

width: 1130px;

height: 154px;

margin: auto;

cursor: pointer;

background: url(${pageContext.request.contextPath }/image/second.jpg) no-repeat;
		}
	
</style>
<script type="text/javascript">
	$().ready(function(){
		var time = new Date();
		 var day = ("0" + time.getDate()).slice(-2);
 		var month = ("0" + (time.getMonth() + 1)).slice(-2);
 		var today = time.getFullYear() + "-" + (month) + "-" + (day);
		$('#date_info').val(today);
		
		
		//ajax查询该班级所有学生
		$("#banjiId").change(function(){
			var banjiId=$(this).val();
			if(banjiId==-1){
				$("#stuId").empty();
				$("#stuId").append("<option value='-1'>请选择学号</option>");
				return;
			}
			$.post("${pageContext.request.contextPath}/student/banjiId",{banjiId:banjiId},function(result){
				$("#stuId").empty();
				$("#stuId").append("<option value='-1'>请选择学号</option>");
				for(var i=0;i<result.length;i++){
					$("#stuId").append("<option value='"+result[i].id+"'>"+ result[i].id+ "</option>");
				}
			});
		});
		
		//选择文件后自动上传
		$("#job").change(function(){
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
						/*$("#coverImg").attr("src",obj); */
					}
				});
		});
		
		//表单提交事件
		$("#ok").click(function(){
			var jobId=$("#jobId option:selected").val();
			if(jobId==-1){
				alert("请选择作业");
				return;
			}
			var professionId=$("#professionId option:selected").val()
			if(professionId=="-1"){
				alert("请选择专业");
				return;
			}
			var banjiId=$("#banjiId option:selected").val();
			if(banjiId=="-1"){
				alert("请选择班级");
				return;
			}
			var stuId=$("#stuId option:selected").val();
			if(stuId=="-1"){
				alert("请选择学号");
				return;
			}
			var url=$("#url").val();
			if(url==""){
				alert("请上传作业");
				return;
			}
			var grade=$("#grade").val().trim();
			if(grade==""){
				alert("请填写分数");
				return;
			}
			
			//发送请求
			var formData=new FormData();
			formData.append("jobId",jobId);
			formData.append("professionId",professionId);
			formData.append("banjiId",banjiId);
			formData.append("stuId",stuId);
			formData.append("url",url);
			formData.append("grade",grade);
			$.ajax({
				url:'${pageContext.request.contextPath}/job/teacher/tijiao',
				data:formData,
				type:'POST',
				contentType: false,
				processData:false,
				success:function(result){
					if(result=="200"){
						alert("提交成功");
						window.location.href="${pageContext.request.contextPath}/job/all"
					}
				}
			})
		});
	})
</script>
 </head> 
<body>
 
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark"> 
   <!-- Brand --> 
   <a class="navbar-brand" href="#">网络教学系统</a> 
   <!-- Links --> 
    <ul class="navbar-nav"> 
    <li class="nav-item active"> <a class="nav-link " href="${pageContext.request.contextPath }">首页</a> </li> 
    <li class="nav-item"> <a class="nav-link " href="${pageContext.request.contextPath}/notice/all">公告通知</a> </li> 
    <li class="nav-item"> <a class="nav-link " href="${pageContext.request.contextPath }/job/all">作业</a> </li> 
    <!-- Dropdown --> 
    <li class="nav-item dropdown "> <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 资源中心 </a> 
     <div class="dropdown-menu"> 
      <a class="dropdown-item" href="${pageContext.request.contextPath }/doc/all">资料下载</a> 
      <a class="dropdown-item" href="${pageContext.request.contextPath }/video/all">教学视频</a> 
     </div> </li> 
    <li class="nav-item "> <a class="nav-link" href="${pageContext.request.contextPath }/liuyan/all">留言解惑</a> </li> 
    
    <li class="nav-item "> <a class="nav-link" href="${pageContext.request.contextPath }/link/all">友情链接</a> </li> 
    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/gerenzhongxin/home" target="_blank">个人中心</a> </li> 
    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a> </li> 
   </ul> 
   <c:if test="${user==null}">
   <ul class="navbar-nav ml-auto" style="margin-right:70px;"> 
    <button type="button" class="btn btn-light">登录</button> 
   </ul> 
   </c:if>
  </nav>
  
  <div class="container">
  	<div class="secondImg"></div>
  </div>
  	
    <!-- 中间内容-->
   <div class="container">
   		 <div class="row">
    	<div class="col-md-2 text-right" style="margin-top:10px;">
             <ul class="nav nav-tabs flex-column">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/job/all" style=" width:100px;">批改作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.request.contextPath }/job/teacher/show_fabu" style=" width:100px;">发布作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath }/job/teacher/show_tijiao" style=" width:100px;">提交作业</a>
            </li>
          </ul>
        </div>
        
      	<div class="col-md-2"></div>
         
        <div class="col-md-8 text-left">
       		<form>
    		<div class="row" style="margin-top:10px;">
            	<div class="col-md-5">
                	<div class="form-inline">
      					<label>作业名称:</label>&nbsp;
      					<select class="form-control" id="jobId">
                			<option value="-1">请选择作业</option>
                    		<c:forEach items="${lists }" var="job">
                    			<option value="${job.id }">${job.name }</option>
                    		</c:forEach>
               			 </select>
    				</div>
                </div> 
                <div class="col-md-5">
                	 <div class="form-inline">
      					<label>专业:</label>&nbsp;
      					<select class="form-control" id="professionId">
                			<option value="-1">请选择专业</option>
                    		<c:forEach items="${professions }" var="profession">
                    			<option value="${profession.id }">${profession.name }</option>
                    		</c:forEach>
               			 </select>
    				</div>
                </div>
            </div>
            <br/>
            <div class="row">
            	<div class="col-md-5">
                	 <div class="form-inline">
      					<label>班级名称:</label>&nbsp;
      					<select class="form-control" id="banjiId">
                			<option value="-1">请选择班级</option>
                    		<c:forEach items="${banjis }" var="banji">
                    			<option value="${banji.id }">${banji.name }</option>
                    		</c:forEach>
               			 </select>
    				</div>
                </div>
                <div class="col-md-5">
                	 <div class="form-inline">
      					<label>学号:</label>&nbsp;
      					<select class="form-control" id="stuId">
                			<option value="-1">请选择学号</option>
                    		
                		</select>
    				</div>
                </div>
            </div>
            
      		<br/>
            <div class="row">
            	<div class="col-md-2"><label>作业：</label></div>
            	<div class="col-md-9">
            	 <div>
                    <input type="file" class=" form-control-file" name="job" id="job"/>
                    <input type="hidden" name="url" id="url">
                </div>
                </div>
            </div>
            <br/>
         	<div class="row">
            	<div class="col-md-10">
                	<div class="form-inline">
      					<label>分数:</label>&nbsp;
      					<input type="text" id="grade" class="form-control" oninput="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"/>
    				</div>
                </div>   
            </div>
            <br/>
    		<button type="button" class="btn btn-info" id="ok">提交</button>
  		</form>
	</div>
    <div class="col-md-2"></div>

 

		</div>
    </div>
   </div>
  
     <!-- 页脚--> 
 <div class="footer" style="position:fixed; height:40px;width:100%;bottom:0px;">
            <div class="foot">
                <div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank">广东石油化工学院</a> &nbsp;版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>
 <!-- 
https://blog.csdn.net/baidu_33403616/article/details/70233273-->
</body>
</html>
