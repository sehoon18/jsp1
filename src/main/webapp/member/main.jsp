<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("login.me");
}
%>
<%=id %>님이 로그인하셨습니다.<br>
<a href="info.me"><button>회원정보</button></a>
<a href="logout.me"><button>로그아웃</button></a>
<%
if(id != null){
	if(id.equals("admin")){
		%><a href="list.me"><button>회원목록</button></a> <%
	}
}

%>
<a href="write.bo"><button>글쓰기</button></a>
<a href="list.bo"><button>글목록</button></a>

</body>
</html>