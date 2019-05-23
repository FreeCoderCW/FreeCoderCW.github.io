<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/23 0023
  Time: 下午 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<script>

    <%
     List<Integer> stateListHomepage = new LinkedList<Integer>();
    stateListHomepage =(List<Integer>) session.getAttribute("statelist");
//    out.println(stateListHomepage);
        String string = request.getParameter("stateToDeal");
        int index = Integer.parseInt(string.split("_")[1])-1;
        int state1 = stateListHomepage.get(index);
        out.println(state1);
        if(state1==0||state1==2){
            state1+=1;
            stateListHomepage.set(index,state1);
            session.setAttribute("statelist",stateListHomepage);
        }
        else if(state1==1||state1==3){
            state1-=1;
            stateListHomepage.set(index,state1);
            session.setAttribute("statelist",stateListHomepage);
        }
    %>
    window.location.href = "homepage.jsp";
</script>
</body>
</html>
