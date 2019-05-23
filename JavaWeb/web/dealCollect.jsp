<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="CW.UsersDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/23 0023
  Time: 下午 2:59
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
        String stringId = "Photo_"+(index+1);
        int state2 = stateListHomepage.get(index);
        if(state2==0||state2==1){
            state2+=2;
            stateListHomepage.set(index,state2);
            session.setAttribute("statelist",stateListHomepage);
            UsersDAO.stateSave(String.valueOf(session.getAttribute("username")),stringId,stateListHomepage.get(index));
        }
        else if(state2==2||state2==3){
            state2-=2;
            stateListHomepage.set(index,state2);
            session.setAttribute("statelist",stateListHomepage);
        }
    %>
    window.location.href = "homepage.jsp";
</script>
</body>
</html>
