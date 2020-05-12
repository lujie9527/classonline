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
  <link type="text/css" rel="stylesheet" href="./css/jiaoxueshipin.css" /> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jiaoxueshipin.js"></script> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  

<link href="https://vjs.zencdn.net/7.1.0/video-js.css" rel="stylesheet">
		<script src="https://vjs.zencdn.net/7.1.0/video.js"></script>
<script src="https://vjs.zencdn.net/ie8/ie8-version/videojs-ie8.min.js"></script>
<script type="text/javascript">
	
</script>
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
	
	.vjs-big-play-button{
		 visibility :hidden
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
 
 
<br/>
 <div class="container justify-content-center" >
 	<div class="row">
    	<div class="col-9">	
			<video id='my-video' class='video-js vjs-fluid vjs-default-skin vjs-playback-rate'
             controls preload='auto' width='740' height='600' poster='${pageContext.request.contextPath }/upload/${video.imageUrl}'
              data-setup='{"playbackRates": [0.5, 1, 1.5, 2],"fluid":true,"techOrder": ["html5", "flash", "other supported tech"]}'>
    			<source src='${pageContext.request.contextPath }/upload/${video.videoUrl }' type='video/mp4'>
    			<!-- <source src='ggg.webm' type='video/webm'> -->
             </video>
        </div>
        <div class="col-3">
        	 <div class="card"  style="color:#333; background:#f6f6f6">
    <div class="card-body">
      <h5 class="card-title">${video.name}</h5>
      <p class="card-text"  style="font-size:13px">${video.description }</p>
      <span class="card-text">${video.uploadTime }</span>&nbsp;&nbsp;
      <span class="card-text">${video.teacher.name }</span>
    </div>
  </div>
        </div>
    </div>
</div>
<br/>


<!-- 页脚-->
<footer class="footer navbar-fixed-bottom " style="background:#2A2D34">
    <div class="container">
    	<div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a>&nbsp; 版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
    </div>
</footer>

 </body>
</html>