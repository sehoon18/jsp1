<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/info.jsp</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

MemberDAO mDAO = new MemberDAO();
MemberDTO mDTO = mDAO.getInfo(id);

if (id != null){%>
아이디 : <%=mDTO.getId() %><br>
비밀번호 : <%=mDTO.getPass() %><br>
이름 : <%=mDTO.getName() %><br>
가입날짜 : <%=mDTO.getDate() %><br>
	
<%
} else{
	
}

%>
<a href="update.jsp"><button>회원정보변경</button></a>
<a href="delete.jsp"><button>회원정보삭제</button></a>
<input type="button" value="뒤로가기" onclick="history.back();">
</body>
</html>