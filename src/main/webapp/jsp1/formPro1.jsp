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
// ����ڰ� �Է� ������ ������ ����(http) => ������ ��û���� ����(request) => request ��û������ �����ͼ� ���, DB���� ��
String sid = request.getParameter("id");
String spw = request.getParameter("pw");
%>
���̵� : <%=sid %>
��й�ȣ : <%=spw %>
</body>
</html>