
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册和登录系统</title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background: url("Images/wallpaper.jpg");
        }
       .lay_top{
           box-sizing: border-box;
           overflow: hidden;
           background-color: #999999;
           height: 100px;
           margin: 0 auto;
       }
        .text_top{
            margin-top: 25px;
            margin-left: 5px;
            display: inline-block;

        }
        .content{
            float: right;
            margin-right: 300px;
            background-color: #999999;
            display: inline-block;
            margin-top: 30px;
        }
        a{
            text-decoration-line: none;
            color: red;
        }
        .logo{
            border: 1px solid #000;
            border-radius: 150px;
            padding: 5px;
            margin-top: 20px;
            margin-left: 270px;
            height: 50px;
            display: inline-block;
            float: left;
        }
    </style>
</head>
<body>
<div class="lay_top">

    <img src="Images/logo.png" class="logo">

    <h1 class="text_top">欢迎你</h1>

    <div class="content">
        请<a href="login.html">登录</a> |
        <a href="register.html">开始注册</a>

    </div>
</div>

</body>
</html>
