<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro2.jsp</title>
</head>
<body>
<%
// 스크립틀릿(scriptlet) : java, jsp코드 영역
// form2.jsp 에서 입력한 name, num 이름에 해당하는 값이 서버에 전달
// => 서버 request, response 기억장소 만들어짐 (객체생성)
// => request에 name, num 이름에 해당하는 값 등이 저장

// => request에서 name, num 이름에 해당하는 값을 가져와서 String 변수에 저장
// => <%= 변수를 출력(표현식)
String name = request.getParameter("name");
String num1 = request.getParameter("num");
%>
이름			: <%=name %><br>
좋아하는 숫자 	: <%=num1 %>

</body>
</html>