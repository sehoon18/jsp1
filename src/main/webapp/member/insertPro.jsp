<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

Timestamp date = new Timestamp(System.currentTimeMillis());

MemberDAO mDAO = new MemberDAO();
mDAO.insertMember(id, pass, name, date);

response.sendRedirect("login.jsp");

%>
</body>
</html>