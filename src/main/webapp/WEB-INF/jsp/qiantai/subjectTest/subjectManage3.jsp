<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/29
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理试题</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        .demo {
            padding: 2em 0;
        }
        a:hover, a:focus {
            text-decoration: none;
            outline: none;
        }
        .tab .nav-tabs {
            border: none;
            border-bottom: 2px solid #079fc9;
            margin: 0;
        }
        .tab .nav-tabs li a {
            padding: 5px 5px;
            margin: 0 10px -1px 0;
            font-size: 17px;
            font-weight: 600;
            color: #293241;
            text-transform: uppercase;
            border: 2px solid #e6e5e1;
            border-bottom: none;
            border-radius: 5px 5px 0 0;
            z-index: 1;
            position: relative;
            transition: all 0.3s ease 0s;
        }
        .tab .nav-tabs li a:hover,  .tab .nav-tabs li.active a {
            background: #fff;
            color: #079fc9;
            border: 2px solid #079fc9;
            border-bottom-color: transparent;
        }
        .tab .nav-tabs li a:before {
            content: "";
            display: block;
            height: 2px;
            background: #fff;
            position: absolute;
            bottom: -2px;
            left: 0;
            right: 0;
            transform: scaleX(0);
            transition: all 0.3s ease-in-out 0s;
        }
        .tab .nav-tabs li.active a:before,  .tab .nav-tabs li a:hover:before {
            transform: scaleX(1);
        }
        .tab .tab-content {
            padding: 2px;
            font-size: 17px;
            color: #6f6f6f;
            line-height: 30px;
            letter-spacing: 1px;
            position: relative;
        }

        @media only screen and (max-width: 1280px) {
            .tab .nav-tabs {
                border: none;
            }
            .tab .nav-tabs li {
                width: 100%;
                text-align: center;
                margin-bottom: 15px;
            }
            .tab .nav-tabs li a {
                margin: 0;
                border-bottom: 2px solid transparent;
            }
            .tab .nav-tabs li a:before {
                content: "";
                width: 100%;
                height: 2px;
                background: #079fc9;
                position: absolute;
                bottom: -2px;
                left: 0;
            }
        }
    </style>
</head>

<body>

<div class="demo">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="tab" role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">管理试题</a>
                        </li>
                        <li role="presentation">
                            <a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">新增试题</a>
                        </li>
                        <li role="presentation">
                            <a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab">查询试题</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content tabs">
                        <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                            <h3>管理试题</h3>

                            <table class="table table-striped table-hover">

                                <tr>

                                    <td>
                                        <form action="${pageContext.request.contextPath}/sub/allSub">
                                            <thead align="center">
                                            <tr>
                                                <th>试题编号</th>
                                                <th>试题标题</th>
                                                <th>正确答案</th>
                                                <th>查看试题</th>
                                                <th>更新试题</th>
                                                <th>删除试题</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${manageSubList}" var="subject">
                                            <tr align="center">
                                                <td>${subject.subjectId}</td>
                                                <td align="left" width="800px">${subject.subjectTitle}</td>
                                                <td>${subject.subjectAnswer}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/sub/subShow?subjectId=${subject.subjectId}">查看</a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/sub/subUpdate?subjectId=${subject.subjectId}">修改</a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/sub/subDelete?subjectId=${subject.subjectId}">删除</a>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </form>

                                        </tbody>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section2">
                            <h3>新增试题</h3>


                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section3">
                            <h3>查询试题</h3>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

</body>
</html>
