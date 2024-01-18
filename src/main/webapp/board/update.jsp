<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="bDTO"  value="${requestScope.boardDTO }"/>
	<form action="updatePro.bo" method="post">
	<input type="hidden" name="num" value="${bDTO.num }">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="${bDTO.name }" readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" value="${bDTO.subject }"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="10" cols="20" >${bDTO.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"><a href="main.me"><button>돌아가기</button></a></td>
			</tr>
		</table>
	</form>

	
</body>
</html>