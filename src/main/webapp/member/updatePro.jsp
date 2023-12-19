<%@page import="member.MemberDTO"%>
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
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

MemberDAO mDAO = new MemberDAO();
boolean result = mDAO.userCheck(id, pass);

if (result == true){
	MemberDTO mDTO = new MemberDTO();
	mDTO.setName(name);
	mDTO.setId(id);
	mDAO.updateMember(mDTO);
	out.println("이름 변경 완료");
	response.sendRedirect("info.jsp");
} else {
	out.println("아이디/비밀번호 틀림");
	%><input type="button" value="뒤로가기" onclick="history.back();"><%
}

%>
</body>
</html>