<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
  <title>留言解惑</title> 
  <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8;" /> 
  <meta http-equiv="“X-UA-Compatible”" content="“chrome=1″" /> 
  <link type="text/css" rel="stylesheet" href="./css/jiaoxueshipin.css" /> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jiaoxueshipin.js"></script> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" /> 
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script> 
   <script type="text/javascript" src="${pageContext.request.contextPath }/wangEditor-3.1.1/wangEditor.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuo1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuo2.css" type="text/css">
   
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

<div class="container text-right">
	<c:if test="${isStu==1 }">
		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="margin-top:5px;margin-bottom:5px;">我要留言</button>
	</c:if>
</div>
 <div class="container justify-content-center">
 	 <div id="main">
   <!-- 课程面板 -->
      <div class="course-info-main clearfix w">
        <div class="content-wrap clearfix">
          <div class="content">
            <div class="answertabcon">
            
            <c:forEach items="${pageInfo.list}" var="liuyan">
              <div class="course_quescon">
               		<div class="wenda-listcon mod-qa-list clearfix">
                  <div class="icon-wenda"></div>
                  <div class="headslider qa-medias l">
                   <!--  <a href="https://www.imooc.com/u/2629234/courses" class="media" target="_blank" title="Harryzhicheng"> -->
                      <img src="${pageContext.request.contextPath }/upload/${liuyan.student.url}" width="40" height="40">
                  </div>
                  <div class="wendaslider qa-content">
                    <h2 class="wendaquetitle qa-header">
                      <div class="wendatitlecon qa-header-cnt clearfix">
                        <a href="${pageContext.request.contextPath }/liuyan/id/${liuyan.id}"  class="qa-tit">
                          <i>${liuyan.title }</i>
                        </a>
                      </div>
                    </h2>
                    
                    <div class="replycont qa-body clearfix">
                      <!-- <div class="l replydes">
                        <span class="replysign">最新回答 /
                          <a href="https://www.imooc.com/u/1144105/courses" target="_blank" title="K__Y" class="nickname">K__Y</a></span>
                        <div class="replydet">默认自动生成的，src是用来放代码的</div></div> -->
                    </div>
                    <div class="replymegfooter qa-footer clearfix">
                      <div class="l-box l">
                        <a href="${pageContext.request.contextPath }/liuyan/id/${liuyan.id}"  class="replynumber static-count "> 
                          <span class="static-item answer">${liuyan.answer } 回答</span>
                          <span class="static-item">${liuyan.student.name }</span></a> 
                          
                          <span class="static-item"><c:if test="${liuyan.state==0 }">未解决</c:if><c:if test="${liuyan.state!=0 }">已解决</c:if></span> 
                       <!--  <a href="https://www.imooc.com/video/16844" target="_blank">2-1 环境搭建及IDE安装</a> --></div>
                      <em class="r">${liuyan.liuyanTime }</em>
                    </div>
                  </div>
                </div>
              </div>
              
             </c:forEach>
                 <!-- 2-->      
                 
                 
                
              </div>
            </div>
          </div>
        </div>
     </div>
   </div>
</div>
<br/>
<div class="container">
 <ul class="pagination justify-content-center">
   <c:if test="${pageInfo.size>0 }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=1">首页</a></li> 
    	</c:if>
    	<c:if test="${pageInfo.hasPreviousPage }">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pageNum-1}">&laquo;</a></li> 
    	</c:if>
     
     	<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
     		<c:if test="${pageInfo.pageNum ==page_num }">
     			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${page_num }">${page_num }</a></li> 
     		</c:if>
     		<c:if test="${pageInfo.pageNum !=page_num }">
     			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${page_num }">${page_num}</a></li> 
     		</c:if>
     	</c:forEach>
     
      <c:if test="${pageInfo.hasNextPage }">
    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pageNum+1}">&raquo;</a></li> 
    </c:if>
    
    <c:if test="${pageInfo.size>0}">
    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pages }">末页</a></li> 
    	</c:if>
  </ul>
</div>


<br/>
<!-- 页脚-->
<footer class="footer navbar-fixed-bottom " style="background:#2A2D34">
    <div class="container">
    	<div class="copyright">
                        <p ><a href="http://www.gdupt.edu.cn" target="_blank"> 广东石油化工学院</a> &nbsp;版权所有 2019 &nbsp;（请使用1280*1024分辨率，IE8或更高版本浏览器访问本系统）</p>
                </div>
    </div>
</footer>



<!-- 模态框 -->
 <div class="modal fade" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
 	<form action="" method="post">
     <!--  模态框主体 -->
      <div class="modal-body">
    		<div class="form-group">
      			<label for="usr">标题:</label>
      			<input type="text" class="form-control" id="title" name="title">
    		</div>
    		<div class="form-group">
      			<label for="editor">留言内容:</label>
      			<div id="editor"></div>
    		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
          <button type="button" id="ok" class="btn btn-primary">提交</button>
      </div>
 </form>
    </div>
  </div>
</div> 
 <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
		
        editor.create()
        
        
        	$("#ok").click(function(){
        		var title=$("#title").val().trim();
        		if(title==""){
        			alert("请填写标题");
        			return;
        		}
        		var content=$("#editor").text().replace(/^\s+|\s+$/g,"");;
        		 $.post("${pageContext.request.contextPath}/liuyan/add",{"title":title,"content":content},function(result){
        			if(result=="200"){
        				alert("提交成功");
        				window.location.href="${pageContext.request.contextPath}/liuyan/all";
        			}
        		}); 
        	
        	})
        
    </script>
 </body>
</html>
