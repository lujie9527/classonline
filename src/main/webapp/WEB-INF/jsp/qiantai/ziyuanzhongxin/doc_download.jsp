<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
  <title>资料下载</title> 
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
        	<form class="form-inline" method="post" action="${pageContext.request.contextPath }/doc/all" >
    			<label for="keyword">Key word:&nbsp;</label>
    			<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="search document">
    			<button type="submit" class="btn btn-primary">Search</button>
  			</form>
        </div>
    </div>
</div>
<br/>
 <div class="container"  style="min-height:500px;">
  <div class="list-group text-center">
    <a href="#" class="list-group-item list-group-item-action">
    	<span style="width:150px; white-space:nowrap; display:inline-block">资料编号</span>
    	<span  style="width:250px; white-space:nowrap; display:inline-block">资料标题</span>
        <span  style="width:150px; white-space:nowrap; display:inline-block">资料上传者</span>
        <span style="width:200px; white-space:nowrap; display:inline-block">资料上传时间</span>
    </a>
  <c:forEach items="${pageInfo.list }" var="doc" varStatus="vs">
    <a href="${pageContext.request.contextPath }/doc/id/${doc.id}" class="list-group-item list-group-item-action">
    	<span style="width:150px; white-space:nowrap; display:inline-block">${doc.id }</span>
    	<span  style="width:250px; white-space:nowrap; display:inline-block">${doc.name }</span>
        <span  style="width:150px; white-space:nowrap; display:inline-block">${doc.teacher.name }</span>
        <span style="width:200px; white-space:nowrap; display:inline-block">${doc.createTime }</span>
    </a>
   </c:forEach>
    
  
  </div>
  <br/>
  <ul class="pagination  justify-content-start">
   <c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=1&keyword=${keyword}">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=${pageInfo.pageNum-1}&keyword=${keyword}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=${page_num }&keyword=${keyword}">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=${page_num }&keyword=${keyword}">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=${pageInfo.pageNum+1}&keyword=${keyword}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/doc/all?pageNum=${pageInfo.pages }&keyword=${keyword}">末页</a></li> 
    	</c:if>
  </ul>
  </div>

<!-- 页脚-->
<footer class="footer navbar-fixed-bottom " style="background:#2A2D34;">
    <div class="container">
    	<div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a>&nbsp; 版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
    </div>
</footer>

 </body>
</html>