<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/6/9
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-end">
        <form action="${pageContext.request.contextPath }/job/getAllJob">
            <div class="form-inline">
                <label>查询到<span style="color:#f00">${pageInfo.total}</span>条记录</label>&nbsp;&nbsp;
                <input type="text" class="form-control" id="keyWord" name="keyWord" value="${keyWord }"/>
                <button type="submit" class="btn btn-info">查询</button>
            </div>
        </form>
    </div>
</div>

<br/>

<div class="container">
    <table class="table table-responsive" style="margin-left: 25%">
        <thead>
        <tr>
            <th style="text-align: center">作业编号</th>
            <th style="text-align: center">作业标题</th>
            <th style="text-align: center">专业</th>
            <th style="text-align: center">班级</th>
            <th style="text-align: center">发布时间</th>
            <th style="text-align: center">截止时间</th>
            <th style="text-align: center">做题</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${pageInfo.list}" var="job">
            <tr>
                <td style="text-align: center">${job.id}</td>
                <td>${job.jobTitle}</td>
                <td style="text-align: center">${job.profession.name}</td>
                <td style="text-align: center">${job.banji.name}</td>
                <td style="text-align: center">${job.uploadTime}</td>
                <td style="text-align: center">${job.lastTime}</td>
                <td><a href="${pageContext.request.contextPath}/job/doJob?jobId=${job.id}">进入做题</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<br/>

<div class="container">
    <ul class="pagination justify-content-end">
        <c:if test="${pageInfo.size>0 }">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/job/getAllJob?pageNum=1&keyWord=${keyWord}">首页</a>
            </li>
        </c:if>
        <c:if test="${pageInfo.hasPreviousPage }">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/notice/getAllJob?pageNum=${pageInfo.pageNum-1}&keyWord=${keyWord}">&laquo;</a>
            </li>
        </c:if>

        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
            <c:if test="${pageInfo.pageNum ==page_num }">
                <li class="pages-item active">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/getAllJob?pageNum=${page_num }&keyWord=${keyWord}">${page_num }</a>
                </li>
            </c:if>
            <c:if test="${pageInfo.pageNum !=page_num }">
                <li class="pages-item">
                    <a class="pages-link" href="${pageContext.request.contextPath }/notice/getAllJob?pageNum=${page_num }&keyWord=${keyWord}">${page_num}</a>
                </li>
            </c:if>
        </c:forEach>

        <c:if test="${pageInfo.hasNextPage }">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/notice/getAllJob?pageNum=${pageInfo.pageNum+1}&keyWord=${keyWord}">&raquo;</a>
            </li>
        </c:if>

        <c:if test="${pageInfo.size>0}">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/notice/getAllJob?pageNum=${pageInfo.pages }&keyWord=${keyWord}">末页</a>
            </li>
        </c:if>
    </ul>
</div>
</body>
</html>
