<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro3.jsp</title>
</head>
<body>
<%
// 사용자가 입력한 내용을 http가 요청정보를 들고 서버에 전달
// 서버에 request, response 기억장소 만들고 request에 http가 들고 온 요청정보를 저장
// post방식으로 데이터를 가져오면 request 한글 설정
// request에서 파라미터(태그)값을 가져와서 => 변수에 저장 => 화면 출력

request.setCharacterEncoding("utf-8");
String id1 = request.getParameter("id");
String pw1 = request.getParameter("pw");
String gn1 = request.getParameter("gender");
// 이름 하나에 값이 여러개일 경우 request.getParameterValues() => 배열변수 저장
String hb1[] = request.getParameterValues("hobby");
String gd1 = request.getParameter("grade");
String in1 = request.getParameter("intro");
%>
아이디	: <%=id1 %><br>
비밀번호 	: <%=pw1 %><br>
성별		: <%=gn1 %><br>
취미주소	: <%=hb1 %><br>
취미내용 	:
<%
if(hb1 != null){
	for(int i = 0; i < hb1.length; i++){
		out.println(hb1[i]);
	}
}
%>
등급		: <%=gd1 %><br>
자기소개 	: <%=in1 %><br>
</body>
</html>