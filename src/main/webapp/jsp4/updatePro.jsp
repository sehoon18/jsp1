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
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");


Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from members where id = ? and pass = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);

ResultSet rs = pstmt.executeQuery();

if (rs.next()){
	String sql2 = "update members set name = ?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, name);
	
	pstmt2.executeUpdate();
	out.println("이름 변경 완료");
	response.sendRedirect("info.jsp");
} else {
	out.println("아이디/비밀번호 틀림");
	%><input type="button" value="뒤로가기" onclick="history.back();"><%
}

%>
</body>
</html>