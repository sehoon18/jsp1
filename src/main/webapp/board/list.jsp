<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<c:set var="pageDTO" value="${requestScope.pageDTO }"/>
<h1>글목록 [전체 글 개수 : ${pageDTO.count }]</h1>
<c:set var="boardList" value="${requestScope.boardList }"/>

<table border="1">
<tr><td width="100">번호</td><td  width="100">작성자</td><td width="200">제목</td><td width="100">조회수</td><td>작성일</td></tr>

<c:forEach var="boardDTO" items="${boardList }">
	<tr><td>${boardDTO.num }</td>
	<td>${boardDTO.name }</td>
	<td><a href="content.bo?num=${boardDTO.num }">${boardDTO.subject }</a></td>
	<td>${boardDTO.readcount }</td>
	<td>${boardDTO.date }</td></tr>
</c:forEach>

</table>

<a href="main.me"><button>메인으로</button></a>

<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
	<a href="list.bo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }"><button>이전</button></a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="list.bo?pageNum=${i }"><button>${i }</button></a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
	<a href="list.bo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }"><button>다음</button></a>
</c:if>

</body>
</html>