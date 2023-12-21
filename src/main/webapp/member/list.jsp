<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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

MemberDAO mDAO = new MemberDAO();

ArrayList<MemberDTO> mList = mDAO.getMemberList();


%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
for (int i = 0; i < mList.size(); i++){
	MemberDTO mDTO = mList.get(i);
	%><tr><td><%=mDTO.getId() %></td>
	<td><%=mDTO.getPass() %></td>
	<td><%=mDTO.getName() %></td>
	<td><%=mDTO.getDate() %></td><%
}
%>
</table>
<a href="main.jsp"><button>뒤로가기</button></a>

</body>
</html>