<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${liuyan.title }留言解惑详情</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/liuyanjiehuoxiangqin.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/wangEditor-3.1.1/wangEditor.min.js"></script>
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
        .rich-text {
            line-height: 1.76em;
            font-size: 14px
        }

    </style>
</head>
<body style=" background-color:#FFF">
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

<div class="container justify-content-center">
    <div id="main">
        <div class="qa-left l">
            <div class="qa-left-wrap">
                <div class="qa-header">
                    <img src="${pageContext.request.contextPath }/upload/${liuyan.student.url}"
                         style="border-radius: 50%" width="40" height="40">${liuyan.student.name }
                </div>
                <div class="qa-content">
                    <div class="qa-content-inner">
                        <div id="js-content-main">
                            <h1 class="js-qa-wenda-title qa-wenda-title">${liuyan.title }</h1>
                            <div id="js-qa-content" class="qa-disscus rich-text">
                                <p>${liuyan.content }</p>
                            </div>
                        </div>
                    </div>
                    <div class="qa-content-addon clearfix">
                        <span class="qa-createtime l">${liuyan.liuyanTime }</span>

                        <span class="qa-total-comment r">${liuyan.answer } 回答</span>
                    </div>
                </div>
                <div class="qa-comments">
                    <!--  老师的评论 -->
                    <c:forEach items="${teacherPingluns}" var="teacherPinglun">
                        <div class="qa-comment js-qa-comment">
                            <div class="qa-comment-wrap clearfix ">
                                <div class="qa-comment-author">

                                    <img src="${pageContext.request.contextPath }/upload/${teacherPinglun.teacher.url }"
                                         width="40" height="40">
                                    <span class="qa-comment-nick">${teacherPinglun.teacher.name }</span>
                                </div>
                                <div class="qa-comment-d ">
                                    <div class="qa-comment-inner">
                                        <div class="qa-comment-c aimgPreview">
                                            <div class="rich-text">${teacherPinglun.content }</div>
                                        </div>
                                        <div class="qa-comment-addon">
                                            <span class="qa-comment-time">${teacherPinglun.plTime }</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
<%--                            <div class="qa-reply">--%>
<%--                                <div class="qa-replies">--%>
                                    <!-- 回复框 -->
<%--                                    <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">--%>
<%--                                        <div class="qa-reply-iavator l js-header-avator">--%>
<%--                                            <a href="https://www.imooc.com/u/7739457/id">--%>
<%--                                                <img src="https://img1.mukewang.com/5458464a00013eb602200220-100-100.jpg"--%>
<%--                                                     alt=""></a>--%>
<%--                                        </div>--%>
<%--                                        <div class="qa-reply-iwrap">--%>
<%--                                            <div class="qa-reply-iarea">--%>
<%--                                                <textarea name="" id="" class="js-reply-ipt-default ipt"--%>
<%--                                                          placeholder="写下你的评论...">写下你的评论...</textarea></div>--%>
<%--                                        </div>--%>
<%--                                        <div class="qa-reply-ifoot clearfix">--%>
<%--                                            <div class="qa-reply-footright r">--%>
<%--                                                <div class="captcha-verify-box js-reply-verify-box hide"></div>--%>
<%--                                                <span class="qa-tips"></span>--%>
<%--                                                <button class="btn-normal btn-mini js-ipt-cancel">取消</button>--%>
<%--                                                <button class="btn-mini btn-green  js-ipt-submit">提交</button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                    </c:forEach>

                    <!-- 学生的评论 -->
                    <c:forEach items="${stuPingluns}" var="stuPinglun">
                        <div class="qa-comment js-qa-comment" data-cid="478695" id="id_478695">
                            <div class="qa-comment-wrap clearfix ">
                                <div class="qa-comment-author">

                                    <img src="${pageContext.request.contextPath }/upload/${stuPinglun.student.url }"
                                         width="40" height="40">
                                    <span class="qa-comment-nick">${stuPinglun.student.name }</span>
                                </div>
                                <div class="qa-comment-d ">

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
<%--                            <div class="qa-reply">--%>
<%--                                <div class="qa-replies">--%>
<%--                                    <!-- 回复框 -->--%>
<%--                                    <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">--%>
<%--                                        <div class="qa-reply-iavator l js-header-avator">--%>
<%--                                            <a href="https://www.imooc.com/u/7739457/id">--%>
<%--                                                <img src="https://img1.mukewang.com/5458464a00013eb602200220-100-100.jpg"--%>
<%--                                                     alt=""></a>--%>
<%--                                        </div>--%>
<%--                                        <div class="qa-reply-iwrap">--%>
<%--                                            <div class="qa-reply-iarea">--%>
<%--                                                <textarea name="" id="1" class="js-reply-ipt-default ipt"--%>
<%--                                                          placeholder="写下你的评论...">写下你的评论...</textarea></div>--%>
<%--                                        </div>--%>
<%--                                        <div class="qa-reply-ifoot clearfix">--%>
<%--                                            <div class="qa-reply-footright r">--%>
<%--                                                <div class="captcha-verify-box js-reply-verify-box hide"></div>--%>
<%--                                                <span class="qa-tips"></span>--%>
<%--                                                <button class="btn-normal btn-mini js-ipt-cancel">取消</button>--%>
<%--                                                <button class="btn-mini btn-green  js-ipt-submit">提交</button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                    </c:forEach>
                </div>
                <form action="${pageContext.request.contextPath}/liuyan/addPinglun?liuyanId=${liuyan.id}" method="post">
                    <div id="js-qa-comment-input" class="qa-comment-input js-msg-context  clearfix">
                        <div id="editor"></div>
                        <textarea id="content" name="content" hidden="hidden"></textarea>
                        <div class=" text-right">
                            <button class="btn btn-success" type=submit id="ok" name="ok" style="margin-top:10px;">回答</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    var content = $('#content');

    editor.customConfig.onchange = function (html) {
        content.val(html);
    };

    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload/tupian';

    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024; //图片大小限制3M
    editor.customConfig.uploadImgMaxLength = 5; //最多同时上传5张图片
    editor.customConfig.uploadFileName = 'myFileName'; //文件上传的参数名称
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

    content.val(editor.txt.html());
    $("button[name='ok']").click(function () {
        alert("回复成功！");
    });


    <%--$("#ok").click(function () {--%>

    <%--    var content = $("#editor").text().replace(/^\s+|\s+$/g, "");--%>
    <%--    if (content==""){--%>
    <%--        alert("你还没有输入内容呢");--%>
    <%--    }else{--%>
    <%--        $.post("${pageContext.request.contextPath}/liuyan/addPinglun", {--%>
    <%--            "content": content,--%>
    <%--            "liuyanId":${liuyan.id}--%>
    <%--        }, function (result) {--%>
    <%--            if (result == "200") {--%>
    <%--                window.location.href = window.location.href;--%>
    <%--            }--%>
    <%--        })--%>
    <%--    }--%>

    <%--});--%>
</script>

</body>
</html>