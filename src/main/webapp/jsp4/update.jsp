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
String sid = (String)session.getAttribute("id");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from members where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, sid);

ResultSet rs = pstmt.executeQuery();

if (rs.next()){
	%>
	<form action="updatePro.jsp" method="post">
	아이디 : <input type="text" name="id" value="<%=rs.getString("id") %>" readonly><br>
	비밀번호 : <input type="password" name="pass"><br>
	이름 : <input type="text" name="name" value="<%=rs.getString("name") %>"><br>
	<input type="submit" value="수정하기">
	<input type="button" value="취소" onclick="history.back();">
	</form>
	<%
	
}
%>

</body>
</html>