<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
	<title> 관리자페이지 </title>	
	<link rel="stylesheet" href="css/admin.css">
</head>

<body>
	<%
		if(session.getAttribute("is_admin")==null){
			out.println("<script type=\"text/javascript\">alert('권한이 필요합니다. 로그인을 해주세요.');location='index.html';</script>");
		}
	%>
	<div id="header">
		<a id="home_ref" href="index_admin.jsp">
			<img src='logo.jpg'>
		</a>	
	</div>
	<div style= "float: right">
		<a href="login.jsp">로그아웃</a>
	</div>
	<div id="nav">
		<ul>
			<li> <a href="register_student.jsp">학생 등록</a></li>
			<li> <a href="register_class.jsp">수업 등록 </a></li>
			<li> <a href="modify_class.jsp">수업 수정, 삭제</a></li>
			<li> <a href="list_class_admin.jsp">수업 목록 </a></li>
			<li> <a href="search_class_admin.jsp">수업 검색</a></li>
		</ul>
	</div>
	
	<div id="content">	
		<h2>관리자 페이지 안내</h2>
				
		1)학생등록: 학번, 비밀번호, 이름, 학년, 허용학점<br>
		2)수업등록(수업정정): 강의명, 강사명, 수강인원, 강의실, 수강대상학년<br>
		3)수업수정, 수업삭제(폐강)<br>
		4)수업목록: 강의명, 강사명, 신청인원, 허용인원, 학점, 신청상태<br>
		5)수업검색: 신청상태검색(폐강, 진행중, 신청종료), 강사명, 강의명, 학점, 대상학년<br>
		-폐강: 신청인5명이하/ 신청종료: 허용인원만큼신청한경우<br>
	</div>
</body>
</html>