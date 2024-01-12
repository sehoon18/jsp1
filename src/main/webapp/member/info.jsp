<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
</head>
<body>
<%
MemberDTO mDTO = (MemberDTO)request.getAttribute("memberDTO");

if (mDTO.getId() != null){%>
아이디 : <%=mDTO.getId() %><br>
비밀번호 : <%=mDTO.getPass() %><br>
이름 : <%=mDTO.getName() %><br>
가입날짜 : <%=mDTO.getDate() %><br>
	
<%
} else{
	
}

%>
<a href="update.me"><button>회원정보변경</button></a>
<a href="delete.me"><button>회원정보삭제</button></a>
<a href="main.me"><button>뒤로가기</button></a>
</body>
</html>