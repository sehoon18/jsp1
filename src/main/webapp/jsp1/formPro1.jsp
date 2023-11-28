<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jsp1/formPro1.jsp</title>
</head>
<body>
<%
// 사용자가 입력 정보를 서버에 전달(http) => 서버에 요청정보 저장(request) => request 요청정보를 가져와서 출력, DB연결 비교
String sid = request.getParameter("id");
String spw = request.getParameter("pw");
%>
아이디 : <%=sid %>
비밀번호 : <%=spw %>
</body>
</html>