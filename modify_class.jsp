<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
	<title> 수업 수정, 삭제 </title>
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
		<h2>수업 수정 </h2>
		<form method="post">
			<table>
				<tr><td><label>학수번호</label></td>
				<td><input name="class_number" type="int"></td></tr>
			</table>
			<button type="submit" class="register_btn">검색 </button>
		</form>
		<%
			String in_class_number = request.getParameter("class_number");
			int class_credit=0;
			int class_start_time=0;
			int class_end_time=0;
			int class_people=0;
			String class_name=null;
			String professor =null;
			int room_number=0;
			int student_year = 0;
			if(in_class_number !=null){
				int class_number = Integer.parseInt(in_class_number);
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
				sqlStr = "select * from class where class_number ="+in_class_number;
				ResultSet rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					class_credit = rset.getInt("class_credit");
					class_start_time = rset.getInt("class_start_time");
					class_end_time = rset.getInt("class_end_time");
					class_people = rset.getInt("class_people");
				}
				sqlStr = "select * from class_name_table where class_number="+in_class_number;
				rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					class_name = rset.getString("class_name");
				}
				sqlStr = "select * from class_professor where class_number="+in_class_number;
				rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					professor = rset.getString("professor");
				}
				sqlStr = "select * from class_room_year where class_number="+in_class_number;
				rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					room_number = rset.getInt("room_number");
					student_year = rset.getInt("student_year");
				}

			}
		%>
		
		<form method="post">
			<table>
				<tr><td><label>강의명</label></td>
				<td><input id="class_name" name="class_name" type="text"></td></tr>
				<tr><td><label>강사명</label></td>
				<td><input id="professor" name="professor" type="text"></td></tr>
				<tr><td><label>수강인원</label></td>
				<td><input id="class_people" name="class_people" type="number"></td></tr>
				<tr><td><label>강의실</label></td>
				<td><input id="room_number" name="room_number" type="number"></td></tr>
				<tr><td><label>수강대상학년</label></td>
				<td><input id="student_year" name="student_year" type="number"></td></tr>
				<tr><td><label>수강학점</label></td>
				<td><input id="class_credit" name="class_credit" type="number"></td></tr>
				<tr><td><label>시작시간</label></td>
				<td><input id="class_start_time" name="class_start_time" type="number"></td></tr>
				<tr><td><label>종료시간</label></td>
				<td><input id="class_end_time" name="class_end_time" type="number"></td></tr>
			</table>
			<br>
			<button type="submit" class="register_btn">수정 </button>
		</form>
		<script type="text/javascript">
			document.getElementById("class_credit").value = <%= class_credit %>;
			document.getElementById("class_start_time").value = <%= class_start_time %>;
			document.getElementById("class_end_time").value = <%= class_end_time %>;
			document.getElementById("class_people").value = <%= class_people %>;
			document.getElementById("class_name").value = '<%=class_name%>';
			document.getElementById("professor").value = '<%=professor%>';
			document.getElementById("room_number").value = <%= room_number %>;
			document.getElementById("student_year").value = <%= student_year %>;
		</script>

		<%--
			String class_name = request.getParameter("class_name");
			String professor = request.getParameter("professor");
			String in_class_people = request.getParameter("class_people");
			String in_room_number = request.getParameter("room_number");
			String in_student_year = request.getParameter("student_year");
			String in_class_credit = request.getParameter("class_credit");
			String in_class_start_time = request.getParameter("class_start_time");
			String in_class_end_time = request.getParameter("class_end_time");

			if(class_name != null && professor != null && in_class_people != null && in_room_number != null && in_student_year != null && in_class_credit != null && in_class_start_time != null && in_class_end_time != null){
				
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
			else if(class_name != null || professor != null || in_class_people != null || in_room_number != null || in_student_year != null || in_class_credit != null || in_class_start_time != null || in_class_end_time != null){
				out.println("<script>alert('빈칸을 모두 채워주세요.');</script>");
			}
		--%>
	</div>
</body>
</html>