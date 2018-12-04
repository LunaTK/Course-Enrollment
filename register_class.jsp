<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
	<title> 수업 등록 </title>
	<link rel="stylesheet" href="css/admin.css">
</head>
<body>
	<div id="header">
		<a id="home_ref" href="index.html">
			<img src='logo.jpg'>
		</a>	
	</div>
	<div id="nav">
		<ul>
			<li> <a href="register_student.jsp">학생 등록</a></li>
			<li> <a href="register_class.jsp">수업 등록 </a></li>
			<li> <a href="modify_class.jsp">수업 수정, 삭제</a></li>
			<li> <a href="list_class.jsp">수업 목록 </a></li>
			<li> <a href="search_class.jsp">수업 검색</a></li>
		</ul>
	</div>
	<div id="content">
		<h2>수업 등록 </h2>
		<form method="post">
			<table>
				<tr><td><label>학수번호</label></td>
				<td><input name="class_number" type="int"></td></tr>
				<tr><td><label>강의명</label></td>
				<td><input name="class_name" type="text"></td></tr>
				<tr><td><label>강사명</label></td>
				<td><input name="professor" type="text"></td></tr>
				<tr><td><label>수강인원</label></td>
				<td><input name="class_people" type="number"></td></tr>
				<tr><td><label>강의실</label></td>
				<td><input name="room_number" type="number"></td></tr>
				<tr><td><label>수강대상학년</label></td>
				<td><input name="student_year" type="number"></td></tr>
				<tr><td><label>수강학점</label></td>
				<td><input name="class_credit" type="number"></td></tr>
				<tr><td><label>시작시간</label></td>
				<td><input name="class_start_time" type="number"></td></tr>
				<tr><td><label>종료시간</label></td>
				<td><input name="class_end_time" type="number"></td></tr>
			</table>
			<br>
			<button type="submit" class="register_btn">등록 </button>
		</form>
		<%
			String in_class_number = request.getParameter("class_number");
			String class_name = request.getParameter("class_name");
			String professor = request.getParameter("professor");
			String in_class_people = request.getParameter("class_people");
			String in_room_number = request.getParameter("room_number");
			String in_student_year = request.getParameter("student_year");
			String in_class_credit = request.getParameter("class_credit");
			String in_class_start_time = request.getParameter("class_start_time");
			String in_class_end_time = request.getParameter("class_end_time");

			if(in_class_number != null && class_name != null && professor != null && in_class_people != null && in_room_number != null && in_student_year != null && in_class_credit != null && in_class_start_time != null && in_class_end_time != null){
				int class_number = Integer.parseInt(in_class_number);
				int class_people = Integer.parseInt(in_class_people);
				int room_number = Integer.parseInt(in_room_number);
				int student_year = Integer.parseInt(in_student_year);
				int class_credit = Integer.parseInt(in_class_credit);
				int class_start_time = Integer.parseInt(in_class_start_time);
				int class_end_time = Integer.parseInt(in_class_end_time);
				
				Connection conn = null;
				Statement stmt = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Proj2", "root", "111111");
				}
				catch(Exception e){
					out.println("데이터베이스 접속에 문제가 있습니다. <hr>");
					out.println(e.getMessage());
					e.printStackTrace();
				}
				stmt = conn.createStatement();
				//insert into class table 
				sqlStr = "INSERT INTO class values (?,?,?,?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_number);
				preparedStmt.setInt(2, class_credit);
				preparedStmt.setInt(3, class_start_time);
				preparedStmt.setInt(4, class_end_time);
				preparedStmt.setInt(5, class_people);
				preparedStmt.execute();
				//insert into class_name_table table
				sqlStr = "INSERT INTO class_name_table values(?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_number);
				preparedStmt.setString(2, class_name);
				preparedStmt.execute();
				//insert into class_professor table
				sqlStr = "INSERT INTO class_professor values(?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_number);
				preparedStmt.setString(2, professor);
				preparedStmt.execute();
				//insert into class_room_year table
				sqlStr = "INSERT INTO class_room_year values (?,?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_number);
				preparedStmt.setInt(2, room_number);
				preparedStmt.setInt(3, student_year);
				preparedStmt.execute();
				out.println("<script>alert('수업이 등록 되었습니다.');</script>");
			}
			else if(in_class_number != null || class_name != null || professor != null || in_class_people != null || in_room_number != null || in_student_year != null || in_class_credit != null || in_class_start_time != null || in_class_end_time != null){
				out.println("<script>alert('빈칸을 모두 채워주세요.');</script>");
			}
		%>
	</div>
</body>
</html>