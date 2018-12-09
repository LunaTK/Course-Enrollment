<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML>
<html> 
<head>
	<style>
		#list td, #list th { 
		border: 1px dotted gray; 
		text-align: center; } 
		#list th { 
		color: white; 
		background-color: #84B1ED; } 
		#list tr.alt td { background-color: green;} 
	</style> 
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
		<h2>수업 목록 </h2>
		<%
			Connection conn = null;
			ResultSet rs = null;
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

			String query = "SELECT * FROM class";
			rs = stmt.executeQuery(query);
		%>
		<table id = "list" border="3" cellspacing="3">
			<tr>
				<th> 강의명 </th>
				<th> 강사명 </th>
				<th> 신청인원 </th>  
				<th> 허용인원 </th>  
				<th> 학점 </th>  
				<th> 신청 상태 </th>
			</tr>
			<%
				while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
			%>
			<tr>
				<td><%=rs.getString("class_name")%></td>
				<td><%=rs.getString("class_professor")%></td>
				<td><%=rs.getInt("class_people")%></td>
				<td><%=rs.getInt("class_max_people")%></td>
				<td><%=rs.getInt("class_credit")%></td>
				<td><%=rs.getString("class_state")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body> 
</html>