<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <title>网络教学系统</title> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1" /> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 20%;
  }
  </style> 

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/new.css" /> 
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
  
  
  <div class="jumbotron" style="padding:2rem 2rem; text-align:center;"> 
   <span style=" font-size:20px; color:#525252">系统通知公告</span> 
  </div> 
  <!--公告通知 --> 
  <div class="container"> 
   <div class="row justify-content-end"> 
    <form action="${pageContext.request.contextPath }/notice/all"> 
     <div class="form-inline"> 
      <label>查询到<span style="color:#f00">${pageInfo.total}</span>条记录</label>&nbsp;&nbsp; 
      <input type="text" class="form-control" id="usr" name="keyWord" value="${keyWord }"/> 
      <button type="submit" class="btn btn-light">search</button> 
     </div> 
    </form> 
   </div> 
  </div>
  <br /> 
  <div class="container"> 
  	<c:forEach items="${pageInfo.list}" var="notice">
   		<div class="row"> 
			<div class="col text-left"><a href="${pageContext.request.contextPath }/notice/${notice.id}">${notice.title}</a></div> 
    		
    		<div class="col text-right" style="margin-right: 100px;">${notice.noticeTime}</div> 
   		</div> 
   		<hr /> 
   	</c:forEach> 
  </div>
   
   <br /> 
   <!-- 分页https://www.cnblogs.com/fuqiang88/p/4343762.html--> 
   
   <div class="container"> 
    <ul class="pagination justify-content-end"> 
    	<c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=1&keyWord=${keyWord}">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pageNum-1}&keyWord=${keyWord}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${page_num }&keyWord=${keyWord}">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${page_num }&keyWord=${keyWord}">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pageNum+1}&keyWord=${keyWord}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/all?pageNum=${pageInfo.pages }&keyWord=${keyWord}">末页</a></li> 
    	</c:if>
    </ul> 
   </div> 
   <br>
   <!-- 页脚--> 
 <div class="footer" style="position:fixed; height:60px;width:100%;bottom:0px;">
            <div class="foot">
                <div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank">广东石油化工学院</a>&nbsp; 版权所有 2019&nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>

 </body>
</html>