<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<h1>글목록</h1>
<%

BoardDAO bDAO = new BoardDAO();
ArrayList<BoardDTO> bList = bDAO.getBoardList();
%>
<table>
<tr><td width="100">번호</td><td  width="100">작성자</td><td  width="200">제목</td><td width="100">조회수</td><td>작성일</td></tr>
<%
for(int i = 0; i < bList.size(); i++){
	BoardDTO bDTO = bList.get(i);%>
	<tr><td><%=bDTO.getNum() %></td>
	<td><%=bDTO.getName() %></td>
	<td><a href="content.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></td>
	<td><%=bDTO.getReadCount() %></td>
	<td><%=bDTO.getDate() %></td></tr>

<%

}
%>
<a href="../member/main.jsp"><button>메인으로</button></a>

</table>

</body>
</html>