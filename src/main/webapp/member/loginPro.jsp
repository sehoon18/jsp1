<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDAO ma = new MemberDAO();

boolean rs = ma.userCheck(id, pass);

if(rs == true){
	out.println("로그인 성공");
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
} else {
	out.println("로그인 실패");
	response.sendRedirect("login.jsp");
}

%>
</body>
</html>