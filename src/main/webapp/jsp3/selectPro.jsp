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
<title>jsp3/selectPro.jsp</title>
</head>
<body>
<h1>jsp3/selectPro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";

Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from student where num = ?";

PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);

ResultSet rs = pstmt.executeQuery();
%>

<table border="1">
<%
while(rs.next()){
	%><tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr><%
}
%>

</table>
</body>
</html>