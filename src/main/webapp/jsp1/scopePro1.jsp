<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro1.jsp</title>
</head>
<body>
<h1>jsp1/scopePro1.jsp</h1>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

pageContext.setAttribute("page", "pageValue");
request.setAttribute("req", "requestValue");
session.setAttribute("ses", "sessionValue");
application.setAttribute("app", "applicationValue");
%>
아이디	: <%=id %><br>
비밀번호	: <%=pw %><br>

pageContext 값	: <%=pageContext.getAttribute("page") %><br>
request 값 		: <%=request.getAttribute("req") %><br>
session 값 		: <%=session.getAttribute("ses") %><br>
application 값	: <%=application.getAttribute("app") %><br>

<a href="scopePro2.jsp">scopePro2로 이동</a><br>
<a href="scopePro2.jsp?id=<%=id%>&pw=<%=pw%>">scopePro2 get방식으로 데이터 요청하면서 이동</a><br>
<%
// response.sendRedirect("scopePro2.jsp?id=" + id + "&pw=" + pw);
%>
</body>
</html>