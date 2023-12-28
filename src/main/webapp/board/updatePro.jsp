<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Timestamp date = new Timestamp(System.currentTimeMillis());

BoardDAO bDAO = new BoardDAO();
BoardDTO bDTO = new BoardDTO();
bDTO.setNum(num);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);

bDAO.updateBoard(bDTO);
response.sendRedirect("content.jsp?num=" + bDTO.getNum());
%>
</body>
</html>