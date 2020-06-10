<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>留言解惑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8;"/>
    <meta http-equiv="“X-UA-Compatible”" content="“chrome=1″"/>
    <link type="text/css" rel="stylesheet" href="./css/jiaoxueshipin.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>
    <%--    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jiaoxueshipin.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/wangEditor-3.1.1/wangEditor.min.js"
            charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuo1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuo2.css" type="text/css">

    <style>
        .copyright p {
            height: 50px;
            font-size: 12px;
            color: #72757A;
            line-height: 53px;
            text-align: center;
        }

        .copyright p a {
            color: #72757A;
            text-decoration: none;
        }

        #main {
            min-height: 550px;
            padding: 20px 0
        }

        .course-info-main {
            margin-bottom: 0px
        }

        .clearfix:after {
            content: '\0020';
            display: block;
            height: 0;
            clear: both;
            visibility: hidden
        }
        .mod-qa-list .qa-medias {
            width:96px;
            overflow:hidden;
            text-align:center
        }
        .mod-qa-list .qa-footer {
            margin-top:12px;
            color:#93999f;
            font-size:12px!important
        }
        .mod-qa-list .qa-footer .static-count {
            font-size:16px;
            color:#93999f
        }
        .mod-qa-list .qa-header .qa-header-cnt .istop {
            color:#ff7e00;
            margin-right:5px
        }

        .w {
            max-width: 1152px;
            margin: 0 auto
        }
        .l {
            float:left
        }
        .r {
            float:right
        }

    </style>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

    <a class="navbar-brand " href="${pageContext.request.contextPath }">C++</a>

    <ul class="navbar-nav">

        <li class="nav-item active">
            <a class="nav-link " href="${pageContext.request.contextPath }">首页</a>
        </li>

        <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/notice/all">公告通知</a>
        </li>
        <!-- Dropdown -->
        <c:if test="${isStu==1}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">作业</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/all">提交作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/stuHomework">我的作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/sub/onlinehw">在线做题</a>
                </div>
            </li>
        </c:if>

        <c:if test="${isStu==2}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop3" data-toggle="dropdown">作业管理</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/teacher/show_fabu">发布作业</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/job/showJobList/">批改作业</a>
                </div>
            </li>
        </c:if>

        <c:if test="${isStu==2}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/sub/allSub">试题管理</a>
            </li>
        </c:if>

        <!-- Dropdown -->
        <c:if test="${isStu==1}">
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 资源中心 </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/doc/all">资料下载</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/video/all">教学视频</a>
                </div>
            </li>
        </c:if>

        <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/liuyan/all">留言答疑</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/gerenzhongxin/home" target="_blank">个人中心</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/index">后台管理</a>
        </li>

    </ul>

    <c:if test="${user==null}">
        <ul class="navbar-nav ml-auto" style="margin-right:70px;">
            <button type="button" class="btn btn-light"
                    onclick="window.location.href='${pageContext.request.contextPath }/toLogin'">登录
            </button>
        </ul>
    </c:if>
    <c:if test="${user!=null}">
        <ul class="navbar-nav ml-auto" style="margin-right:70px;">
            <button type="button" class="btn btn-light"
                    onclick="window.location.href='${pageContext.request.contextPath}/qiantai/loginOut'">退出
            </button>
        </ul>
    </c:if>
</nav>


<div class="container text-right">
    <%--        按钮右对齐--%>
    <c:if test="${isStu==1 }">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal"
                style="margin-top:5px;margin-bottom:5px;">我要留言
        </button>
    </c:if>
