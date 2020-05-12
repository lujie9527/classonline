<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${liuyan.title }_留言解惑详情</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
   
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuoxiangqin.css" type="text/css">
  <script type="text/javascript" src="${pageContext.request.contextPath }/wangEditor-3.1.1/wangEditor.min.js"></script>
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
	#huida:hover{ color:#000}
  </style>
</head>
  <body style=" background-color:#FFF">
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
  
   <div class="container justify-content-center">
    <div id="main">
      <div class="container qa-container clearfix">
        <div class="qa-left l">
          <div class="qa-left-wrap">
            <div class="qa-header">
              <!-- <a href="https://www.imooc.com/u/6923697/bbs" target="_blank" class="qa-author"> -->
                <img src="${pageContext.request.contextPath }/upload/${liuyan.student.url}" style="border-radius: 50%" width="40" height="40">${liuyan.student.name }<!-- </a> --></div>
            <div class="qa-content" data-qid="301277">
              <div class="qa-content-inner aimgPreview">
                <div id="js-content-main">
                  <h1 class="js-qa-wenda-title qa-wenda-title">${liuyan.title }</h1>
                  <div id="js-qa-content" class="qa-disscus rich-text">
                    <p>${liuyan.content }</p>
                  </div>
                </div>
              </div>
              <div class="qa-content-addon clearfix">
                <span class="qa-createtime l">${liuyan.liuyanTime }</span>
                <!-- <a href="https://www.imooc.com/video/16848" class="qa-course-from">源自：GO语言语法入门篇 3-2</a> -->
                <span class="qa-total-comment r">${liuyan.answer } 回答</span></div>
            </div>
            <div class="qa-comments" data-title="依赖包是啥">
            <!--  老师的评论 -->
            <c:forEach items="${teacherPingluns}" var="teacherPinglun">
              <div class="qa-comment js-qa-comment" data-cid="478695" id="id_478695">
                <div class="qa-comment-wrap clearfix ">
                  <div class="qa-comment-author">
                   <%--  <a href="https://www.imooc.com/u/6283182/bbs" title="${teacherPinglun.teacher.name }"> --%>
                      <img src="${pageContext.request.contextPath }/upload/${teacherPinglun.teacher.url }" width="40" height="40">
                      <span class="qa-comment-nick">${teacherPinglun.teacher.name }</span><!-- </a> -->
                  </div>
                  <div class="qa-comment-d ">
                    <!-- <div class="qa-triangle-left"><i></i></div> -->
                    <div class="qa-comment-inner">
                      <div class="qa-comment-c aimgPreview">
                        <div class="rich-text">
                        ${teacherPinglun.content }
                         </div>
                      </div>
                      <div class="qa-comment-addon">
                        <span class="qa-comment-time">${teacherPinglun.plTime }</span></div>
                    </div>
                  </div>
                </div>
                <div class="qa-reply">
                  <div class="qa-reply-header"></div>
                  <div class="qa-replies">
                    <div class="qa-reply-c">
                      <!-- <p class="qa-reply-loading">
                      加载中...
                      </p>  -->
                      <!-- 默认显示三条回复的回复 --></div>
                    <!-- 回复框 -->
                    <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">
                      <div class="qa-reply-iavator l js-header-avator">
                        <a href="https://www.imooc.com/u/7739457/id">
                          <img src="https://img1.mukewang.com/5458464a00013eb602200220-100-100.jpg" alt=""></a>
                      </div>
                      <div class="qa-reply-iwrap">
                        <div class="qa-reply-iarea">
                          <textarea name="" id="" class="js-reply-ipt-default ipt" placeholder="写下你的评论...">写下你的评论...</textarea></div>
                      </div>
                      <div class="qa-reply-ifoot clearfix">
                        <div class="qa-reply-footright r">
                          <div class="captcha-verify-box js-reply-verify-box hide"></div>
                          <span class="qa-tips"></span>
                          <button class="btn-normal btn-mini js-ipt-cancel">取消</button>
                          <button class="btn-mini btn-green  js-ipt-submit">提交</button></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
         </c:forEach>
              
           <!-- 学生的评论 -->
            <c:forEach items="${stuPingluns}" var="stuPinglun">
              <div class="qa-comment js-qa-comment" data-cid="478695" id="id_478695">
                <div class="qa-comment-wrap clearfix ">
                  <div class="qa-comment-author">
                  <%--   <a href="#" title="${stuPinglun.student.name }"> --%>
                      <img src="${pageContext.request.contextPath }/upload/${stuPinglun.student.url }" width="40" height="40">
                      <span class="qa-comment-nick">${stuPinglun.student.name }</span><!-- </a> -->
                  </div>
                  <div class="qa-comment-d ">
                    <!-- <div class="qa-triangle-left"><i></i></div> -->
                    <div class="qa-comment-inner">
                      <div class="qa-comment-c aimgPreview">
                        <div class="rich-text">
                        ${stuPinglun.content }
                         </div>
                      </div>
                      <div class="qa-comment-addon">
                        <span class="qa-comment-time">${stuPinglun.plTime }</span></div>
                    </div>
                  </div>
                </div>
                <div class="qa-reply">
                  <div class="qa-reply-header"></div>
                  <div class="qa-replies">
                    <div class="qa-reply-c">
                      <!-- <p class="qa-reply-loading">
                      加载中...
                      </p>  -->
                      <!-- 默认显示三条回复的回复 --></div>
                    <!-- 回复框 -->
                    <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">
                      <div class="qa-reply-iavator l js-header-avator">
                        <a href="https://www.imooc.com/u/7739457/id">
                          <img src="https://img1.mukewang.com/5458464a00013eb602200220-100-100.jpg" alt=""></a>
                      </div>
                      <div class="qa-reply-iwrap">
                        <div class="qa-reply-iarea">
                          <textarea name="" id="" class="js-reply-ipt-default ipt" placeholder="写下你的评论...">写下你的评论...</textarea></div>
                      </div>
                      <div class="qa-reply-ifoot clearfix">
                        <div class="qa-reply-footright r">
                          <div class="captcha-verify-box js-reply-verify-box hide"></div>
                          <span class="qa-tips"></span>
                          <button class="btn-normal btn-mini js-ipt-cancel">取消</button>
                          <button class="btn-mini btn-green  js-ipt-submit">提交</button></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
         </c:forEach>
           
           
           
           
              
            </div>
            <c:if test="${liuyan.state==0 }">
            <div id="js-qa-comment-input" class="qa-comment-input js-msg-context  clearfix">
              <!-- 插件-->
              <div id="editor" ></div>
              <div class=" text-right">
              	<button class="btn btn-success" type=button id="ok" style="margin-top:10px;">回答</button>
              </div>
           </div>
           </c:if>
          </div>
         
         
        </div> 
      </div>
   </div>
 </div> 
      
      
      <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
		
        editor.create()
        
        $("#ok").click(function(){
        	var content=$("#editor").text().replace(/^\s+|\s+$/g,"");
        	$.post("${pageContext.request.contextPath}/liuyan/addPinglun",{"content":content,"liuyanId":${liuyan.id}},function(result){
        		if(result=="200"){
        			window.location.href=window.location.href;
        		}
        	})
        	
        	
        });
    </script>
    <!-- 页脚-->
<footer class="footer navbar-fixed-bottom " style="background:#2A2D34">
    <div class="container">
    	<div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a> 版权所有 2019 （请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
    </div>
</footer>
  </body>
</html>