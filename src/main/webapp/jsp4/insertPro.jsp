<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<h2>회원가입</h2>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

Timestamp date = new Timestamp(System.currentTimeMillis());

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "insert into members(id, pass, name, date) values(?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4, date);

pstmt.executeUpdate();

response.sendRedirect("login.jsp");
%>
</body>
</html>