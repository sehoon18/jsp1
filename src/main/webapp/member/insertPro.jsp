<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/insertPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

Timestamp date = new Timestamp(System.currentTimeMillis());

MemberDAO mDAO = new MemberDAO();
MemberDTO mDTO = mDAO.getInfo(id);

if (mDTO.getId() == null){
	mDAO.insertMember(id, pass, name, date);
	response.sendRedirect("login.jsp");
} else{
	%>아이디 중복<br>
	<a href="insert.jsp"><button>뒤로가기</button></a><%
}


%>
</body>
</html>