</div>
<div class="container justify-content-center">
    <div id="main">
        <!-- 课程面板 -->
        <div class="course-info-main clearfix w">
            <div class="content-wrap clearfix">
                <div class="content">
                    <c:forEach items="${pageInfo.list}" var="liuyan">
                        <div class="mod-qa-list clearfix">
                        <%--头像--%>
                            <div class="qa-medias l">
                                <img src="${pageContext.request.contextPath }/upload/${liuyan.student.url}"
                                     width="40" height="40">
                            </div>

                            <div class="wendaslider qa-content">
                                <h2 class="wendaquetitle qa-header">
                                    <div class="wendatitlecon qa-header-cnt clearfix">
                                        <a href="${pageContext.request.contextPath }/liuyan/id?id=${liuyan.id}"
                                           class="qa-tit">
                                            <i>${liuyan.title }</i>
                                        </a>
                                    </div>
                                </h2>
                                <div class="replymegfooter qa-footer clearfix">
                                    <div class="l-box l">
                                        <a href="${pageContext.request.contextPath }/liuyan/id?id=${liuyan.id}"
                                           class="replynumber static-count ">

                                            <span class="static-item answer">${liuyan.answer } 回答</span>
                                            <span class="static-item">${liuyan.student.name }</span>
                                        </a>
                                    </div>
                                    <em class="r">${liuyan.liuyanTime }</em>
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

<%--页码--%>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:if test="${pageInfo.size>0 }">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=1">首页</a>
            </li>
        </c:if>
<%--        上一页--%>
        <c:if test="${pageInfo.hasPreviousPage }">
            <li class="pages-item">
                <a class="pages-link"
                   href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pageNum-1}">&laquo;</a>
            </li>
        </c:if>

        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
<%--            罗列出页数--%>
            <c:if test="${pageInfo.pageNum ==page_num }">
                <li class="pages-item active">
                    <a class="pages-link"
                       href="${pageContext.request.contextPath }/liuyan/all?pageNum=${page_num }">${page_num }</a>
                </li>
            </c:if>
            <c:if test="${pageInfo.pageNum !=page_num }">
                <li class="pages-item">
                    <a class="pages-link"
                       href="${pageContext.request.contextPath }/liuyan/all?pageNum=${page_num }">${page_num}</a>
                </li>
            </c:if>
        </c:forEach>
<%--下一页--%>
        <c:if test="${pageInfo.hasNextPage }">
            <li class="pages-item">
                <a class="pages-link"
                   href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pageNum+1}">&raquo;</a>
            </li>
        </c:if>
<%--末页--%>
        <c:if test="${pageInfo.size>0}">
            <li class="pages-item">
                <a class="pages-link" href="${pageContext.request.contextPath }/liuyan/all?pageNum=${pageInfo.pages }">末页</a>
            </li>
        </c:if>
    </ul>
</div>


<br/>


<!-- 模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/liuyan/add" method="post">
                <!--  模态框主体 -->
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title">标题:</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="form-group">
                        <label for="editor">留言内容:</label>
                        <div id="editor"></div>
                        <textarea id="content" name="content" hidden="hidden"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="submit" id="ok" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )

    var $content = $('#content');

    editor.customConfig.onchange = function (html) {
        $content.val(html);
    };

    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload/tupian';

    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = 'myFileName';
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = result.data;
            insertImg(url);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    };
    editor.create();

    $content.val(editor.txt.html());


    <%--$("#ok").click(function () {--%>
    <%--    var title = $("#title").val().trim();//trim()去掉文字前的空格--%>
    <%--    if (title == "") {--%>
    <%--        alert("请填写标题");--%>
    <%--        return;--%>
    <%--    }--%>
    <%--    var content = $("#editor").text().replace(/^\s+|\s+$/g, "");--%>
    <%--    //将字符串里所有的空字符串全部替换成""空的--%>
    <%--    //\ 将下一个字符标注为特殊字符--%>
    <%--    //^ 匹配输入字符串的开始位置--%>
    <%--    //\s匹配任何空白的字符串，如果是 \S 则是非空白字符串--%>
    <%--    //匹配前面的表达式多次（多个空格）--%>
    <%--    //  |  或的意思--%>
    <%--    //   $  结束位置--%>
    <%--    $.post("${pageContext.request.contextPath}/liuyan/add", {--%>
    <%--        "title": title,--%>
    <%--        "content": content--%>
    <%--    }, function (result) {--%>
    <%--        if (result == "200") {--%>
    <%--            alert("提交成功");--%>
    <%--            window.location.href = "${pageContext.request.contextPath}/liuyan/all";--%>
    <%--        }--%>
    <%--    });--%>
    <%--})--%>
</script>
</body>
</html>
