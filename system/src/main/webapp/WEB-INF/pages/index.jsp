<%@ page import="com.gg.Bean.User" %>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Administrator--%>
<%--  Date: 2019/7/18--%>
<%--  Time: 17:06--%>
<%--  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://www.layuicdn.com/layui/layui.js"></script>

<%--    bootstrap--%>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <script src="https://cdn.bootcss.com/jquery/3.4.1/core.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script  src="https://echarts.baidu.com/dist/echarts.js"></script>
</head>
<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo ">签到时间权限管理系统</div>
        <ul class="layui-nav layui-layout-left" role="tablist">

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#infoModal" id="info_modal">基本资料</a></dd>
                    <dd><a href="#pwdModal" id="pwd_modal">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="destory">退出</a></li>
        </ul>
    </div>



    <div class="row" >
        <div class="col-md-2">

                <ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed" style="padding-top:30%">
                        <a href="#situation" aria-controls="situation" data-toggle="tab">本周签到情况</a>

                    </li>
<%--                    <li class="layui-nav-item"><a href="#rank" aria-controls="rank" role="tab" data-toggle="tab">本周签到时间排名</a></li>--%>
                    <li class="layui-nav-item"><a href="#awards" aria-controls="awards" role="tab" data-toggle="tab">个人奖项</a></li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">管理员</a>
                        <dl class="layui-nav-child">
                            <dd><a href="#sign_admin"  aria-controls="sign_admin" role="tab" data-toggle="tab">签到管理</a></dd>
                            <dd><a href="#awarad_admin" aria-controls="awarad_admin" role="tab" data-toggle="tab">奖项管理</a></dd>
                        </dl>
                    </li>
                </ul>

        </div>

<%--1--%>
    <div class="container tab-content col-md-10" style="margin-top: 5%"  >
        <!-- 内容主体区域 -->
<%--        按钮--%>
        <div role="tabpanel" class="tab-pane" id="sign_admin" href="user/info" >
        <div class="row">
            <div class="col-md-4 col-md-offset-10">
                <button type="button" class="btn btn-info btn-default" id="add_modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                    添加
                </button>
                <button type="button" class="btn btn-danger btn-default" id="deleteAll">
                    <span class="glyphicon glyphicon-trash"></span>
                    删除
                </button>
            </div>
        </div>
<%--        表格--%>
        <div class="row col-lg-12" style="padding: 15px;" >
            <div class="col-lg-12">
                <table class="table table-hover" id="info_table" >
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll"></th>
                            <th class="text-center">ID</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">学号</th>
                            <th class="text-center">本周签到时间(小时)</th>
                            <th class="text-center">本周签到排名</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
<%--        页数--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4" id="nav"></div>
        </div>
        </div>
<%--   本周签到情况     --%>
        <div role="tabpanel" class="tab-pane active" id="situation" >
                <div  id="view" style="height: 60%;width: 80%">

                </div>
        </div>
<%--    本周签到排名    --%>
        <div role="tabpanel" class="tab-pane" id="rank" ></div>
<%--     个人奖项   --%>
        <div role="tabpanel" class="tab-pane" id="awards" >
            <!-- 内容主体区域  表单内容 -->
            <form class="layui-form goodsAddForm" enctype="multipart/form-data" >
                    <div class="layui-form-item">
                        <div class="layui-form-item">
                        <label class="layui-form-label">图片上传</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="test1">
                                <i class="layui-icon">&#xe67c;</i>选择图片（最多选择20张，单张图片最大为10M）
                            </button>
                            <button type="button" class="layui-btn" id="test9">开始上传</button>
                            <button type="button" class="layui-btn" id="cleanImgs"> <i class="fa fa-trash-o fa-lg"></i>清空图片预览</button>
                        </div>
                        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                            预览图：
                            <div class="layui-upload-list" id="demo2"></div>
                        </blockquote>
                    </div>
                    </div>
                    
                    <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
                   
            </form>

        </div>
