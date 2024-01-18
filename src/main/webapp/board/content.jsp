<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
</head>
<body>
<h1>board/content.jsp</h1>
<%
// String id = (String)session.getAttribute("id");
// int num = Integer.parseInt(request.getParameter("num"));
// BoardDAO bDAO = new BoardDAO();
// BoardDTO bDTO = bDAO.getBoardContent(num);
// bDAO.updateReadcount(num);
%>
<c:set var="bDTO" value="${requestScope.boardDTO }"/>

<table border="1">
<tr><td>글번호</td><td>${bDTO.num }</td></tr>
<tr><td>작성자</td><td>${bDTO.name }</td></tr>
<tr><td>작성일</td><td>${bDTO.date }</td></tr>
<tr><td>제목</td><td>${bDTO.subject }</td></tr>
<tr><td>내용</td><td width="200" height="300">${bDTO.content }</td></tr>
<tr><td>조회수</td><td>${bDTO.readcount }</td></tr>
</table>

<a href="list.bo"><button>뒤로가기</button></a>
<c:if test="${not empty sessionScope.id }">
	<c:if test="${sessionScope.id eq bDTO.name }">
		<a href="update.bo?num=${bDTO.num }"><button>글수정</button></a>
		<a href="delete.bo?num=${bDTO.num }"><button>글삭제</button></a>
	</c:if>
</c:if>

</body>
</html>