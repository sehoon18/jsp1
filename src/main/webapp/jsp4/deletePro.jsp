<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
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
String id = request.getParameter("id");
String pass = request.getParameter("pass");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "Select * from members where id = ? and pass = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);

ResultSet rs = pstmt.executeQuery();

if(rs.next()){
	String sql2 = "delete from members where id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, id);
	
	pstmt2.executeUpdate();
	out.println("삭제완료");
	%><a href="login.jsp"><button>메인으로</button></a><%
} else {
	out.println("아이디/비밀번호 틀림");
}

%>
</body>
</html>