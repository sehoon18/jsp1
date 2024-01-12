<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@page import="com.itwillbs.dao.BoardDAO"%>
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
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO bDAO = new BoardDAO();
BoardDTO bDTO = bDAO.getBoardContent(num);

%>
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=bDTO.getNum() %>">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=bDTO.getName() %>" readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" value="<%=bDTO.getSubject() %>"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="10" cols="20" ><%=bDTO.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"><a href="../member/main.jsp"><button>돌아가기</button></a></td>
			</tr>
		</table>
	</form>

	
</body>
</html>