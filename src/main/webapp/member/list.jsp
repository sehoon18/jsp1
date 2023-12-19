<%@page import="java.sql.Timestamp"%>
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
String id = (String)session.getAttribute("id");
if (id != null){
	if(id.equals("admin")){
		
	} else{
		response.sendRedirect("main.jsp");
	}
} else{
	response.sendRedirect("login.jsp");
}
Class.forName("com.mysql.cj.jdbc.Driver");

Timestamp date = new Timestamp(System.currentTimeMillis());

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from members";
PreparedStatement pstmt = con.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery();

%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
while (rs.next()){
	%><tr><td><%=rs.getString("id") %></td><td><%=rs.getString("pass") %></td><td><%=rs.getString("name") %></td><td><%=rs.getTimestamp("date") %></td><%
}
%>
</table>
<a href="main.jsp"><button>뒤로가기</button></a>

</body>
</html>