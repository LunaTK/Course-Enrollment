<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML>
<html> 
<head>
<script> 
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
		
</a>	
	<div id="nav">
		<ul>	
			<li> <a href="modify_class.jsp">수업 수정, 삭제</a></li>
			<li> <a href="list_class.jsp">수업 목록 </a></li>
			<li> <a href="search_class.jsp">수업 검색</a></li>
			<li> <a href="wish_list.jsp">책가방</a></li>	
		</ul>
	</div>
	
	<div id="content">
		<h2>책가방 </h2>
		<table id = "list">
		<%
				Connection conn = null;
				Connection con = null;
				ResultSet rs = null;
				ResultSet rc = null;
				Statement stm = null;
				Statement stmt = null;
				String sqlStr = null;
				int i=0;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=UTF-8&serverTimezone=UTC", "root", "sim6769");
					stmt = conn.createStatement();
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=UTF-8&serverTimezone=UTC", "root", "sim6769");
					stm = conn.createStatement();
					rc = stm.executeQuery("SELECT * FROM wish_list");

		while(rc.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
					rs = stmt.executeQuery("SELECT * FROM class");
		%>

<form action="getting.jsp" method="post">
<%
if(i == 0){
%>
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
	</tr>
<%
	i = 1;
}
%>
	<%
			while(rs.next()){
				if(rc.getString(2).equals(rs.getString(1))){
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
	  </tr>
	<%
				}
			}
		} // end while
	%>
<%
  rs.close();        // ResultSet exit
  rc.close();
  stm.close();
  stmt.close();     // Statement exit
  con.close();
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