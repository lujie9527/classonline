<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
  <title>THEOL网络教学综合平台-杭州师范大学</title> 
  <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8;" /> 
  <meta http-equiv="“X-UA-Compatible”" content="“chrome=1″" /> 
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/jiaoxueshipin.css" /> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jiaoxueshipin.js"></script> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  <style>
  	.copyright p{
		height: 50px;
		font-size: 12px;
		color: #72757A;
		line-height: 53px;
		text-align: center;	
	}
	.copyright p a{
			color: #72757A;
			text-decoration: none;
		}
  </style>
 </head> 
 <body  style="color:#333; background:#f6f6f6"> 
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
 
 <!-- 搜索-->
 <div class="container" style="margin-top:1rem;">
 	<div class="row">
    	<div class="col-7"></div>
        <div class="col-5">
        	<form class="form-inline" action="${pageContext.request.contextPath }/video/all" method="post">
    			<label for="name">Key word:&nbsp;</label>
    			<input type="text" class="form-control" id="name" name="keyword" value="${keyword}" placeholder="search video">
    			<button type="submit" class="btn btn-primary">Search</button>
  			</form>
        </div>
    </div>
</div>
<br/>
 <div class="container justify-content-center" style="max-width:1160px;">
 	<ul class="list-inline" style="margin:0.5rem;">
 		
 	   <c:forEach items="${pageInfo.list }" var="video">
    	<li class="list-inline-item">
 	 		<div class="card" style="width:13rem;">
   				 <a href="${pageContext.request.contextPath }/video/vid/${video.id}"><img class="card-img-top" src="${pageContext.request.contextPath }/upload/${video.imageUrl }" alt="${video.name }" style="width:100%"></a>
    			<div class="card-body text-center" style="padding:0.5rem;">
      			<h6 class="card-title">${video.name }</h6>       	
                <p class="card-text" style="font-size:11px; margin-bottom:0.2rem;">${video.playNum }次播放&nbsp;&nbsp;${video.teacher.name }&nbsp;&nbsp;${video.uploadTime }</p>
    			</div>
  			</div> 
        </li> 
      </c:forEach>  
    </ul>   
</div>
<br/>
<div class="container">
 <ul class="pagination justify-content-center">
   		<c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=1&keyword=${keyword}">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=${pageInfo.pageNum-1}&keyword=${keyword}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=${page_num }&keyword=${keyword}">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=${page_num }&keyword=${keyword}">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=${pageInfo.pageNum+1}&keyword=${keyword}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/video/all?pageNum=${pageInfo.pages }&keyword=${keyword}">末页</a></li> 
    	</c:if>
  </ul>
</div>

<!-- 页脚-->
<footer class="footer navbar-fixed-bottom " style="background:#2A2D34">
    <div class="container">
    	<div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a> 版权所有 2019&nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
    </div>
</footer>

 </body>
</html>