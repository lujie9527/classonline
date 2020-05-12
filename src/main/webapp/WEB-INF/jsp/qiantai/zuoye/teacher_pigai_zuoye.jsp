<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <title>批改作业</title> 
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

background: url(${pageContext.request.contextPath}/image/second.jpg) no-repeat;
		}
</style>
<script type="text/javascript">
	$(function(){
		//ajax二级联动
		$("#professionId").change(function(){
			var professionId=$(this).val();
			if(professionId==-1){
				$("#banjiId").empty();
				$("#banjiId").append("<option value='-1'>请选择班级</option>");
				return;
			}
			$.post("${pageContext.request.contextPath}/banji/professionId",{pid:professionId},function(result){
				$("#banjiId").empty();
				$("#banjiId").append("<option value='-1'>请选择班级</option>");
				for(var i=0;i<result.length;i++){
					$("#banjiId").append("<option value='"+result[i].id+"' <c:if test="${banjiId}==result[i].id">selected</c:if> >"+ result[i].name+ "</option>");
				}
			});
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
             <ul class="nav  nav-tabs flex-column">
            <li class="nav-item ">
              <a class="nav-link  active" href="${pageContext.request.contextPath }/job/all" style=" width:100px;" style=" background-color:#000">批改作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/job/teacher/show_fabu" style=" width:100px;">发布作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/job/teacher/show_tijiao" style=" width:100px;">提交作业</a>
            </li>
          </ul>
        </div>
        
      
         
        <div class="col-md-10 text-center">
        <!-- 查询条件-->
        <form method="post" action="${pageContext.request.contextPath }/job/all">
        <div class="form-group form-inline" style="margin:10px;" >
        	<label>作业名称</label>
            <input type="text" class="form-control" id="name" name="name" value="${name }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <select name="professionId" class="form-control" id="professionId">
        		<option value="-1">--请选择专业--</option>
        		<c:forEach items="${professions}" var="profession">
	        		<option value="${profession.id }" <c:if test="${profession.id==professionId }">selected</c:if>>${profession.name }</option>
        		</c:forEach>
        		
     		 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <select name="banjiId" class="form-control" id="banjiId">
        		<option value="-1">--请选择班级--</option>
        		 <c:forEach items="${banjis}" var="banji">
	        		<option value="${banji.id }"  <c:if test="${banji.id==banjiId }">selected</c:if>>${banji.name }</option>
        		</c:forEach> 
     		 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="submit" class="btn btn-success">高级查询</button>
        </div>
        </form>
  <table class="table table-hover" style="font-size:0.9rem;">
    <thead class=" thead-default" >
      <tr>
        <th>作业名称</th>
        <th>同学</th>
        <th>专业</th>
        <th>班级</th>
        <th>作业发布时间</th>
        <th>作业完成时间</th>
        <th>最迟交时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${lists}" var="tp">
    	 <tr>
        <td>${tp.jobName }</td>
        <td>${tp.stuName }</td>
        <td>${tp.professionName }</td>
        <th>${tp.banjiName }</th>
        <td>${tp.jobfabuTime }</td>
        <td>${tp.jobfinishTime }</td>
        <td>${tp.joblastTime }</td>
        
        <td><a href="${pageContext.request.contextPath }/download/job?filename=${tp.stu_job_url}">下载</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

</div>
  
    </div>
   </div>
   
    <!-- 分页https://www.cnblogs.com/fuqiang88/p/4343762.html--> 
  <%--  <div class="container"> 
     <ul class="pagination justify-content-end"> 
    	<c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=1&name=${name}&banjiId=${banjiId}&professionId=${professionId}">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pageNum-1}&name=${name}&banjiId=${banjiId}&professionId=${professionId}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${page_num }&name=${name}&banjiId=${banjiId}&professionId=${professionId}">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${page_num }&name=${name}&banjiId=${banjiId}&professionId=${professionId}">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pageNum+1}&name=${name}&banjiId=${banjiId}&professionId=${professionId}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pages }&name=${name}&banjiId=${banjiId}&professionId=${professionId}">末页</a></li> 
    	</c:if>
    </ul> 
   </div>  --%>
     <!-- 页脚--> 
     <br/>
     <br/>
 <div class="footer" style="position:fixed; height:40px;width:100%;bottom:0px;">
            <div class="foot">
                <div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank">广东石油化工学院</a>&nbsp; 版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>
 <!-- 
https://blog.csdn.net/baidu_33403616/article/details/70233273-->
</body>
</html>
