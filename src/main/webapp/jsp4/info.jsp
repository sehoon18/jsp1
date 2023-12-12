<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/info.jsp</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from members where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,id);

ResultSet rs = pstmt.executeQuery();

while (rs.next()){
	out.println("id :" + rs.getString("id") + "<br>");
	out.println("pass : " + rs.getString("pass") + "<br>");
	out.println("이름 : " + rs.getString("name") + "<br>");
	out.println("가입날짜 : " + rs.getTimestamp("date") + "<br>");
}

%>
</body>
</html>