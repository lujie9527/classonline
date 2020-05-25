<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>我的作业</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>

<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
    function showContent(url) {
        window.location.href = "${pageContext.request.contextPath}/download/job?filename=" + url;
    }
</script>
<script type="text/html" id="download">
    <div><a href='javascript:;' class="layui-btn layui-btn-danger layui-btn-xs"
            onclick=showContent('{{d.url}}')>查看作业</a></div>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            , height: 400
            , url: '${pageContext.request.contextPath}/student/myjob' //数据接口
            /*  ,util: true */ //开启分页
            , cols: [[ //表头
                {field: 'jobId', title: '编号', width: 100, sort: true, fixed: 'left'}
                , {field: 'jobName', title: '作业名称', width: 200}
                , {field: 'grade', title: '分数', width: 100, sort: true}
                , {field: 'pigaiTeacher', title: '批改老师', width: 120}
                , {field: 'pigaiTime', title: '批改时间', width: 180, sort: true}
                , {field: 'url', title: '操作', templet: '#download', width: 200}
            ]]
        });

    });
</script>
</body>
</html>