<%--        奖项管理--%>
        <div role="tabpanel" class="tab-pane" id="awarad_admin" >奖项管理</div>

<%--        信息添加模态框--%>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 15%">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">添加</h4>
                    </div>
                    <div class="modal-body">
<%--                        信息添加模态框--%>
<%--                        姓名--%>
                        <form >
                            <div class="row" style="padding-top: 10px;padding-left: 10px">
                                <div class="col-md-2">
                                    <span>姓名</span>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="name">
                                </div>
                            </div>
    <%--                        学号--%>
                            <div class="row" style="padding-top: 10px;padding-left: 10px">
                                <div class="col-md-2">
                                    <span>学号</span>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="user_id">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="add_btn">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
<%--        个人信息模态框--%>
        <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 15%">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">个人信息</h4>
                    </div>
                    <div class="modal-body">
<%--                        姓名--%>
                        <div class="row">
                            <div class="col-md-12" >
                                <div class="col-md-4" style="padding-left: 20px">
                                    <label>姓名:</label>
                                </div>
                                <div class="col-md-4" id="name" >

                                </div>
                            </div>
                        </div>
<%--                        学号--%>
                        <div class="row" >
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-left: 20px">
                                    <label>学号:</label>
                                </div>
                                <div class="col-md-4" id="user_id" >

                                </div>
                            </div>
                        </div>
<%--                        本周签到时间--%>
                        <div class="row" >
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-left: 20px">
                                    <label>本周签到时间:</label>
                                </div>
                                <div class="col-md-4" id="sign_in_time">

                                </div>
                            </div>
                        </div>
<%--                        本周签到排名--%>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-left: 20px">
                                    <label>签到排名:</label>
                                </div>
                                <div class="col-md-4" id="ran">

                                </div>
                            </div>
                        </div>
<%--                        个人奖项--%>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-left: 20px">
                                    <label>奖项:</label>
                                </div>
                                <div class="col-md-4" >
                                    <p class="text-center">暂无</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 编辑 -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 15%">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--data-dismiss="modal" aria-label="Close"--%>
                        <button type="button" class="close"  id="editClose"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">编辑</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <%--姓名 --%>
                            <div class="row">
                                <div class="col-md-12" >
                                    <div class="col-md-4" style="padding-left: 20px;padding-top: 8px">
                                        <label>姓名:</label>
                                    </div>
                                    <div class="col-md-4" id="n">

                                    </div>
                                </div>
                            </div>
                            <%--学号 --%>
                            <div class="row">
                                <div class="col-md-12" >
                                    <div class="col-md-4" style="padding-left: 20px;padding-top: 20px">
                                        <label>学号:</label>
                                    </div>
                                    <div class="col-md-4" id="i">

                                    </div>
                                </div>
                            </div>
                            <%--签到时间 --%>
                            <div class="row">
                                <div class="col-md-12" >
                                    <div class="col-md-4" style="padding-left: 20px;padding-top: 30px">
                                        <label>签到时间:</label>
                                    </div>
                                    <div class="col-md-4" style="padding-top: 20px" id="t">

                                    </div>
                                </div>
                            </div>
                            <%--排名 --%>
                            <div class="row">
                                <div class="col-md-12" >
                                    <div class="col-md-4" style="padding-left: 20px;padding-top: 30px">
                                        <label>排名:</label>
                                    </div>
                                    <div class="col-md-4" style="padding-top: 20px" id="r">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="editbtn">修改</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

<%--        修改密码模态框--%>
        <div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 15%">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >修改密码</h4>
                    </div>
                    <div class="modal-body" id="change">
<%--                        修改密码--%>
                        <form>
                            <div class="row">
                                <div class="col-md-3">
                                   <label>新密码</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <input type="password" class="form-control" id="p1" name="password">
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-md-3">
                                    <label>重新输入一次</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-10">
                                    <input type="password" class="form-control" id="p2" name="password">
                                </div>
                            </div>
                            <div class="row" style="padding-top: 5px">
                                <div class="col-md-4">
                                    <span id="message">

                                    </span>
                                </div>
                            </div>
                            <div class="row" id="div" style="padding-top: 35px">
                                <div class="col-md-6  modal-footer">
                                     <button type="button" class="btn btn-primary" id="changePwd" >修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>
    <%--1--%>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        @Author by lgg
    </div>
