<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="CW.UsersDAO"%>
<%@page import="CW.JDBC_Util" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

      <style>
          *{
              padding: 0;
              margin: 0;
          }
          body{
              background: url("Images/wallpaper.jpg");
          }
          .lay_top{
              height: 100px;
              width: 1000px;
              background-color: #c1d1e1;
              margin: 0 auto;
              box-shadow: 5px 5px 5px #cccccc;
              position: relative;

          }
          .lay_top .photo1{
              height: 70px;
              margin-top: 10px;
              margin-left: 700px;
              box-shadow: 5px 5px 10px;
          }
          .lay_top .photo2{
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
          .lay_top .logo{
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
          .result{
              width: 500px;
              height: 300px;
              margin: 80px auto;
              background-color: white;
              text-align: center;
              font-family: "微软雅黑";
              background-color: rgba(255,255,255,0.5);
              box-shadow: 5px 5px 5px 0px rgba(150,150,150,0.5);
          }
          .result img{
              margin-top: 20px;
              height: 80px;
              animation: move 500ms linear 0s normal;
          }
          .result h2{
              margin-top: 10px;
              color: #999999;
          }
          .result p{
              margin-top: 20px;
              color: #999999;
          }
          .result a{
              display:inline-block;
              margin-top: 10px;
              text-decoration-line: none;
              color: red;
          }
          .result .top{
              margin-top: 50px;
              width: 500px;
              height: 38px;
              background: url("Images/wood.jpg") repeat-x;
              border-radius: 10px 10px 0px 0px;
          }
          .result .top h1{
              padding-top: 5px;
              font-family: "微软雅黑";
              font-size: 20px;
              color: white;
              text-align: center;
          }
          @keyframes move {
              from{
                  margin-top: 0px;
                  height: 10px;
                  opacity: 0;
              }
              to{
                  margin-top: 20px;
                  height: 80px;
                  opacity: 1;
              }
          }
      </style>
  </head>
  
  <body>
  <div class="lay_top">
      <img src="Images/logo.png" class="logo">
      <img src="Images/navphoto1.png" class="photo1">
      <img src="Images/navphoto2.png" class="photo2">
  </div>

  <div class="result">
      <div class="top">
          <h1>登陆结果</h1>
      </div>
      <div class="bottom">
          <% if(UsersDAO.check(request.getParameter("username"))) {
              UsersDAO.update(request.getParameter("username"),request.getParameter("password"));
              UsersDAO.createSTable(request.getParameter("username"));

              for(int i=1;i<37;i++){
                  String li_idd="Photo_"+i;
                  UsersDAO.Insert(request.getParameter("username"),li_idd,0,i);
              }
          %>
          <div class="right">
              <img src="Images/right.png">
              <h2>注册成功</h2>
              <p>欢迎你</p>
              <a href="login.html">立即登陆</a>
          </div>
          <% } else { %>
          <div class="wrong">
              <img src="Images/wrong.png">
              <h2>注册失败</h2>
              <p>用户名已被使用</p>
              <a href="register.html">重新注册</a>
          </div>
          <% } %>
      </div>

  </div>

  </body>
</html>
