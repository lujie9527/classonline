<%--
  Created by IntelliJ IDEA.
  User: 11192
  Date: 2020/5/25
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>老师管理试题</title>


    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/demo/demo.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js" charset="utf-8"></script>


    <script type="text/javascript">


        function doAdd() {
            //在添加之前把数据清空

            $('#subjectForm').form('clear');
            // $("#subjectId").val("");
            // $("#subjectTitle").val("");
            // $("#subjectOptionA").val("");
            // $("#subjectOptionB").val("");
            // $("#subjectOptionC").val("");
            // $("#subjectOptionD").val("");
            // $("#subjectOptionAnswer").val("");
            // $("#subjectOptionParse").val("");
            //将添加窗口打开
            // $("#subjecId").removeAttr("readonly");
            $("#biaoti").hide();
            $('#addsubjectWindow').window("open");
        }

        //删除操作
        function doDelete() {
            //获取多行数据
            var array = $("#grid").datagrid('getSelections');
            if (array.length == 0) {
                //一行也没选
                $.messager.alert('警告', '请选择你要删除的数据', 'warning');
                return;
            }
            $.messager.confirm('提示', '你确定要删除吗?', function (r) {
                if (r) {
                    var ids = [];
                    $.each(array, function (index, item) {
                        ids.push(item.subjectId);
                    });
                    //ajax提交数组参数，必须序列号
                    console.log(ids);
                    $.post("${pageContext.request.contextPath}/admin/subject/delete", {"ids": ids}, function (data) {
                        if (data == "200") {
                            location.href = "${pageContext.request.contextPath}/admin/subject/list";

                        }
                    });
                }
            });
        }

        // 修改 收货标准数据，双击修改，修改必须有id（隐藏)
        function doDblClickRow(rowIndex, rowData) {
            //将添加窗口弹出
            $("#isUpdate").val("1");
            $("#biaoti").hide();
            $("#addsubjectWindow").panel({
                title: "修改题目信息"
            });
            $("#addsubjectWindow").window('open');

            //将数据回显,查看easyui的帮助文档
            $("#subjectId").val(rowData.subjectId);
            $("#subjectId").attr("readonly", "readonly");
            $("#biaoti").show();
            $("#subjectTitle").val(rowData.subjectTitle);
            $("#subjectOptionA").val(rowData.subjectOptionA);
            $("#subjectOptionB").val(rowData.subjectOptionB);
            $("#subjectOptionC").val(rowData.subjectOptionC);
            $("#subjectOptionD").val(rowData.subjectOptionD);
            $("#subjectAnswer").val(rowData.subjectAnswer);
            $("#subjectParse").val(rowData.subjectParse);

            // $("#subjectId").show();
        }

        //工具栏
        var toolbar = [
            {
                id: 'button-add',
                text: '增加',
                iconCls: 'icon-add',
                handler: doAdd
            }, {
                id: 'button-delete',
                text: '删除',
                iconCls: 'icon-cancel',
                handler: doDelete
            }, {
                id: 'button-edit',
                text: '修改',
                iconCls: 'icon-edit',
                handler:doDblClickRow
             }
            ];
        // 定义列
        var columns = [[{
            field: 'f',
            checkbox: true
        }, {
            field: 'subjectId',
            title: '题目编号',
            width: 80,
            align: 'center'
        }, {
            field: 'subjectTitle',
            title: '题目标题',
            width: 400,
            align: 'left'
        }, {
            field: 'subjectOptionA',
            title: '选项A',
            width:  200,
            align: 'left'

        }, {
            field: 'subjectOptionB',
            title: '选项B',
            width: 200,
            align: 'left'
        },{
            field: 'subjectOptionC',
            title: '选项C',
            width: 200,
            align: 'left'
        },
            {
                field: 'subjectOptionD',
                title: '选项D',
                width: 200,
                align: 'left'
            },{
                field: 'subjectAnswer',
                title: '选项答案',
                width: 80,
                align: 'center'
            },{
                field: 'subjectParse',
                title: '答案解析',
                width: 300,
                align: 'left'
            }
        ]];

        $(function () {
            // 先将body隐藏，再显示，不会出现页面刷新效果
            $("body").css({visibility: "visible"});

            $("body").delegate('#job', 'change', function(){
                var formData= new FormData();
                var file =$("#job")[0].files[0];
                formData.append("job",file);
                $.ajax({
                    url : '${pageContext.request.contextPath}/upload/job',
                    data : formData,
                    type : "POST",
                    contentType : false, //上传文件要设置成false
                    processData : false,
                    success : function(result) {
                        $("#url").val(result);
                    }
                });
            });


            $('#subjectId').combobox({
                url: '${pageContext.request.contextPath}/admin/subject/list/json',
                valueField: 'subjectId',
                textField: 'subjectTitle',
                onSelect: function (rec) {
                }
            });


           $('#grid').datagrid({
                iconCls: 'icon-forward',
                fit: true,
                border: false,
                rownumbers: true,
                striped: true,
                nowarp:false,  //当表格中某一行的一个列内容较多时，就会自动折行（换下一行显示）
                /* pageList: [5,10,30], */
                //pagination : true,
                toolbar: toolbar,
                url: "${pageContext.request.contextPath}/admin/subject/list/json",
                idField: 'subjectId',
                columns: columns,
                onDblClickRow: doDblClickRow
            });

            // 添加窗口
            $('#addsubjectWindow').window({
                title: '添加题目信息',
                width: 400,
                modal: true,
                shadow: true,
                closed: true,
                height: 350,
                resizable: false
            });

            $('#editsubjectWindow').window({
                title: '修改题目信息',
                width: 400,
                modal: true,
                shadow: true,
                closed: true,
                height: 350,
                resizable: false
            })

        });


        //提交表单
        function commitsubjectForm() {

            $("#subjectForm").submit();

        }

    </script>


