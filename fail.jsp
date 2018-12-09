<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML>
<html> 
<head>
<script> 
alert("강의가 꽉찼습니다.");
function OnButtonDown(button) {
	alert('수업이 등록 되었습니다.');
} 
function OnButtonUp(button) {
	alert('책가방에 담겼습니다.');
} 
</script> 
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
		
<a id="home_ref" href="index_student.html">
			
<img src='logo.jpg'>
	</div>
		
</a>	
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
		<h2>수업 목록 </h2>
		<table id = "list">
		<%
				Connection conn = null;
				ResultSet rs = null;
				Statement stmt = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=UTF-8&serverTimezone=UTC", "root", "sim6769");
					stmt = conn.createStatement();

					String query = "SELECT * FROM class";
					rs = stmt.executeQuery(query);
		%>

<form action="getting.jsp" method="post">
<table id = "list" border="3" cellspacing="3">
	<tr class>
	<th> 강의명 </th>
		<th> 강사명 </th>
		<th> 신청인원 </th>  
		<th> 허용인원 </th>  
		<th> 학점 </th>  
		<th> 수강 대상 학년 </th> 
		<th> 강의실 </th> 
		<th> 시작 시간 </th>  
		<th> 끝나는 시간</th>  
		<th> 강의 날짜</th>  
		<th> 신청하기 </th>  
		<th> 담기 </th>  
	</tr>
	<%
		while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
	%><tr>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(9)%></td>
	<td><%=rs.getString(8)%></td>
	<td><%=rs.getString(10)%></td>
	<td><%=rs.getString(11)%></td>
	<td><%=rs.getString(12)%></td>
	<td><a href="getting.jsp?get=<%=rs.getString(1)%>" onclick="OnButtonDown(this)">신청하기</a>
	</td>
</form>
<form action="wish.jsp" method="post">
	<td><a href="wish.jsp?del=<%=rs.getString(1)%>" onclick="OnButtonUp(this)">담기</a>
	</td>
	</tr>
	<%
		} // end while
	%>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>

</form>
</table>
	</div>
</body> 
</html>
