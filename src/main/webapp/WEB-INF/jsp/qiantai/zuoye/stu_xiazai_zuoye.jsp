<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <title>作业</title> 
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
        <!-- 学生-->
        <div class="col-md-2 text-center" style="margin-top:10px;">
             <ul class="nav nav-tabs flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath }/job/all" style=" width:120px;">下载作业</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/job/stu/show_tijiao" style=" width:120px;">提交作业</a>
            </li>
          </ul>
        </div>
         
  <div class="col-md-10 text-center">
  <table class="table table-hover">
    <thead class=" thead-default">
      <tr>
        
        <th>作业名称</th>
        <th>班级</th>
        <th>作业上传时间</th>
        <th>最迟交时间</th>
        <th>负责老师</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="job" varStatus="vs">
      <tr>
        <td>${job.name }</td>
         <td>${banjiName}</td>
        <td>${job.uploadTime }</td>
        <td>${job.lastTime }</td>
        <td>${job.teacher.name }</td>
        <td><a href="${pageContext.request.contextPath}/download/job?filename=${job.url}">下载</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</div>
</div>
<br/>
<!-- 分页 -->
 <div class="container"> 
    <ul class="pagination justify-content-end"> 
    	<c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=1">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pageNum-1}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${page_num }">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${page_num }">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pageNum+1}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/job/all?pageNum=${pageInfo.pages }">末页</a></li> 
    	</c:if>
    </ul> 
   </div> 
   <br>
     <!-- 页脚--> 
 <div class="footer" style="position:fixed; height:40px;width:100%;bottom:0px;">
            <div class="foot">
                <div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a>&nbsp; 版权所有 2019&nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>

</body>
</html>
