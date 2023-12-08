<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/jdbcTest.jsp</title>
</head>
<body>
<h1>jsp3/jdbcTest.jsp</h1>
<%
// 웹서버에서 데이터베이스 서버에 접속해서 insert
// JDBC 프로그램 설지(Mysql에서 제공)
// mysql-connector-java-8.0.17.jar JDBC 프로그램(Mysql connector J 설치 후 생성됨)
// 이클립스 프로젝트 - src - main - webapp - WEB-INF - lib 폴더에 mysql-connector-java-8.0.17.jar 복사

// 1단계 : 설치한 JDBC 프로그램중에 Driver.class 자바 실행파일 불러오기
// Class 실행파일을 관리하는 자바 내장객체 java폴더 lang폴더 Class.java 파일
// java폴더 lang폴더(java.lang.class) => 기본폴더 위치 지정하지 않고 사용
// JDBC 프로그램 안에 com폴더 mysql폴더 cj폴더 jdbc폴더 Driver.class 실행파일
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계 불러온 파일을 이용해서 데이터베이스 연결
// (데이터베이스 주소, DB접속아이디, DB접속비밀번호) => 연결정보 저장
// import="java.sql.DriverManager
// java폴더 sql폴더 DriverManager.java 파일을 찾아서 가져와서 사용
// DriverManager : 불러온 Driver 파일을 이용해서 데이터베이스 연결

// 데이터베이스 주소 Mysql, Oracle DB마다 주소 정해짐
String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
// 데이터베이스 접속할 아이디/비밀번호
String dbUser = "root";
String dbPass = "1234";

Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
%>

연결성공 <%=con %>

</body>
</html>