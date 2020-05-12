<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <title>发布作业</title> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1" /> 
  <meta http-equiv="pragma" content="no-cache"> 
  <meta http-equiv="cache-control" content="no-cache"> 
  <meta http-equiv="expires" content="0">
   <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 

  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 

  
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/new.css" /> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>


<style type="text/css">
	.secondImg{
		position: relative;
		width: 1130px;
		height: 154px;
		margin: auto;
		cursor: pointer;
		background: url(${pageContext.request.contextPath}/image/second.jpg) no-repeat;
	}
	input[type="date"]::-webkit-clear-button { display:none }
</style>
<script type="text/javascript">
	$().ready(function(){
		var time = new Date();
 		var day = ("0" + time.getDate()).slice(-2);
		var month = ("0" + (time.getMonth() + 1)).slice(-2);
		 var today = time.getFullYear() + "-" + (month) + "-" + (day);
 		$('#date_info').val(today);
 		$("#date_info").attr("min",time.getFullYear()+"-"+month+"-"+day);
 		
 		//ajax二级联动
		$("#professionId").change(function(){
			var id=$(this).val();
			if(id==-1) return;
			//根据id查询该专业的所有班级
			$.post("${pageContext.request.contextPath}/banji/professionId/",{"pid":id},function(result){
				$("#banji").empty();
				$("#banji").append("<option value='-1'>请选择班级</option>");
				for(var i=0;i<result.length;i++){
					$("#banji").append("<option value='"+result[i].id+"'>"+ result[i].name+ "</option>");
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
			var name=$("#name").val().trim();
			if(name==""){
				alert("作业名称不能为空");
				return;
			}
			var professionId=$("#professionId option:selected").val()
			if(professionId=="-1"){
				alert("请选择专业");
				return;
			}
			var banjiId=$("#banji option:selected").val();
			if(banjiId=="-1"){
				alert("请选择班级");
				return;
			}
			var lastTime=$("#date_info").val();
			if(lastTime==""){
				alert("请选择时间");
				return;
			}
			var url=$("#url").val();
			if(url==""){
				alert("请上传作业");
				return;
			}
			
			//发送请求
			var formData=new FormData();
			formData.append("name",name);
			formData.append("professionId",professionId);
			formData.append("banjiId",banjiId);
			formData.append("lastTime",lastTime);
			formData.append("url",url);
			$.ajax({
				url:'${pageContext.request.contextPath}/job/teacher/fabu',
				data:formData,
				type:'POST',
				contentType: false,
				processData:false,
				success:function(result){
					if(result=="200"){
						alert("发布成功");
						window.location.href="${pageContext.request.contextPath}/job/all"
					}
				}
			})
		});
	});
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
    <button type="button" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath }/toLogin'">登录</button> 
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
              <a class="nav-link active" href="${pageContext.request.contextPath }/job/teacher/show_fabu" style=" width:100px;">发布作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/job/teacher/show_tijiao" style=" width:100px;">提交作业</a>
            </li>
          </ul>
        </div>
        
      	<div class="col-md-2"></div>
         
        <div class="col-md-6 text-left">
       		<form method="post" action="${pageContext.request.contextPath}/job/teacher/fabu">
    		<div class="row" style="margin-top:10px;">
            	<div class=" col-md-7">
                	<div class="form-inline">
      					<label>作业名称:</label>&nbsp;
      					<input name="name" type="text" class="form-control" id="name" placeholder="Enter name">
    				</div>
                </div> 
            </div>
            <br/>
            <div class="row">
            	<div class="col-md-5">
                	 <div class="form-inline">
      					<label>所属专业:</label>&nbsp;
      					<select name="professionId" class="form-control" id="professionId">
                			<option value="-1">请选择专业</option>
                			<c:forEach items="${professions }" var="profession">
                				<option value="${profession.id }">${profession.name }</option>
                			</c:forEach>
               			 </select>
    		</div>
                </div>
                <div class="col-md-5">
                	 <div class="form-inline">
      					<label>所属班级:</label>&nbsp;
      					<select name="banjiId" class="form-control" id="banji">
                			<option>请选择班级</option>
                		</select>
    				</div>
                </div>
            </div>
            <br/>
         	<div class="row">
            	<div class="col-md-9">
                	<div class="form-inline">
      					<label>最迟提交时间:</label>&nbsp;
      					<input name="lastTime" type="date" class="form-control" id="date_info"/>
    				</div>
                </div>   
            </div>
      		<br/>
            <div class="row">
            	<div class="col-md-2"><label>作业：</label></div>
            	<div class="col-md-9">
            	 <div>
                    <input name="job" type="file" class=" form-control-file" id="job"/>
                    <input type="hidden" name="url" id="url">
                </div>
                </div>
            </div>
            <br/>
    		<button type="button" id="ok" class="btn btn-info">发布</button>
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
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a>&nbsp; 版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>
</body>
</html>
