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
		<a id="home_ref" href="index_professor.html">
			<img src='logo.jpg'>
		</a>	
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
		<h2>수업 수정, 삭제 </h2>
		<form method="post">
			<table>
				<tr><td><label>강의명</label></td>
				<td><input name="class_name" type="text" required></td></tr>
			</table>
			<button type="submit" class="register_btn">검색 </button>
		</form>
		<%
			String class_name = request.getParameter("class_name");
			int class_id = 0;
			int class_credit=0;
			int start_time=0;
			int end_time=0;
			int class_people=0;
			String class_professor =null;
			int class_room=0;
			int class_year = 0;
			String day_of_clas = null;
			if(class_name !=null){
				Connection conn = null;
				Statement stmt = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course", "lunatk", "Thtlf1210");
				}
				catch(Exception e){
					out.println("데이터베이스 접속에 문제가 있습니다. <hr>");
					out.println(e.getMessage());
					e.printStackTrace();
				}
				stmt = conn.createStatement();
				sqlStr = "select * from class where class_name ='"+class_name+"'";
				ResultSet rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					class_id = rset.getInt("class_id");
					class_credit = rset.getInt("class_credit");
					class_people = rset.getInt("class_people");
					class_professor = rset.getString("class_professor");
					class_room = rset.getInt("class_room");
					class_year = rset.getInt("class_year");
				}
				sqlStr = "select * from class_time where class_id="+class_id;
				rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					start_time = rset.getInt("start_time");
					end_time = rset.getInt("end_time");
					day_of_clas = rset.getString("day_of_class");
				}
			}
		%>

		<form method="post">
			<table>
				<tr><td><label>강의명</label></td>
				<td><input id="class_name" name="class_name" type="text"></td></tr>
				<tr><td><label>강사명</label></td>
				<td><input id="class_professor" name="class_professor" type="text"></td></tr>
				<tr><td><label>수강인원</label></td>
				<td><input id="class_people" name="class_people" type="number"></td></tr>
				<tr><td><label>강의실</label></td>
				<td><input id="class_room" name="class_room" type="number"></td></tr>
				<tr><td><label>수강대상학년</label></td>
				<td><input id="class_year" name="class_year" type="number"></td></tr>
				<tr><td><label>수강학점</label></td>
				<td><input id="class_credit" name="class_credit" type="number"></td></tr>
				<tr><td><label>시작시간</label></td>
				<td><input id="start_time" name="start_time" type="number"></td></tr>
				<tr><td><label>종료시간</label></td>
				<td><input id="end_time" name="end_time" type="number"></td></tr>
				<tr><td><label>강의 요일 </label></td>
				<td><input id="day_of_class" name="day_of_class" type="text"></td></tr>
			</table>
			<br>
			<button type="submit" class="register_btn">수정 </button>
		</form>
		<script type="text/javascript">
			document.getElementById("class_credit").value = <%= class_credit %>;
			document.getElementById("start_time").value = <%= start_time %>;
			document.getElementById("end_time").value = <%= end_time %>;
			document.getElementById("class_people").value = <%= class_people %>;
			document.getElementById("class_name").value = '<%=class_name%>';
			document.getElementById("class_professor").value = '<%= class_professor%>';
			document.getElementById("class_room").value = <%= class_room %>;
			document.getElementById("class_year").value = <%= class_year %>;
			document.getElementById("day_of_class").value = '<%= day_of_clas %>';
		</script>
		<%
			class_name = request.getParameter("class_name");
			class_professor = request.getParameter("class_professor");
			String in_class_people = request.getParameter("class_people");
			String in_class_room = request.getParameter("class_room");
			String in_class_year = request.getParameter("class_year");
			String in_class_credit = request.getParameter("class_credit");
			String in_start_time = request.getParameter("start_time");
			String in_end_time = request.getParameter("end_time");
			day_of_clas = request.getParameter("day_of_class");
			if(class_name!=null && class_professor!=null && in_class_people!=null && in_class_room !=null && in_class_year!=null && in_class_credit!=null && in_start_time!=null && in_end_time!=null && day_of_clas!=null){
				class_people = Integer.parseInt(in_class_people);
				class_room = Integer.parseInt(in_class_room);
				class_year = Integer.parseInt(in_class_year);
				class_credit = Integer.parseInt(in_class_credit);
				start_time = Integer.parseInt(in_start_time);
				end_time = Integer.parseInt(in_end_time);
				Connection conn = null;
				Statement stmt = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course", "lunatk", "Thtlf1210");
				}
				catch(Exception e){
					out.println("데이터베이스 접속에 문제가 있습니다. <hr>");
					out.println(e.getMessage());
					e.printStackTrace();
				}
				stmt = conn.createStatement();
				sqlStr = "update class set class_credit=?, class_people=?, class_name=?, class_professor=?, class_room=?, class_year=? where class_id=?";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_credit);
				preparedStmt.setInt(2, class_people);
				preparedStmt.setString(3, class_name);
				preparedStmt.setString(4, class_professor);
				preparedStmt.setInt(5, class_room);
				preparedStmt.setInt(6, class_year);
				preparedStmt.setInt(7, class_id);
				preparedStmt.execute();

				sqlStr = "update class_time set start_time=?, end_time=?, day_of_class=? where class_id=?";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, start_time);
				preparedStmt.setInt(2, end_time);
				preparedStmt.setString(3, day_of_clas);
				preparedStmt.setInt(4, class_id);
				preparedStmt.execute();
				out.println("<script>alert('수업이 수정 되었습니다.');</script>");
			}
		%>
	</div>
</body>
</html>