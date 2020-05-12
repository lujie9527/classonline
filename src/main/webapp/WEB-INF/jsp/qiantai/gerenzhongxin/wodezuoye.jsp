<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>table模块快速使用</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
</head>
<body>
 <!-- 返回的数据格式
	{
	"code": 0,
	"msg": "",
	"count": 1000,
	"data": [{
		"id": 10000,
		"username": "user-0",
		"sex": "女",
		"city": "城市-0",
		"sign": "签名-0",
		"experience": 255,
		"logins": 24,
		"wealth": 82830700,
		"classify": "作家",
		"score": 57
	}, {
		"id": 10001,
		"username": "user-1",
		"sex": "男",
		"city": "城市-1",
		"sign": "签名-1",
		"experience": 884,
		"logins": 58,
		"wealth": 64928690,
		"classify": "词人",
		"score": 27
	}, {
		"id": 10002,
		"username": "user-2",
		"sex": "女",
		"city": "城市-2",
		"sign": "签名-2",
		"experience": 650,
		"logins": 77,
		"wealth": 6298078,
		"classify": "酱油",
		"score": 31
	}, {
		"id": 10003,
		"username": "user-3",
		"sex": "女",
		"city": "城市-3",
		"sign": "签名-3",
		"experience": 362,
		"logins": 157,
		"wealth": 37117017,
		"classify": "诗人",
		"score": 68
	}]
}
 
 
 -->
<table id="demo" lay-filter="test"></table>
 
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
	function showContent(url){
		window.location.href="${pageContext.request.contextPath}/download/job?filename="+url;
	}
</script>
<script type="text/html" id="download">
     <div><a href='javascript:;' class="layui-btn layui-btn-danger layui-btn-xs" onclick=showContent('{{d.url}}') >查看作业</a></div>
</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 400
    ,url: '${pageContext.request.contextPath}/student/myjob' //数据接口
   /*  ,page: true */ //开启分页
    ,cols: [[ //表头
      {field: 'jobId', title: '编号', width:100, sort: true, fixed: 'left'}
      ,{field: 'jobName', title: '作业名称', width:200}
      ,{field: 'grade', title: '分数', width:100, sort: true}
      ,{field: 'pigaiTeacher', title: '批改老师', width:120} 
      ,{field: 'pigaiTime', title: '批改时间', width: 180,sort: true}
      ,{field: 'url', title: '操作', templet: '#download',width: 200}
    ]]
  });

});
</script>
</body>
</html>