<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>--%>
<%--<%@ page import="CW.UsersDAO" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jsp学习</title>
    <style>
        .getIP{
            font-family: "微软雅黑";
            font-size: 20px;
            color: red;
        }
    </style>
</head>
<body>
<div class="getIP">
    <% out.print("你的IP地址是 " + request.getRemoteAddr()); %>
</div>
<%--所有获得的输出都可以改变样式--%>

<%--变量声明格式--%>
<% int a=5,b=2; %>
<% out.print("a + b = "+(a+b)); %>

<%--获得日期，直接获取值并打印时“=”必须接在前一个“%”后面，否则会报错，新建的日期类直接toString（）会打印出美式日期，另外所显示日期是固定的，不会滚动--%>
<p>
    今天的日期是：<%= (new java.util.Date()).toLocaleString() %>
</p>

<%--三种指令
<%@ page ... %> 定义页面的依赖属性，比如脚本语言、error页面、缓存需求等等
<%@ include ... %> 包含其他文件
<%@ taglib ... %> 引入标签库的定义，可以是自定义的标签
--%>

<%! int day = 3; %>
<% if (day == 1 | day == 7) { %>
<p>今天是周末</p>
<% } else { %>
<p>今天不是周末</p>
<% } %>

</body>
</html>
