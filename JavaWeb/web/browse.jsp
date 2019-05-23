<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>浏览模式</title>
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
        .lay_top .back{
            display: inline-block;
            width: 100px;
            height: 50px;
            margin-right: 30px;
            background-image: url("Images/wood.jpg");
            text-align: center;
            line-height: 50px;
            box-shadow: 5px 5px 10px #999999;
            border-radius: 5px;
            position: absolute;
            left: 40%;
            top: 30%;
            text-decoration-line: none;
            color: white;
            font-size: 25px;
        }
        .lay_top a:hover{
            color:gray;
            animation: shake 0.3s linear 0s normal;
        }
        .display{
            width: 1000px;
            height: 650px;
            background-color: white;
            margin: 10px auto;
            position: relative;
            background:url("Images/background_display.jpg") 0 0 no-repeat;
            background-size: 1000px 650px;
            overflow: hidden;
        }
        .display>button{
            display: inline-block;
            background-color: #999999;
            position: absolute;
            width: 50px;
            height: 60px;
            text-align: center;
            line-height: 50px;
            color:white;
            font-size: 40px;
            border-radius: 5px;
            opacity: 0.5;
        }
        .display>button:hover{
            opacity: 1;
        }
        .display>button:nth-child(1){
            left:0px;
            top:250px;
        }
        .display>button:nth-child(2){
            right:0px;
            top:250px;
        }

        .display #photo{
            height: 500px;
            width: 1000px;
            background-color: transparent;
            margin: 20px auto;
            text-align: center;
        }
        .display #photo img{
            height: 500px;
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
    </style>
</head>
<body>
<div class="lay_top">
    <img src="Images/logo.png" class="logo">
    <a href="homepage.jsp" class="back">返回</a>
    <img src="Images/navphoto1.png" class="photo1">
    <img src="Images/navphoto2.png" class="photo2">
</div>
<div class="display">
    <button id="previous" onclick="previousPhoto()">&ltcc;</button><button id="next" onclick="nextPhoto()">&gtcc;</button>
    <script>
        function nextPhoto() {
            var img=document.getElementById("display_photo");
            var getNum=img.src.match(/\d+(?=(.png|.jpg))/g);
            if(getNum>=1&&getNum<=11)getNum++;
            else if(getNum==12)getNum=1;
            var url;
            if(img.src.indexOf("people")!=-1) url="Images/photos/people/people"+getNum+".png";
            else if(img.src.indexOf("animal")!=-1) url="Images/photos/animal/animal"+getNum+".jpg";
            else if(img.src.indexOf("scenery")!=-1) url="Images/photos/scenery/"+getNum+".jpg";
            img.src=url;
        }
        function previousPhoto() {
            var img=document.getElementById("display_photo");
            var getNum=img.src.match(/\d+(?=(.png|.jpg))/g);
            if(getNum>=2&&getNum<=12)getNum--;
            else if(getNum==1)getNum=12;
            var url;
            if(img.src.indexOf("people")!=-1) url="Images/photos/people/people"+getNum+".png";
            else if(img.src.indexOf("animal")!=-1) url="Images/photos/animal/animal"+getNum+".jpg";
            else if(img.src.indexOf("scenery")!=-1) url="Images/photos/scenery/"+getNum+".jpg";
            img.src=url;
        }
    </script>

    <div id="photo">
        <img src="<%=request.getParameter("photoName") %>" id="display_photo">
    </div>
</div>
</body>
</html>