</div>
<script type="text/javascript">
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });

    //当前页面
    var pageNow ;
    //添加按钮模态框
    $("#add_modal").click(function () {
        $("#addModal").modal({
            backdrop:"static"
        });
    });

        var uid = '<%=request.getSession().getAttribute("user_id")%>';
        var uname = '<%=request.getSession().getAttribute("name")%>';
        console.log(uname)
    //基本信息模态框
    $("#info_modal").click(function () {
        $("#infoModal").modal({
            backdrop:"static"
        });
        $.ajax({
            url: "http://localhost:8080/dd_war_exploded/system/userInfo",
            data:"user_id="+uid,
            type:"GET",
            success:function (result) {
                userInfo(result);
            }
        });
    });

    //修改密码模态框
    $("#pwd_modal").click(function () {
        $("#pwdModal").modal({
            backdrop:"static"
        });
    });

    //编辑信息模态框
    $("#pwd_modal").click(function () {
        $("#pwdModal").modal({
            backdrop:"static"
        });
    });

    //个人信息显示
    function userInfo(result){
        $(".one").remove();
        $("<p class='one'></p>").addClass("text-center").append(result.name).appendTo("#name");
        $("<p class='one'></p>").addClass("text-center").append(result.user_id).appendTo("#user_id");
        $("<p class='one'></p>").addClass("text-center").append(result.sign_in_time).appendTo("#sign_in_time");
        $("<p class='one'></p>").addClass("text-center").append(result.rank).appendTo("#ran");
    }

    $(function () {
        page(1);
    });

    //获取签到信息
    function page(pn) {
        $.ajax({
            url:"http://localhost:8080/dd_war_exploded/system/pageInfo",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
                //显示数据
                table(result);
                //显示分页条
                navcat(result);
            }
        })
    };

    //显示table的数据
    function table(result) {
        $("#info_table tbody").empty();
        var info = result.list;
        $.each(info,function (index,item) {
            var checkBox = $("<th></th>").append("<input type='checkbox' class='check_item'></th>");
            var name = $("<th></th>").addClass("text-center").append(item.name);
            var id = $("<th></th>").addClass("text-center").append(item.id);
            var user_id = $("<th></th>").addClass("text-center").append(item.user_id);
            var sign_in_time = $("<th></th>").addClass("text-center").append(item.sign_in_time);
            var rank = $("<th></th>").addClass("text-center").append(item.rank);
            var editBtn = $("<button type='button' class='edit'></button>")
                                       .addClass("btn btn-info btn-default")
                                       .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                                       .append(" ")
                                       .append("编辑");

            //选中时获取该条数据的id
            checkBox.attr("checked",item.id);

            //获取该编辑键的数据
            editBtn.attr("edit-id",item.id)
                   .attr("edit-name",item.name)
                   .attr("edit-userId",item.user_id)
                   .attr("edit-time",item.sign_in_time)
                   .attr("edit-rank",item.rank);

            var deletBtn = $("<button type='button' class='delete'></button>")
                                       .addClass("btn btn-danger btn-default")
                                       .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                                       .append(" ")
                                       .append("删除");

            deletBtn.attr("delete-id",item.id);

            var btn = $("<th></th>").addClass("text-center")
                                    .append(editBtn)
                                    .append(" ")
                                    .append(deletBtn);

            $("<tr></tr>").append(checkBox)
                          .append(id)
                          .append(name)
                          .append(user_id)
                          .append(sign_in_time)
                          .append(rank)
                          .append(btn)
                          .appendTo("#info_table tbody");

        });
        //删除
        $(".delete").click(function () {
            var id =$(this).attr("delete-id");
            if (confirm("是否删除该数据？")){
                $.ajax({
                    url:"http://localhost:8080/dd_war_exploded/system/delete",
                    data:"id="+id,
                    type:"POST",
                    complete:function (result) {
                        alert("删除成功！");
                        page(pageNow);
                    }
                })
            }
        });

        //编辑
        $(".edit").click(function () {
            //显示模态框
            $("#editModal").modal({
                backdrop:"static"
            });
            //获取该编辑用户的id
            var id = $(this).attr("edit-id");
            var name = $(this).attr("edit-name");
            var time = $(this).attr("edit-time");
            var rank = $(this).attr("edit-rank");
            var user_id = $(this).attr("edit-userId");
            edit(id,name,time,rank,user_id);

            Rank = rank;
            Time = time;
            Id = id;

            var r ;
            var t ;
            var reg = /^\d+$/;

            $("#editbtn").click(function () {

                if ($("#one").val() =="") {
                    t = time;
                }else {
                    t = $("#one").val();
                }
                if ($("#two").val() ==""){
                    r = rank;
                }else {
                    r = $("#two").val();
                }

                //校验是否是正整数
                if ((!reg.test(t)) || (!reg.test(r))){
                    $("#editModal").modal({
                        backdrop:"static"
                    });

                }else{

                    $.ajax({
                        url :"http://localhost:8080/dd_war_exploded/system/edit",
                        data:"sign_in_time="+t+"&rank="+r+"&id="+id,
                        type:"POST",
                        complete:function () {
                            $('#editModal').modal('hide');
                            page(pageNow);
                        }
                    });
                }
            });
        });
    }

    $("#editClose").click(function () {
        var rank;
        var time;
        var id;

        id = Id;
        if ($("#one").val() !=""||$("#two").val() !=""){
            if ($("#one").val() =="") {
                    time = Time;
            }else {
                time = $("#one").val();
            }
            if ($("#two").val() ==""){
                    rank = Rank;
            }else {
                rank = $("#two").val();
            }

            if (confirm("是否保存该数据")){
                $.ajax({
                    url :"http://localhost:8080/dd_war_exploded/system/edit",
                    data:"sign_in_time="+time+"&rank="+rank+"&id="+id,
                    type:"POST",
                    complete:function () {
                        $('#editModal').modal('hide');
                        page(pageNow);
                    }
                });
            }else {
                $('#editModal').modal('hide');
                page(pageNow);
            }
        }else {
            $('#editModal').modal('hide');
            page(pageNow);
        }
    });

    //编辑模态框
    function edit(id,name,time,rank,user_id) {

        $(".two").remove();
        $("<p class='two' style='padding-top: 8px'></p>").addClass("text-center").append(name).appendTo("#n");
        $("<p class='two' style='padding-top: 20px'></p>").addClass("text-center").append(user_id).appendTo("#i");
        $("<input type='text' class='two form-control' name='sign_in_time'id='one'/>").addClass("text-center").appendTo("#t").attr("placeholder",time);
        $("<input type='text' class='two form-control' name='rank' id='two'/>").addClass("text-center").append(user_id).appendTo("#r").attr("placeholder",rank);

    }

    //分页条
    function navcat(result) {

        $("#nav").empty();

        pageNow = result.pageNum;
        var pageNum = result.navigatepageNums;
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        //跳转到首页
        firstPage.click(function () {
            page(1);
            $("#checkAll").prop("checked",false);
        });

        var previous = $("<li></li>").append($("<a aria-label='Previous'></a>").append($("<span aria-hidden='true'></span>").append("&laquo;")).attr("href","#"));
        //上一页
        previous.click(function () {
            page(result.pageNum-1);
            $("#checkAll").prop("checked",false);
        });
        //如果是第一页则上一页和首页不能按
        if (result.hasPreviousPage == false){
            firstPage.addClass("disabled");
            previous.addClass("disabled");
        }

        var endPage = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        //调转到尾页
        endPage.click(function () {
            page(result.pages);
            $("#checkAll").prop("checked",false);
        });
        var next = $("<li></li>").append($("<a aria-label='Next'></a>").append($("<span aria-hidden='true'></span>").append("&raquo;")).attr("href","#"));
        //下一页
        next.click(function () {
           page(result.pageNum+1);
            $("#checkAll").prop("checked",false);
        });
        //如果是尾页则下一页和尾页不能按
        if (result.hasNextPage == false){
            endPage.addClass("disabled");
            next.addClass("disabled");
        }
        ul.append(firstPage).append(previous);
        $.each(pageNum,function (index,item) {
            var li = $("<li></li>").append($("<a></a>").append(item));
            if (result.pageNum == item){
                li.addClass("active");
            }
            li.click(function () {
                    page(item);
                    $("#checkAll").prop("checked",false);
                });
            ul.append(li);
        })
        ul.append(next).append(endPage).appendTo("#nav");
        var nav = $("<nav aria-label='Page navigation'></nav>").append(ul);
        nav.appendTo("#nav");
    }

    //多选
    $("#checkAll").click(function () {
        if ($("#checkAll").is(":checked")) {
            $(".check_item").prop("checked",true);
        }else {
            $(".check_item").prop("checked",false);
        }
    });

    //添加按钮
    $("#add_btn").click(function () {

        $.ajax({
            url:"http://localhost:8080/dd_war_exploded/system/save",
            type:"POST",
            data:$('#addModal form').serialize(),
            complete:function () {
                $('#addModal').modal('hide');
                page(999);
            }
        });
    });

    //修改密码
    $("#changePwd").click(function () {

        var p1 = $("#p1").val();
        var p2 = $("#p2").val();
        var data = '<%=request.getSession().getAttribute("user_id")%>';
        var pwd = '<%=request.getSession().getAttribute("password")%>';

        if (p1 == p2){

            if (p1 != pwd){
                $.ajax({
                    url:"http://localhost:8080/dd_war_exploded/system/changePwd",
                    type:"POST",
                    data:$("#p1").serialize()+"&user_id="+data,
                    complete:function () {
                        $('#pwdModal').modal('hide');
                        alert("修改成功");
                        $("#p1").val("");
                        $("#p2").val("");
                    }
                })
            } else {
                $("#p1").parent().addClass("has-error");
                $("#p2").parent().addClass("has-error");
                $("#message").text("与原密码相同");
                $("#div").css("padding-top","19px");

                //清空input的值
                $("#p1").val("");
                $("#p2").val("");
                $("#p1,#p2").click(function () {
                    $("#message").text("");
                    $("#div").css("padding-top","35px");
                    $("#p1").parent().removeClass("has-error");
                    $("#p2").parent().removeClass("has-error");
                });
            }
        }else{
            $("#p1").parent().addClass("has-error");
            $("#p2").parent().addClass("has-error");
            $("#message").text("密码不一致");
            $("#div").css("padding-top","19px");

            //清空input的值
            $("#p1").val("");
            $("#p2").val("");
            $("#p1,#p2").click(function () {
                $("#message").text("");
                $("#div").css("padding-top","35px");
                $("#p1").parent().removeClass("has-error");
                $("#p2").parent().removeClass("has-error");
            });
        }
    });

    //批量删除
    $("#deleteAll").click(function () {

        var name = "";
        var id = "";

        $.each($(".check_item:checked"),function () {
             name += $(this).parents("tr").find("th:eq(2)").text()+",";
             id += $(this).parents("tr").find("th:eq(1)").text()+"-";
             console.log(id);
        });

        name = name.substring(0,name.length-1 );
        id = id.substring(0,id.length-1);
        console.log(id);

        if (confirm("确认删除【"+name +"】吗?")) {

            $.ajax({
                url:"http://localhost:8080/dd_war_exploded/system/deleteAll",
                type:"POST",
                data:"ids="+id,
                complete:function () {
                    page(pageNow);
                }
            })
        }
    });
    $(function () {

            $.ajax({
                url:"http://localhost:8080/dd_war_exploded/system/TopTen",
                type:"POST",
                data:"",
                success:function (result) {
                    console.log(result.list);
                    console.log(result.list[0].sign_in_time)
                    Chart(result);
                }
            })

    });



    function Chart(result) {
        //折线图
        var data = result.list;
        console.log(data[0].sign_in_time);
        var myChart = echarts.init(document.getElementById('view'));
        var option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    crossStyle: {
                        color: '#999'
                    }
                }
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                data:['名次','时间']
            },
            xAxis: [
                {
                    type: 'category',
                    data: [
                        data[0].name,
                        data[1].name,
                        data[2].name,
                        data[3].name,
                        data[4].name,
                        data[5].name,
                        data[6].name,
                        data[7].name,
                        data[8].name,
                        data[9].name],
                    axisPointer: {
                        type: 'shadow'
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '签到时间',
                    min: 0,
                    max: 60,
                    interval: 10,
                    axisLabel: {
                        formatter: '{value} h'
                    }
                },
                {
                    type: 'value',
                    name: '名次',
                    min: 0,
                    max: 11,
                    interval:1,
                    inverse:true,
                    axisLine: {onZero: true},
                    axisLabel: {
                        formatter: '{value} '
                    }
                }
            ],

            series: [
                {
                    name:'时间',
                    type:'bar',
                    data:[data[0].sign_in_time,
                        data[1].sign_in_time,
                        data[2].sign_in_time,
                        data[3].sign_in_time,
                        data[4].sign_in_time,
                        data[5].sign_in_time,
                        data[6].sign_in_time,
                        data[7].sign_in_time,
                        data[8].sign_in_time,
                        data[9].sign_in_time]
                },
                {
                    name:'名次',
                    type:'line',
                    data:[1,2,3,4,5,6,7,8,9,10],
                    yAxisIndex: 1 // 绑定y轴
                }

            ]
        };
        myChart.setOption(option);
    }


    var success=0;
    var fail=0;
    var imgurls="";

    $(function (){
        var imgsName="";
        layui.use(['upload','layer'],function() {
            var upload = layui.upload;
            var layer=layui.layer;

            upload.render({
                elem: '#test1',
                url:'${pageContext.request.contextPath}/system/upload',
                data:{name:uname},
                method:'POST',
                multiple: true,
                auto:false,
                accept: 'images',
                acceptMime: 'image/*',
//			上传的单个图片大小
                size:1000,
//			最多上传的数量
                number:20,
//			MultipartFile file 对应，layui默认就是file,要改动则相应改动
                field:'file',
                bindAction: '#test9',
                before: function(obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result) {
                        $('#demo2').append('<img src="' + result
                            + '" alt="' + file.name
                            +'"height="92px" width="92px" class="layui-upload-img uploadImgPreView">')
                        console.log(file.name)
                    });
                },

                done: function(res, index, upload) {
                    //每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
                    console.log(res);
                    console.log(index);
                    console.log(upload);
                    if(res.code>0){
                        fail++;
                    }else{
                        success++;
                       // imgurls=imgurls+""+res.data.src+",";
                        $('#imgUrls').val(imgurls);
                    }
                },
                allDone:function(obj){
                    layer.msg("总共要上传图片总数为："+(fail+success)+"\n"
                        +"其中上传成功图片数为："+success+"\n"
                        +"其中上传失败图片数为："+fail
                    )
                }
            });

        });

        //清空预览图片
        cleanImgsPreview();
    });

    /**
     * 清空预览的图片及其对应的成功失败数
     * 原因：如果已经存在预览的图片的话，再次点击上选择图片时，预览图片会不断累加
     * 表面上做上传成功的个数清0，实际后台已经上传成功保存了的，只是没有使用，以最终商品添加的提交的为准
      */
    function cleanImgsPreview(){
        $("#cleanImgs").click(function(){
            success=0;
            fail=0;
            $('#demo2').html("");
            $('#imgUrls').val("");
        });
    }





</script>
</body>
</html>
