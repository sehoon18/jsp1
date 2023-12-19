<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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

MemberDAO mDAO = new MemberDAO();
boolean result = mDAO.userCheck(id, pass);

if(result == true){
	MemberDTO mDTO = new MemberDTO();
	mDTO.setId(id);
	mDAO.deleteMember(mDTO);
	out.println("삭제완료");
	%><a href="login.jsp"><button>메인으로</button></a><%
} else {
	out.println("아이디/비밀번호 틀림");
	%><a href="login.jsp"><button>메인으로</button></a><%
}

%>
</body>
</html>