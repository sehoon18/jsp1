<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
</head>
<body>
<h1>board/content.jsp</h1>
<%
String id = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO bDAO = new BoardDAO();
BoardDTO bDTO = bDAO.getBoardContent(num);
bDAO.updateReadcount(num);
%>
<table border="1">
<tr><td>글번호</td><td><%=bDTO.getNum() %></td></tr>
<tr><td>작성자</td><td><%=bDTO.getName() %></td></tr>
<tr><td>작성일</td><td><%=bDTO.getDate() %></td></tr>
<tr><td>제목</td><td><%=bDTO.getSubject() %></td></tr>
<tr><td>내용</td><td width="200" height="300"><%=bDTO.getContent() %></td></tr>
<tr><td>조회수</td><td><%=bDTO.getReadCount() %></td></tr>

</table>
<a href="list.jsp"><button>뒤로가기</button></a>
<%
if (id != null){
	if(id.equals(bDTO.getName())){
		%>
		<a href="update.jsp?num=<%=bDTO.getNum() %>"><button>글수정</button></a>
		<a href="delete.jsp?num=<%=bDTO.getNum() %>"><button>글삭제</button></a>
		<%
	}
}
%>


</body>
</html>