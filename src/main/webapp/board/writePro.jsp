<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writePro.jsp</title>
</head>
<body>
<h1>board/writePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

int num = 1;
int readcount = 0;
Timestamp date = new Timestamp(System.currentTimeMillis());


BoardDTO bDTO = new BoardDTO();
bDTO.setNum(num);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadCount(readcount);
bDTO.setDate(date);

BoardDAO bDAO = new BoardDAO();
bDAO.insertBoard(bDTO);
num++;
%>
</body>
</html>