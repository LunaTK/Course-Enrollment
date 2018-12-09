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
		<h2>수업 등록 </h2>
		<form method="post">
			<table>
				<tr><td><label>학수번호</label></td>
				<td><input name="class_number" type="text"></td></tr>
				<tr><td><label>강의명</label></td>
				<td><input name="class_name" type="text"></td></tr>
				<tr><td><label>강사명</label></td>
				<td><input name="class_professor" type="text"></td></tr>
				<tr><td><label>수강인원</label></td>
				<td><input name="class_max_people" type="number"></td></tr>
				<tr><td><label>강의실</label></td>
				<td><input name="class_room" type="number"></td></tr>
				<tr><td><label>수강대상학년</label></td>
				<td><input name="class_year" type="number"></td></tr>
				<tr><td><label>수강학점</label></td>
				<td><input name="class_credit" type="number"></td></tr>
				<tr><td><label>강의 요일 </label></td>
					<!--td><input name="day_of_class" type="radio" value="월">월
						<input name="day_of_class" type="radio" value="화">화
						<input name="day_of_class" type="radio" value="수">수
						<input name="day_of_class" type="radio" value="목">목
						<input name="day_of_class" type="radio" value="금">금
					</td-->
				<td><input name="day_of_class" type="text"></td>	
				</tr>
				<tr><td><label>시작시간</label></td>
				<td><input name="start_time" type="number"></td></tr>
				<tr><td><label>종료시간</label></td>
				<td><input name="end_time" type="number"></td></tr>
			</table>
			<br>
			<button type="submit" class="register_btn">등록 </button>
		</form>
		<%
			String class_number = request.getParameter("class_number");
			String class_name = request.getParameter("class_name");
			String class_professor = request.getParameter("class_professor");
			String in_class_max_people = request.getParameter("class_max_people");
			String in_class_room = request.getParameter("class_room");
			String in_class_year = request.getParameter("class_year");
			String in_class_credit = request.getParameter("class_credit");
			String in_start_time = request.getParameter("start_time");
			String in_end_time = request.getParameter("end_time");
			String day_of_clas = request.getParameter("day_of_class");

			if(class_number != null && class_name != null && class_professor != null && in_class_max_people != null && in_class_room != null && in_class_year != null && in_class_credit != null && in_start_time != null && in_end_time != null && day_of_clas != null){
				int class_max_people = Integer.parseInt(in_class_max_people);
				int class_room = Integer.parseInt(in_class_room);
				int class_year = Integer.parseInt(in_class_year);
				int class_credit = Integer.parseInt(in_class_credit);
				int start_time = Integer.parseInt(in_start_time);
				int end_time = Integer.parseInt(in_end_time);
				
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
				//insert into class table 
				sqlStr = "INSERT INTO class (class_number, class_credit, class_max_people, class_name, class_professor, class_room, class_year, class_people, class_state) values (?,?,?,?,?,?,?,?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setString(1, class_number);
				preparedStmt.setInt(2, class_credit);
				preparedStmt.setInt(3, class_max_people);
				preparedStmt.setString(4, class_name);
				preparedStmt.setString(5, class_professor);
				preparedStmt.setInt(6, class_room);
				preparedStmt.setInt(7, class_year);
				preparedStmt.setInt(8, 0);
				preparedStmt.setString(9, "진행중");
				preparedStmt.execute();

				sqlStr = "SELECT class_id from class";
				ResultSet rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					int class_id = rset.getInt("class_id");
					sqlStr = "INSERT INTO class_time (class_id, start_time, end_time, day_of_class) values (?,?,?,?)";
					preparedStmt = conn.prepareStatement(sqlStr);
					preparedStmt.setInt(1, class_id);
					preparedStmt.setInt(2, start_time);
					preparedStmt.setInt(3, end_time);
					preparedStmt.setString(4, day_of_clas);
					preparedStmt.execute();
				}
				out.println("<script>alert('수업이 등록 되었습니다.');</script>");
			}
			else if(class_number != null || class_name != null || class_professor != null || in_class_max_people != null || in_class_room != null || in_class_year != null || in_class_credit != null || in_start_time != null || in_end_time != null || day_of_clas != null){
				out.println("<script>alert('빈칸을 모두 채워주세요.');</script>");
			}
		%>
	</div>
</body>
</html>