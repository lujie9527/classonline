<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <head> 
  <title>公告详情页</title> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1" /> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 

 </head> 
 <body> 
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark"> 
   <a class="navbar-brand " href="#">网络教学系统</a> 
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
   <ul class="navbar-nav ml-auto" style="margin-right:70px;"> 
    <button type="button" class="btn btn-light">登录</button> 
   </ul> 
  </nav>
  
  <div class="container">
  		<h4 class="text-center" style="margin:20px;">${notice.title }</h4>
  </div>
  <div class="container" style="background-color:#EDF1F2">
  	 <div class="row justify-content-center">
     	<div class="form-inline">
        	<span style="font-size:0.8rem">发布人:</span>&nbsp;
            <span style="font-size:0.8rem">${notice.admin.name }</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size:0.8rem">发布时间:</span>&nbsp;
            <span style="font-size:0.8rem">${notice.noticeTime}</span>
        </div>
     </div>
  </div>
  <br>
  <!-- 内容-->
  <div class="container" style="border:1px solid #DFDFDF; padding:30px; font-size:14px; height:auto; min-height:400px;">
  	<span>
    	${notice.content}
    </span>
  </div>
    <!-- 页脚--> 
 <div class="footer" style="width: 100%;background: #2A2D34; margin:0 auto; height: 60px;">
            <div class="foot" style="margin:0 auto; height: 60px;">
                <div class="copyright" style="height: 60px;font-size: 12px;color: #72757A;line-height: 60px;text-align: center;">
                        <p style="height: 60px;font-size: 12px;color: #72757A;line-height: 60px;text-align: center; margin-bottom: 0"><a href="http://www.gdupt.edu.cn" style="color: #72757A" target="_blank">广东石油化工学院</a>&nbsp; 版权所有 2019（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
            </div>
        </div>

</body>
</html>
