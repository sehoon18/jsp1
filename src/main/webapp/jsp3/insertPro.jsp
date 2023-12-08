<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<h1>jsp3/insertPro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
%>
학생번호 : <%=num %><br>
학생이름 : <%=name %><br>
<%
// 1단계 : 설치한 JDBC프로그램중에 Driver 파일을 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 : 불러온 파일을 이용해서 데이터베이스 연결(데이터베이스 주소, DB접속아이디, DB접속비밀번호) => 연결정보 저장
String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";

Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 : 연결정보를 이용해서 sql구문을 만들고 실행할 수 있는 객체 생성
// String sql = "insert into student (num, name) values(" + num + ", '" + name +"')";
String sql = "insert into student(num, name) values(?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
// 첫번째 ?값을 넣을 때 정수형 setInt(?순서, 값);
pstmt.setInt(1, num);
// 두번째 ?값을 넣을 때 문자열형 setString(?순서, 값);
pstmt.setString(2, name);

// 4단계 : sql구문 실행(insert, update, delete) 실행 후 결과 저장(select)
pstmt.executeUpdate();
%>
학생등록성공 <%=pstmt %>
</body>
</html>