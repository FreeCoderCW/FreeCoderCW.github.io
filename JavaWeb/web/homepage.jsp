<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="CW.UsersDAO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background: url("Images/wallpaper.jpg");
        }
        #form{
            display: none;
        }
        ul{
            list-style: none;
        }
        /*初始化默认*/

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
        .lay_top .nav{
            display: inline-block;
            height: 50px;
            width: 500px;
            position: absolute;
            left: 25%;
            top: 30%;
        }
        .lay_top .nav li{
            display: inline-block;
            width: 100px;
            height: 50px;
            margin-right: 30px;
            background-image: url("Images/wood.jpg");
            text-align: center;
            line-height: 50px;
            box-shadow: 5px 5px 10px #999999;
            border-radius: 5px;

        }
        .lay_top .nav li a{
            width: 100px;
            height: 50px;
            display: inline-block;
            text-decoration-line: none;
            color: white;
            font-size: 25px;
        }
        .lay_top .nav li a:hover{
            color:gray;
        }
        .lay_top .nav li:hover{
            animation: shake 0.3s linear 0s normal;
        }
        .backtop{
            position: fixed;
            right: 10px;
            bottom: 10px;
            width: 70px;
            height: 50px;
            /*height: 50px;*/
            background-color: rgba(200,200,200,1);
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 5px 5px 5px #999999;
        }
        .backtop:hover{
            animation: up 1s linear 0s infinite;
        }
        .backtop>img{
            margin-top: 10px;
            width: 50px;
            height: 30px;
        }
        /*导航条*/

        .content{
            width: 1000px;
            height: 4380px;
            background-color: #fff;
            margin: 10px auto;
            border: 1px solid #fff;
            box-sizing: border-box;
        }
        .content h2{
            background-image: url("Images/line.png");
            text-align: center;
        }
        .content h2:nth-child(1){
            margin-top: 20px;
        }
        .content>div{
            height: 2000px;
            width: 1000px;
        }
        .content .people{
            height: 1460px;
        }
        .content .animal{
            height: 1460px;
        }
        .content .scenery{
            height: 1460px;
        }
        .content ul>li{
            display: inline-block;
            height: 340px;
            width: 330px;
            float: left;
            margin-right: 3px;
            text-align: center;
            line-height: 300px;
            position: relative;
            overflow: hidden;
        }
        .content .people ul li ul{
            position: absolute;
            width: 100%;
            bottom: 0;
            left: 0;
            opacity: 0;
        }
        .content .people>ul>li:hover ul{
            animation: appear 0.5s linear 0.2s normal;
            animation-fill-mode: forwards;
        }
        .content .people ul li ul li{

            height: 40px;
            width: 80px;
            bottom: 0px;
            text-align: center;
            line-height: 40px;
            background-image: none !important;
            margin-top: 0px !important;
            float: left;
            opacity: 0.5;
            margin-left: 25px;
        }
        .content .people ul li ul li>img{
            height: 20px !important;
            width: 20px !important;
            margin-top: 0 !important;
        }

        .content .animal ul li ul{
            position: absolute;
            width: 100%;
            bottom: 0;
            left: 0;
            opacity: 0;
        }
        .content .animal>ul>li:hover ul{
            animation: appear 0.5s linear 0.2s normal;
            animation-fill-mode: forwards;
        }
        .content .animal ul li ul li{

            height: 40px;
            width: 80px;
            bottom: 0px;
            text-align: center;
            line-height: 40px;
            background-image: none !important;
            margin-top: 0px !important;
            float: left;
            opacity: 0.5;
            margin-left: 25px;
        }
        .content .animal ul li ul li>img{
            height: 20px !important;
            width: 20px !important;
            margin-top: 0 !important;
        }

        .content .scenery ul li ul{
            position: absolute;
            width: 100%;
            bottom: 0;
            left: 0;
            opacity: 0;
        }
        .content .scenery>ul>li:hover ul{
            animation: appear 0.5s linear 0.2s normal;
            animation-fill-mode: forwards;
        }
        .content .scenery ul li ul li{

            height: 40px;
            width: 80px;
            bottom: 0px;
            text-align: center;
            line-height: 40px;
            background-image: none !important;
            margin-top: 0px !important;
            float: left;
            opacity: 0.5;
            margin-left: 25px;
        }
        .content .scenery ul li ul li>img{
            height: 20px !important;
            width: 20px !important;
            margin-top: 0 !important;
        }
        .content .like:hover{
            opacity: 1;
        }
        .content .comment:hover{
            opacity: 1;
        }
        .content .collect:hover{
            opacity: 1;
        }
        .content .people ul li:nth-child(1){
            background: url("Images/photos/people/people1.png") no-repeat center center;
            background-size: 100px 150px;
        }
        .content .people ul li:nth-child(1) img{
            width: 150px;
            height: 200px;
            margin-top: 70px;
        }
        .content .people ul li:nth-child(2){
            background: url("Images/photos/people/people2.png") no-repeat center center;
            background-size: 120px 170px;
        }
        .content .people ul li:nth-child(2) img{
            width: 160px;
            height: 220px;
            margin-top: 60px;
        }
        .content .people ul li:nth-child(3){
            background: url("Images/photos/people/people3.png") no-repeat center center;
            background-size: 170px 170px;
        }
        .content .people ul li:nth-child(3) img{
            width: 200px;
            height: 200px;
            margin-top: 65px;
        }
        .content .people ul li:nth-child(4){
            background: url("Images/photos/people/people4.png") no-repeat center center;
            background-size: 120px 170px;
        }
        .content .people ul li:nth-child(4) img{
            width: 160px;
            height: 240px;
            margin-top: 50px;
        }
        .content .people ul li:nth-child(5){
            background: url("Images/photos/people/people5.png") no-repeat center center;
            background-size: 120px 170px;
        }
        .content .people ul li:nth-child(5) img{
            width: 160px;
            height: 220px;
            margin-top: 60px;
        }
        .content .people ul li:nth-child(6){
            background: url("Images/photos/people/people6.png") no-repeat center center;
            background-size: 140px 190px;
        }
        .content .people ul li:nth-child(6) img{
            width: 180px;
            height: 240px;
            margin-top: 50px;
        }
        .content .people ul li:nth-child(7){
            background: url("Images/photos/people/people7.png") no-repeat center center;
            background-size: 140px 190px;
        }
        .content .people ul li:nth-child(7) img{
            width: 190px;
            height: 250px;
            margin-top: 45px;
        }
        .content .people ul li:nth-child(8){
            background: url("Images/photos/people/people8.png") no-repeat center center;
            background-size: 190px 190px;
        }
        .content .people ul li:nth-child(8) img{
            width: 225px;
            height: 245px;
            margin-top: 50px;
        }
        .content .people ul li:nth-child(9){
            background: url("Images/photos/people/people9.png") no-repeat center center;
            background-size: 140px 190px;
        }
        .content .people ul li:nth-child(9) img{
            width: 220px;
            height: 250px;
            margin-top: 45px;
        }
        .content .people ul li:nth-child(10){
            background: url("Images/photos/people/people10.png") no-repeat center center;
            background-size: 140px 190px;
        }
        .content .people ul li:nth-child(10) img{
            width: 200px;
            height: 250px;
            margin-top: 45px;
        }
        .content .people ul li:nth-child(11){
            background: url("Images/photos/people/people11.png") no-repeat center center;
            background-size: 140px 190px;
        }
        .content .people ul li:nth-child(11) img{
            width: 200px;
            height: 250px;
            margin-top: 45px;
        }
        .content .people ul li:nth-child(12){
            background: url("Images/photos/people/people12.png") no-repeat center center;
            background-size: 170px 190px;
        }
        .content .people ul li:nth-child(12) img{
            width: 230px;
            height: 250px;
            margin-top: 45px;
        }

        .content .animal ul li:nth-child(1){
            background: url("Images/photos/animal/animal1.jpg") no-repeat center center;
            background-size: 290px 170px;
        }
        .content .animal ul li:nth-child(1) img{
            width: 300px;
            height: 210px;
            margin-top: 65px;
        }
        .content .animal ul li:nth-child(2){
            background: url("Images/photos/animal/animal2.jpg") no-repeat center center;
            background-size: 290px 170px;
        }
        .content .animal ul li:nth-child(2) img{
            width: 300px;
            height: 210px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(3){
            background: url("Images/photos/animal/animal3.jpg") no-repeat center center;
            background-size: 290px 170px;
        }
        .content .animal ul li:nth-child(3) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(4){
            background: url("Images/photos/animal/animal4.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(4) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(5){
            background: url("Images/photos/animal/animal5.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(5) img{
            width: 320px;
            height: 230px;
            margin-top: 54px;
        }
        .content .animal ul li:nth-child(6){
            background: url("Images/photos/animal/animal6.jpg") no-repeat center center;
            background-size: 120px 170px;
        }
        .content .animal ul li:nth-child(6) img{
            width: 180px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(7){
            background: url("Images/photos/animal/animal7.jpg") no-repeat center center;
            background-size: 290px 170px;
        }
        .content .animal ul li:nth-child(7) img{
            width: 320px;
            height: 220px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(8){
            background: url("Images/photos/animal/animal8.jpg") no-repeat center center;
            background-size: 260px 170px;
        }
        .content .animal ul li:nth-child(8) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(9){
            background: url("Images/photos/animal/animal9.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(9) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(10){
            background: url("Images/photos/animal/animal10.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(10) img{
            width: 260px;
            height: 210px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(11){
            background: url("Images/photos/animal/animal11.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(11) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .animal ul li:nth-child(12){
            background: url("Images/photos/animal/animal12.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .animal ul li:nth-child(12) img{
            width: 280px;
            height: 230px;
            margin-top: 58px;
        }

        .content .scenery ul li:nth-child(1){
            background: url("Images/photos/scenery/1.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(1) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(2){
            background: url("Images/photos/scenery/2.jpg") no-repeat center center;
            background-size: 250px 150px;
        }
        .content .scenery ul li:nth-child(2) img{
            width: 320px;
            height: 200px;
            margin-top: 70px;
        }
        .content .scenery ul li:nth-child(3){
            background: url("Images/photos/scenery/3.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(3) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(4){
            background: url("Images/photos/scenery/4.jpg") no-repeat center center;
            background-size: 250px 150px;
        }
        .content .scenery ul li:nth-child(4) img{
            width: 300px;
            height: 200px;
            margin-top: 70px;
        }
        .content .scenery ul li:nth-child(5){
            background: url("Images/photos/scenery/5.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(5) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(6){
            background: url("Images/photos/scenery/6.jpg") no-repeat center center;
            background-size: 250px 150px;
        }
        .content .scenery ul li:nth-child(6) img{
            width: 280px;
            height:180px;
            margin-top: 75px;
        }
        .content .scenery ul li:nth-child(7){
            background: url("Images/photos/scenery/7.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(7) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(8){
            background: url("Images/photos/scenery/8.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(8) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(9){
            background: url("Images/photos/scenery/9.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(9) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(10){
            background: url("Images/photos/scenery/10.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(10) img{
            width: 300px;
            height: 200px;
            margin-top: 70px;
        }
        .content .scenery ul li:nth-child(11){
            background: url("Images/photos/scenery/11.jpg") no-repeat center center;
            background-size: 250px 170px;
        }
        .content .scenery ul li:nth-child(11) img{
            width: 320px;
            height: 230px;
            margin-top: 58px;
        }
        .content .scenery ul li:nth-child(12){
            background: url("Images/photos/scenery/12.jpg") no-repeat center center;
            background-size: 250px 150px;
        }
        .content .scenery ul li:nth-child(12) img{
            width: 300px;
            height: 180px;
            margin-top: 70px;
        }
        @keyframes shake {
            25%{
                transform: rotate(10deg);
            }
            50%{
                transform: none;
            }
            75%{
                transform: rotate(-10deg);
            }
        }
        @keyframes up {
            100%{
                bottom:15px;
                opacity: 0.5;
            }
        }
        @keyframes appear {
            from{
                bottom: -40px;
            }
            to{
                bottom: 0;
                opacity: 1;
            }
        }

    </style>
    <script src="JS/jquery-1.12.4.js"></script>
    <script src="JS/index1.js"></script>
</head>
<body>
<div class="lay_top">
    <img src="Images/logo.png" class="logo">
    <ul class="nav">
        <li><a href="#people">人物</a></li>
        <li><a href="#scenery">风景</a></li>
        <li><a href="#animal">动物</a></li>
    </ul>
    <img src="Images/navphoto1.png" class="photo1">
    <img src="Images/navphoto2.png" class="photo2">
</div>
<a href="#" class="backtop"><img src="Images/back.png"></a>

<% List<Integer> stateListHomepage = new LinkedList<Integer>();
    stateListHomepage =(List<Integer>) session.getAttribute("statelist");
%>

<div class="content">
    <div class="people" id="people">
        <h2>人物</h2>
        <ul id="people-ul">
            <li id="Photo_1"><a href="browse.jsp?photoName=Images/photos/people/people1.png"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(0) == 1) ||(stateListHomepage.get(0)==3)){%>
                <li class="like" id="like_1"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_1"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(0) == 2) ||(stateListHomepage.get(0)==3)){ %>
                <li class="collect" id="collect_1"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_1"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people2.png"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(1) == 1) ||(stateListHomepage.get(1)==3)){%>
                <li class="like" id="like_2"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_2"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(1) == 2) ||(stateListHomepage.get(1)==3)){ %>
                <li class="collect" id="collect_2"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_2"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people3.png"><img src="Images/frame/frame5.png"></a><ul>
                <%if((stateListHomepage.get(2) == 1) ||(stateListHomepage.get(2)==3)){%>
                <li class="like" id="like_3"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_3"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(2) == 2) ||(stateListHomepage.get(2)==3)){ %>
                <li class="collect" id="collect_3"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_3"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people4.png"><img src="Images/frame/frame8.png"></a><ul>
                <%if((stateListHomepage.get(3) == 1) ||(stateListHomepage.get(3)==3)){%>
                <li class="like" id="like_4"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_4"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(3) == 2) ||(stateListHomepage.get(3)==3)){ %>
                <li class="collect" id="collect_4"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_4"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people5.png"><img src="Images/frame/frame6.png"></a><ul>
                <%if((stateListHomepage.get(4) == 1) ||(stateListHomepage.get(4)==3)){%>
                <li class="like" id="like_5"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_5"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(4) == 2) ||(stateListHomepage.get(4)==3)){ %>
                <li class="collect" id="collect_5"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_5"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people6.png"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(5) == 1) ||(stateListHomepage.get(5)==3)){%>
                <li class="like" id="like_6"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_6"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(5) == 2) ||(stateListHomepage.get(5)==3)){ %>
                <li class="collect" id="collect_6"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_6"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people7.png"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(6) == 1) ||(stateListHomepage.get(6)==3)){%>
                <li class="like" id="like_7"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_7"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(6) == 2) ||(stateListHomepage.get(6)==3)){ %>
                <li class="collect" id="collect_7"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_7"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people8.png"><img src="Images/frame/frame5.png"></a><ul>
                <%if((stateListHomepage.get(7) == 1) ||(stateListHomepage.get(7)==3)){%>
                <li class="like" id="like_8"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_8"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(7) == 2) ||(stateListHomepage.get(7)==3)){ %>
                <li class="collect" id="collect_8"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_8"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people9.png"><img src="Images/frame/frame8.png"></a><ul>
                <%if((stateListHomepage.get(8) == 1) ||(stateListHomepage.get(8)==3)){%>
                <li class="like" id="like_9"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_9"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(8) == 2) ||(stateListHomepage.get(8)==3)){ %>
                <li class="collect" id="collect_9"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_9"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people10.png"><img src="Images/frame/frame6.png"></a><ul>
                <%if((stateListHomepage.get(9) == 1) ||(stateListHomepage.get(9)==3)){%>
                <li class="like" id="like_10"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_10"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(9) == 2) ||(stateListHomepage.get(9)==3)){ %>
                <li class="collect" id="collect_10"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_10"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people11.png"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(10) == 1) ||(stateListHomepage.get(10)==3)){%>
                <li class="like" id="like_11"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_11"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(10) == 2) ||(stateListHomepage.get(10)==3)){ %>
                <li class="collect" id="collect_11"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_11"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/people/people12.png"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(11) == 1) ||(stateListHomepage.get(11)==3)){%>
                <li class="like" id="like_12"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_12"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(11) == 2) ||(stateListHomepage.get(11)==3)){ %>
                <li class="collect" id="collect_12"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_12"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
        </ul>
    </div>
    <div class="animal" id="animal">
        <h2>动物</h2>
        <ul>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal1.jpg"><img src="Images/frame/frame2.png"></a><ul>
                <%if((stateListHomepage.get(12) == 1) ||(stateListHomepage.get(12)==3)){%>
                <li class="like" id="like_13"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_13"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(12) == 2) ||(stateListHomepage.get(12)==3)){ %>
                <li class="collect" id="collect_13"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_13"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal2.jpg"><img src="Images/frame/frame6.png"></a><ul>
                <%if((stateListHomepage.get(13) == 1) ||(stateListHomepage.get(13)==3)){%>
                <li class="like" id="like_14"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_14"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(13) == 2) ||(stateListHomepage.get(13)==3)){ %>
                <li class="collect" id="collect_14"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_14"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal3.jpg"><img src="Images/frame/frame1.png"></a><ul>
                <%if((stateListHomepage.get(14) == 1) ||(stateListHomepage.get(14)==3)){%>
                <li class="like" id="like_15"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_15"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(14) == 2) ||(stateListHomepage.get(14)==3)){ %>
                <li class="collect" id="collect_15"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_15"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal4.jpg"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(15) == 1) ||(stateListHomepage.get(15)==3)){%>
                <li class="like" id="like_16"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_16"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(15) == 2) ||(stateListHomepage.get(15)==3)){ %>
                <li class="collect" id="collect_16"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_16"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal5.jpg"><img src="Images/frame/frame6.png"></a><ul>
                <%if((stateListHomepage.get(16) == 1) ||(stateListHomepage.get(16)==3)){%>
                <li class="like" id="like_17"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_17"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(16) == 2) ||(stateListHomepage.get(16)==3)){ %>
                <li class="collect" id="collect_17"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_17"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal6.jpg"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(17) == 1) ||(stateListHomepage.get(17)==3)){%>
                <li class="like" id="like_18"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_18"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(17) == 2) ||(stateListHomepage.get(17)==3)){ %>
                <li class="collect" id="collect_18"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_18"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal7.jpg"><img src="Images/frame/frame2.png"></a><ul>
                <%if((stateListHomepage.get(18) == 1) ||(stateListHomepage.get(18)==3)){%>
                <li class="like" id="like_19"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_19"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(18) == 2) ||(stateListHomepage.get(18)==3)){ %>
                <li class="collect" id="collect_19"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_19"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal8.jpg"><img src="Images/frame/frame1.png"></a><ul>
                <%if((stateListHomepage.get(19) == 1) ||(stateListHomepage.get(19)==3)){%>
                <li class="like" id="like_20"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_20"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(19) == 2) ||(stateListHomepage.get(19)==3)){ %>
                <li class="collect" id="collect_20"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_20"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal9.jpg"><img src="Images/frame/frame4.png"></a><ul>
                <%if((stateListHomepage.get(20) == 1) ||(stateListHomepage.get(20)==3)){%>
                <li class="like" id="like_21"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_21"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(20) == 2) ||(stateListHomepage.get(20)==3)){ %>
                <li class="collect" id="collect_21"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_21"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal10.jpg"><img src="Images/frame/frame5.png"></a><ul>
                <%if((stateListHomepage.get(21) == 1) ||(stateListHomepage.get(21)==3)){%>
                <li class="like" id="like_22"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_22"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(21) == 2) ||(stateListHomepage.get(21)==3)){ %>
                <li class="collect" id="collect_22"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_22"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal11.jpg"><img src="Images/frame/frame1.png"></a><ul>
                <%if((stateListHomepage.get(22) == 1) ||(stateListHomepage.get(22)==3)){%>
                <li class="like" id="like_23"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_23"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(22) == 2) ||(stateListHomepage.get(22)==3)){ %>
                <li class="collect" id="collect_23"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_23"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/animal/animal12.jpg"><img src="Images/frame/frame8.png"></a><ul>
                <%if((stateListHomepage.get(23) == 1) ||(stateListHomepage.get(23)==3)){%>
                <li class="like" id="like_24"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_24"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(23) == 2) ||(stateListHomepage.get(23)==3)){ %>
                <li class="collect" id="collect_24"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_24"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
        </ul>
    </div>
    <div class="scenery" id="scenery">
        <h2>风景</h2>
        <ul>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/1.jpg"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(24) == 1) ||(stateListHomepage.get(24)==3)){%>
                <li class="like" id="like_25"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_25"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(24) == 2) ||(stateListHomepage.get(24)==3)){ %>
                <li class="collect" id="collect_25"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_25"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/2.jpg"><img src="Images/frame/frame6.png"></a><ul>
                <%if((stateListHomepage.get(25) == 1) ||(stateListHomepage.get(25)==3)){%>
                <li class="like" id="like_26"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_26"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(25) == 2) ||(stateListHomepage.get(25)==3)){ %>
                <li class="collect" id="collect_26"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_26"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/3.jpg"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(26) == 1) ||(stateListHomepage.get(26)==3)){%>
                <li class="like" id="like_27"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_27"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(26) == 2) ||(stateListHomepage.get(26)==3)){ %>
                <li class="collect" id="collect_27"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_27"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/4.jpg"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(27) == 1) ||(stateListHomepage.get(27)==3)){%>
                <li class="like" id="like_28"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_28"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(27) == 2) ||(stateListHomepage.get(27)==3)){ %>
                <li class="collect" id="collect_28"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_28"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/5.jpg"><img src="Images/frame/frame4.png"></a><ul>
                <%if((stateListHomepage.get(28) == 1) ||(stateListHomepage.get(28)==3)){%>
                <li class="like" id="like_29"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_29"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(28) == 2) ||(stateListHomepage.get(28)==3)){ %>
                <li class="collect" id="collect_29"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_29"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/6.jpg"><img src="Images/frame/frame2.png"></a><ul>
                <%if((stateListHomepage.get(29) == 1) ||(stateListHomepage.get(29)==3)){%>
                <li class="like" id="like_30"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_30"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(29) == 2) ||(stateListHomepage.get(29)==3)){ %>
                <li class="collect" id="collect_30"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_30"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/7.jpg"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(30) == 1) ||(stateListHomepage.get(30)==3)){%>
                <li class="like" id="like_31"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_31"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(30) == 2) ||(stateListHomepage.get(30)==3)){ %>
                <li class="collect" id="collect_31"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_31"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/8.jpg"><img src="Images/frame/frame1.png"></a><ul>
                <%if((stateListHomepage.get(31) == 1) ||(stateListHomepage.get(31)==3)){%>
                <li class="like" id="like_32"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_32"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(31) == 2) ||(stateListHomepage.get(31)==3)){ %>
                <li class="collect" id="collect_32"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_32"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/9.jpg"><img src="Images/frame/frame8.png"></a><ul>
                <%if((stateListHomepage.get(32) == 1) ||(stateListHomepage.get(32)==3)){%>
                <li class="like" id="like_33"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_33"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(32) == 2) ||(stateListHomepage.get(32)==3)){ %>
                <li class="collect" id="collect_33"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_33"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/10.jpg"><img src="Images/frame/frame5.png"></a><ul>
                <%if((stateListHomepage.get(33) == 1) ||(stateListHomepage.get(33)==3)){%>
                <li class="like" id="like_34"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_34"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(33) == 2) ||(stateListHomepage.get(33)==3)){ %>
                <li class="collect" id="collect_34"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_34"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/11.jpg"><img src="Images/frame/frame3.png"></a><ul>
                <%if((stateListHomepage.get(34) == 1) ||(stateListHomepage.get(34)==3)){%>
                <li class="like" id="like_35"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_35"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(34) == 2) ||(stateListHomepage.get(34)==3)){ %>
                <li class="collect" id="collect_35"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_35"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
            <li><a href="browse.jsp?photoName=Images/photos/scenery/12.jpg"><img src="Images/frame/frame7.png"></a><ul>
                <%if((stateListHomepage.get(35) == 1) ||(stateListHomepage.get(35)==3)){%>
                <li class="like" id="like_36"><img src="Images/liked.png">已赞</li>
                <% }else{ %>
                <li class="like" id="like_36"><img src="Images/like.png" >点赞</li>
                <% } %>
                <li class="comment"><img src="Images/comment.png">评论</li>
                <%  if((stateListHomepage.get(35) == 2) ||(stateListHomepage.get(35)==3)){ %>
                <li class="collect" id="collect_36"><img src="Images/collected.png">已收藏</li>
                <% }else{ %>
                <li class="collect" id="collect_36"><img src="Images/collect.png">收藏</li>
                <% } %>
            </ul></li>
        </ul>
    </div>
</div>
<script>

    function open1(){
        var id=$(this).attr("id");
        // console.log(id);
        location.href = "dealLike.jsp?stateToDeal="+id+"";
    }
    function open2(){
        var id=$(this).attr("id");
        // console.log(id);
        location.href = "dealCollect.jsp?stateToDeal="+id+"";

    }
    $("li[id^='like_']").on("click",open1);
    $("li[id^='collect_']").on("click",open2);

</script>


</body>
</html>
