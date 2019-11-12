<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/27
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body background="images/login.jpg" style="background-size: cover" >

<div class="container" >
    <div style="position: relative; margin-top: 35%;left: -700px;">
        <form class="form-horizontal" action="system/getRegister" method="post">
            <div class="form-group">
                <label for="user_id" class="col-sm-8 control-label" style="color: white">学号</label>
                <div class="col-sm-4">
                    <input id="user_id" type="text" class="form-control"  name="user_id" placeholder="请输入学号" style="opacity: 0.8">
                </div>
            </div>
            <div class="form-group">
                <label for="user_name" class="col-sm-8 control-label" style="color: white">用户名</label>
                <div class="col-sm-4">
                    <input id="user_name" type="text" class="form-control"  name="user_name" placeholder="请输入用户名" style="opacity: 0.8">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-8 control-label" style="color: white">密码</label>
                <div class="col-sm-4">
                    <input id="password" type="password" class="form-control"  name="password" placeholder="请输入密码" style="opacity: 0.8">
                </div>
            </div>
                <div class="form-group" style=" position:relative; top:10px">
                    <div class="btn-group col-sm-offset-9">
                        <button type="submit" class="btn btn-default">注册</button>
                    </div>
                </div>
        </form>
    </div>
</div>

</body>
</html>
