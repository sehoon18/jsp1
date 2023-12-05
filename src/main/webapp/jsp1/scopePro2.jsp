<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopePro2.jsp</title>
</head>
<body>
<h1>jsp1/scopePro2.jsp</h1>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>

아이디	: <%=id %><br>
비밀번호	: <%=pw %><br>

pageContext 값	: <%=pageContext.getAttribute("page") %><br>
request 값 		: <%=request.getAttribute("req") %><br>
session 값 		: <%=session.getAttribute("ses") %><br>
application 값	: <%=application.getAttribute("app") %><br>
</body>
</html>