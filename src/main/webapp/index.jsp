<%--
  Created by IntelliJ IDEA.
  User: zzzzzzzzzz
  Date: 2021/6/3
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("road",request.getContextPath());
%>
<script type="text/javascript" src="${road}/static/js/jquery-3.5.1.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="${road}/static/bootstrap-3.4.1-dist/css/bootstrap.css">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${road}/static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>

<%--<link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>--%>

<html>
<head>
    <title>员工列表</title>
</head>
<body>
<%--搭建显示页面，简单分别四行来显示--%>
<div class="container">
    <%--员工添加模糊框--%>
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="empName" class="form-control" id="empName_add" placeholder="张三">
                                    <span id="helpBlock1" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email_add" class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="email_add" placeholder="email@xxx.com">
                                    <span id="helpBlock2" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add" value="男" checked="checked">男
                                    </label>
                                    <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add" value="女">女
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">所在部门</label>
                                <div class="col-sm-4">
                                    <%--部门提交id即可--%>
                                    <select class="form-control" name="dId" id="dept_add_select">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn02_add_emp">添加用户</button>
                    </div>
                </div>
            </div>
        </div>
     <%--员工编辑模糊框--%>
     <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">员工编辑</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户姓名</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static" id="empName_update_static"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email_add" class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="email_update" placeholder="email@xxx.com">
                                    <span id="helpBlock02" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_update" value="男" checked="checked">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_update" value="女">女
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">所在部门</label>
                                <div class="col-sm-4">
                                    <%--部门提交id即可--%>
                                    <select class="form-control" name="dId" id="dept_update_select">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn_update_emp">更新用户</button>
                    </div>
                </div>
            </div>
        </div>
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-ITEM</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary" id="btn01_add_emp">新增</button>
            <button class="btn btn-danger" id="btn_delAll_emp">删除</button>
        </div>
    </div>
    <%--显示表格信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="checkbox"/>
                    </th>
                    <th>#id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>操作</th>
                </tr>
                <tbody></tbody>
                </thead>
            </table>
        </div>
    </div>
    <%--显示分页信息按钮--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="build_page_info">
            <h4></h4>
        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="build_page_msg">
        </div>
        <script type="text/javascript">
            var currentPage;
            //1.页面加载完成后，直接去发送一个ajax请求，要到分页数据
            $(function (){
                //第一次进来去第一页
               to_page(1)
            });
            function to_page(pn){
                $.ajax({
                    url:"${road}/emps",
                    data:"pn="+pn,
                    type:"get",
                    success:function (result){
                        //1.拿到数据后，解析并显示员工数据
                        build_emps_table(result);
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.解析显示分页条信息
                        build_page_msg(result);
                    }
                });
            };

            function build_emps_table(result){
                //每次去新的页面将之前的ajax数据清除
                $("#emps_table tbody").empty();
                var emps = result.extend.pageInfo.list;
                $.each(emps, function (index, item){
                    var checkBox = $("<td><input type='checkbox' class='check_item'/></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender);
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.department.deptName);
                    var editBtn = $("<button></button>").addClass("btn btn-success btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                        .append("编辑");
                    //给编辑按钮添加一个自定义属性，来获取当前栏的id
                    editBtn.attr("edit-id", item.empId);
                    var delBtn = $("<button></button>").addClass("btn btn-info btn-sm del_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                        .append("删除");
                    //给编辑按钮添加一个自定义属性，来获取当前栏的id
                    editBtn.attr("del-id", item.empId);
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    //使用jQuery添加显示员工信息的单元格
                    $("<tr></tr>").append(checkBox).append(empIdTd).append(empNameTd)
                    .append(genderTd).append(emailTd).append(deptNameTd)
                        .append(btnTd)
                    .appendTo("#emps_table tbody");
                });
            }
            //解析显示分页信息
            function build_page_info(result){
                //每次去新的页面将之前的ajax数据清除
                $("#build_page_info h4").empty();
                $("#build_page_info h4").append("当前"+result.extend.pageInfo.pageNum+ "页，总"
                    +result.extend.pageInfo.pages+"页，总共"
                    +result.extend.pageInfo.total+"记录")
                currentPage=result.extend.pageInfo.pageNum;
            }
            //解析分页条
            function build_page_msg(result){
                //每次去新的页面将之前的ajax数据清除
                $("#build_page_msg").empty();
                var ul=$("<ul></ul>").addClass("pagination");

                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if(result.extend.pageInfo.hasPreviousPage == false){
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }else {
                    firstPageLi.click(function (){
                        to_page(1);
                    });
                    prePageLi.click(function (){
                        to_page(result.extend.pageInfo.pageNum-1);
                    });
                }

                var lastPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                var nextPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                if(result.extend.pageInfo.hasNextPage == false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else {
                    lastPageLi.click(function (){
                        to_page(result.extend.pageInfo.pages);
                    });
                    nextPageLi.click(function (){
                        to_page(result.extend.pageInfo.pageNum+1);
                    });
                }

                //添加首页和前一页的的提示
                ul.append(firstPageLi).append(prePageLi);
                //遍历给ul添加页码提示
                $.each(result.extend.pageInfo.navigatepageNums, function (index, item){
                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if(result.extend.pageInfo.pageNum == item){
                        numLi.addClass("active")
                    }
                    numLi.click(function (){
                        to_page(item);
                    });
                    ul.append(numLi);
                });
                //添加下一页和末页的提示
                ul.append(nextPageLi).append(lastPageLi);
                //把ul加入到nav
                var navEle = $("<nav></nav>").append(ul);
                navEle.appendTo("#build_page_msg");
            }


            function reset_form(ele){
                //每次弹出模糊框对上一次的信息进行清除，和对错误信息的显示也重置
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }
            //给新增按钮添加单击事件
            $("#btn01_add_emp").click(function (){
                reset_form("#empAddModal form");
                //发送ajax请求，获取部门信息，显示在下拉列表中
                getDepts("#dept_add_select");
                $("#empAddModal").modal({
                    backdrop:"static"
                });
            });

            //查出所有部门信息
            function getDepts(ele){
                //每次去新的页面将之前的ajax数据清除
                $("#getDepts").empty();
                $.ajax({
                    url:"${road}/depts",
                    type:"get",
                    success:function (result){
                        //显示部门信息下拉列表

                        $.each(result.extend.depts, function (){
                            var optionDepts = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                            optionDepts.appendTo(ele);
                        });
                    }
                });
            }

            //专门进行校验的方法
            function validata_add_form(){
              //有两项需要校验，一是姓名而是邮箱,但我只校验邮箱
                var email = $("#email_add").val();
                var rightEmail = /^([a-zA-Z0-9]+[_|_|\-|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if(!rightEmail.test(email)){
                    show_validate_msg("#email_add", "error", "请输入正确的邮箱地址!");
                    return false;
                }else {
                    show_validate_msg("#email_add", "success", "格式正确！")
                }
                return true;

            };
            function show_validate_msg(ele, status, msg){
                //还是那句话清空之前的信息，让新消息显示
                $("#email_add").parent().removeClass("has-error has-success");
                $("#helpBlock2").text("");
                if("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);

                }else if("error"==status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }
            //点击添加用户按钮
            $("#btn02_add_emp").click(function (){
                //1.将模糊框填写的表单数据提交给服务器
                //2.对在框中数据进行校验,专门创建一个进行校验的方法
                if(!validata_add_form()){
                    return false;
                }
                //3.根据判断的用户名是否可用，可用才能进行接下来的添加
                if($(this).attr("ajax-va")=="error"){
                    return false;
                }

                //4.发送ajax请求保存员工
                var formStr = $("#empAddModal form").serialize();
                //decodeURIComponent对序列化的数据进行乱码解决
                var params = decodeURIComponent(formStr,true);
                $.ajax({
                    url:"${road}/emp",
                    type:"POST",
                    data: params,
                    success:function (result){
                        if(result.code == 3697){
                            //当员工保存成功时我们应该关闭模糊框、然后来到最后一页，看添加的信息
                            $("#empAddModal").modal('hide');
                            //由于我们用了mybatis的分页管理，对于跳转最后一页的操作，直接写个违规的数字，让其自己跳就好
                            to_page(99);
                        }else {
                            //失败以后，显示失败信息,没定义即是没错，定义了就是有错误信息
                            if(undefined != result.extend.errorFields.email){
                                show_validate_msg("#email_add", "error", result.extend.errorFields.email);
                            }

                            if(undefined != result.extend.errorFields.empName){
                                show_validate_msg("#empName_add", "error", result.extend.errorFields.empName);
                            }
                        }
                    }
                });
            });
            //给用户名做一个重复性校验，每次一改变数据内容就向数据库发送ajax请求对比用户名
            $("#empName_add").change(function (){
                var empName = this.value;
                $.ajax({
                    url:"${road}/checkEmpName",
                    data:"empName"+empName,
                    type:"get",
                    success:function (result){
                        if(result.code==3697){
                            show_validate_msg("#empName_add", "success", "用户名可用！");
                            $("#btn02_add_emp").attr("ajax-va", "success");
                        }else {
                            show_validate_msg("#empName_add", "success", "用户名不可用！");
                            $("#btn02_add_emp").attr("ajax-va", "error");
                        }
                    }
                });
            });

            //因为我们是创建按钮之前（按钮之所以创建的较慢，是因为它是跟随ajax请求完成以后一起创建的）
            //就绑定了click事件，所以是绑定不上的
            //我们使用on时间来绑定单击事件
            $(document).on("click", ".edit_btn",function (){
                //1.查出员工信息，显示这些
                getDepts("#empUpdateModal select")
                //2.与部门信息，显示
                getEmp($(this).attr("edit-id"));

                //将员工的id信息传递给更新按钮使用
                $("#btn_update_emp").attr("id", $(this).attr("edit-id"));
                $("#empUpdateModal").modal({
                   backdrop: "static"
                });

            });

            //查员工信息
            function getEmp(id){
                $.ajax({
                   url:"${road}/emp/"+id,
                    type:"get",
                    success:function (result){
                        var empData = result.extend.emp;
                        $("#empName_update_static").text(empData.empName);
                        $("#email_update").val(empData.email);
                        $("#empUpdateModal input[name=gender]").val([empData.gender]);
                        $("#empUpdateModal select").val([empData.dId]);
                    }
                });
            }

            //点击更新按钮修改员工信息
            $("#btn_update_emp").click(function (){
                //验证邮箱是否有效
                var email = $("#email_update").val();
                var rightEmail = /^([a-zA-Z0-9]+[_|_|\-|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if(!rightEmail.test(email)){
                    show_validate_msg("#email_update", "error", "请输入正确的邮箱地址!");
                    return false;
                }else {
                    show_validate_msg("#email_update", "success", "格式正确！")
                }
                //放松ajax请求，保存更新的员工
                var formStr = $("#empUpdateModal form").serialize();
                //decodeURIComponent对序列化的数据进行乱码解决
                var params = decodeURIComponent(formStr,true);
                $.ajax({
                    url:"${road}/emp/"+$(this).attr("id"),
                    type:"post",
                    data:params+"&_method=put",
                    success:function (){
                        //关闭对话框，回到本面
                        $("#empUpdateModal").modal("hide");
                        to_page(currentPage);
                    }
                });
            });

            //单个删除
            $(document).on("click", ".del_btn",function (){
                //拿到员工名
                var empName = $(this).parents("tr").find("td:eq(2)").text();
                //拿到员工id
                var empId = $(this).attr("del-id");
                if(confirm("确认删除【"+empName+"】吗？")){
                    //默认点击删除为true，我们就发送ajax请求
                    $.ajax({
                        url:"${road}/emp"+empId,
                        type:"delete",
                        success:function (result){
                            //回到本页
                            to_page(currentPage);
                        }
                    });
                }
            });

            //完成全选\全不选的功能
            $("#checkbox").click(function (){
                //全选框全选,原生属性的修改使用prop
                $(".check_item").prop("checked", $(this).prop("checked"))
            });

            //当每一栏的单选框都选上，全选的框也自动选上
            $(document).on("click", ".check_item", function (){
                //因为每一页有5栏 ，就判断是否5个都选上了没
                var flag = $(".check_item:checked").length==$(".check_item").length;
                //当flag判断为真时，当时的状态也为选中，所以给checked修改直接传入flag就好
                $("#checkbox").prop("checked", flag)
            });

            //给全部删除按钮绑定单击事件
            $("#btn_delAll_emp").click(function (){
                //给删除名字拼串
                var empNames = "";
                var empIds = "";
                $.each($(".check_item:checked"), function (){
                    //组装员工名字
                   empNames += $(this).parents("tr").find("td:eq(2)").text()+"、";
                   //组装员工id
                    empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";

                });
                //去除多余的、-
                empNames = empNames.substring(0, empNames.length-1);
                empIds = empIds.substring(0, empNames.length-1);
                if(confirm("确认删除【"+empNames+"】吗？")){
                    //默认确认删除为true，即发送ajax请求
                    $.ajax({
                        url:"${road}/emp/"+empIds,
                        type:"delete",
                        success:function (result){
                            alert(result.msg);
                            to_page(currentPage);
                        }
                    });
                }
            });
        </script>
    </div>
</div>
</body>
</html>
