
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
        .top{
            height: 100px;
            width: 1000px;
            background-color: #c1d1e1;
            margin: 0 auto;
            box-shadow: 5px 5px 5px #cccccc;
            position: relative;

        }
        .top .photo1{
            height: 70px;
            margin-top: 10px;
            margin-left: 700px;
            box-shadow: 5px 5px 10px;
        }
        .top .photo2{
            height: 50px;
            margin-top: 30px;
            margin-left: 40px;
            /*给图片添加圆角阴影↓*/
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.25);
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.25);
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            border-bottom: 1px solid rgba(0,0,0,0.25);
        }
        .top .logo{
            margin-top: 20px;
            margin-left: 100px;
            height: 50px;
            position: absolute;
            /*给图片添加圆角阴影↓*/
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.25);
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.25);
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            border-bottom: 1px solid rgba(0,0,0,0.25);
        }
        .top .logister{
            position: absolute;
            left: 30%;
            top:35px;
            width: 300px;
            height: 50px;
            margin-left: 50px;
        }
        .top .logister p{
            font-size: 20px;
            font-family: "微软雅黑";
            color: #999999;
        }
        .top .logister p span{
            font-size: 30px;
        }
        .top .logister p a{
            text-decoration-line: none;
            color: red;
        }

        .content{
            width: 1000px;
            height: 500px;
            background-color: #cccccc;
            margin: 10px auto;
            box-shadow: 5px 5px 5px #cccccc;
            overflow: hidden;
        }
        .content .poster{
            width: 4000px;
            height: 500px;
            animation: move 20s linear 4s infinite normal;
            animation-fill-mode: both;
        }
        .content .poster li{
            width: 1000px;
            height: 500px;
            list-style: none;
            float: left;
        }
        .content .poster li img{
            width: 1000px;
            height: 500px;
        }
        @keyframes move {
            0%{
                margin-left: 0;
            }
            16%{
                margin-left: -1000px;
            }
            32%{
                margin-left: -1000px;
            }
            48%{
                margin-left: -2000px;
            }
            64%{
                margin-left: -2000px;
            }
            80%{
                margin-left: -3000px;
            }
            100%{
                margin-left: -3000px;
            }
        }
    </style>
</head>
<body>
<div class="top">
    <img src="Images/logo.png" class="logo">
    <div class="logister">
        <p><span>欢迎你</span>，请 <a href="login.html">登录</a> 或 <a href="register.html">注册</a></p>
    </div>
    <img src="Images/navphoto1.png" class="photo1">
    <img src="Images/navphoto2.png" class="photo2">
</div>


<div class="content">
    <ul class="poster">
        <li><img src="Images/poster1.jpg"></li>
        <li><img src="Images/poster2.jpg"></li>
        <li><img src="Images/poster3.jpg"></li>
        <li><img src="Images/poster1.jpg"></li>
    </ul>
</div>

</body>
</html>
