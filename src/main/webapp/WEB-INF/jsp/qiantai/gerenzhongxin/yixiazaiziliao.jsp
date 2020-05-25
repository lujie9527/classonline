<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>已下载资料</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>
 
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 400
    ,url: '${pageContext.request.contextPath}/student/mydown' //数据接口
  /*   ,util: true */ //开启分页
    ,cols: [[ //表头
      {field: 'docName', title: '资料名称', width:150}
      ,{field: 'fileName', title: '资料文件名', width:200}
      ,{field: 'fileSize', title: '资料大小', width:150}
      ,{field: 'downloadTime', title: '下载时间', width:200} 
      ,{field: 'description', title: '资料描述', width: 350}
    ]]
  });
  
});
</script>
</body>
</html>