</head>
<body class="easyui-layout" style="visibility:hidden;">
<form id="delBacth"  method="post">
    <div region="center" border="false">
        <table id="grid">
            <input type="hidden" name="id" value="id">
        </table>
    </div>
</form>

<div class="easyui-window" title="添加新题目" id="addsubjectWindow" collapsible="false" minimizable="false" maximizable="false">
    <div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
        <div class="datagrid-toolbar">
            <a id="save" icon="icon-save" href="javascript:commitsubjectForm();" class="easyui-linkbutton"  plain="true" >保存</a>
        </div>
    </div>
    <div region="center" style="overflow:auto;padding:5px;" border="false">
        <form id="subjectForm" action="${pageContext.request.contextPath }/admin/subject/addSub" method="post">
            <input type="hidden" id="isUpdate" name="isUpdate">
            <table class="table-edit" width="100%" align="center">
                <tr class="title1">
                    <td colspan="2">题目信息</td>
                </tr>
                <tr id="biaoti">
                    <td>题目编号</td>
                    <td><input id="subjectId" type="text" name="subjectId" class="easyui-validatebox" required="true" /></td>
                </tr>
                <tr>
                    <td>题目标题</td>
                    <td><input id="subjectTitle" type="text" name="subjectTitle" class="easyui-validatebox" required="true" /></td>
                </tr>
                <tr>
                    <td>选项A</td>
                    <td><input id="subjectOptionA" type="text" name="subjectOptionA" class="easyui-validatebox"  /></td>
                </tr>
                <tr>
                    <td>选项B</td>
                    <td><input id="subjectOptionB" type="text" name="subjectOptionB" class="easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td>选项C</td>
                    <td><input id="subjectOptionC" type="text" name="subjectOptionC" class="easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td>选项D</td>
                    <td><input id="subjectOptionD" type="text" name="subjectOptionD" class="easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td>答案</td>
                    <td><input id="subjectAnswer" type="text" name="subjectAnswer" class="easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td>解析</td>
                    <td><input id="subjectParse" type="text" name="subjectParse" class="easyui-validatebox" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
