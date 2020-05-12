<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
      <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script> 
      <script type="text/javascript">
      	$(function(){
			$("#loginOut").click(function(){
				if(window.confirm("您确定要退出吗?")){
				window.location.href="${pageContext.request.contextPath}/qiantai/loginOut";
				}
			})
	});
      </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">网络教学系统---个人中心</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                欢迎您，${user.name }
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0);" id="loginOut">安全退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧垂直导航区域-->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
					<a href="javascript:;" data-id="1" data-title="个人信息" data-url="${pageContext.request.contextPath }/gerenzhongxin/teacher/gerenxinxi"
                               class="site-demo-active" data-type="tabAdd">个人信息</a>
                </li>
				<li class="layui-nav-item">
					<a href="javascript:;" data-id="2" data-title="上传资料" data-url="${pageContext.request.contextPath }/gerenzhongxin/teacher/doc"
                               class="site-demo-active" data-type="tabAdd">上传资料</a>
				</li>
				<li class="layui-nav-item">
					<a href="javascript:;" data-id="3" data-title="上传教学视频" data-url="${pageContext.request.contextPath }/gerenzhongxin/teacher/video"
                               class="site-demo-active" data-type="tabAdd">上传教学视频</a>
				</li> 
            </ul>
        </div>
    </div>

    <!--tab标签-->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <ul class="layui-tab-title"></ul>
        <div class="layui-tab-content"></div>
    </div>

<div class="layui-footer" style="text-align:center;">
    <!-- 底部固定区域 -->
    网络教学系统 --- 个人中心
</div>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
		
		    layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;
        var $ = layui.$;
        // 配置tab实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };
        function FrameWH() {
            var h = $(window).height();
            $("iframe").css("height",h+"px");
        }
    });
	
		
</script>
</body>
</html>