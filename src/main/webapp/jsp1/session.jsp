<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<%
// 세션기억장소 삭제
// 1) 사용자가 사용하는 브라우저를 모드 닫았을 때
// 2) 사용자가 서버에 30분동안 접근을 하지 않았을때
// 3) 사용자 로그아웃(세션 삭제 명령)
%>
세션 id : <%=session.getId() %><br>
세션 만든 시간 : <%=session.getCreationTime() %><br>
세션 마지막 접근시간 : <%=session.getLastAccessedTime() %><br>
세션 유지 시간 : <%=session.getMaxInactiveInterval() %><br>
세션 유지시간 변경
<%
session.setMaxInactiveInterval(3600);
%><br>
세션기억장소 전체삭제 명령
<%
// session.invalidate();
%><br>
세션 영역에 속성을 생성()
<%
session.setAttribute("sessionName", "sessionValue");
%><br>
저장된 세션값 가져오기 : <%=session.getAttribute("sessionName") %>

</body>
</html>