<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ResourceBundle" %>
<% request.setCharacterEncoding("utf-8"); %>

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
	<%
		if(session.getAttribute("is_admin")==null){
			out.println("<script type=\"text/javascript\">alert('권한이 필요합니다. 로그인을 해주세요.');location='login.jsp';</script>");
		}
	%>
	<div id="header">
		<a id="home_ref" href="index_admin.jsp">
			<img src='logo.jpg'>
		</a>	
	</div>
	<div style= "float: right">
<a href="logout.jsp">로그아웃</a>
	</div>
<br>
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
		<table id = "list" border="3" cellspacing="3">
			<tr>
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
				<th> 수정하기 </th>  
				<th> 삭제 </th>  
			</tr>
			<%!
				public String ChangeFormat(String time){
					int Length = time.length();
					String subString1 = "";
					String subString2 = "";
					if(Length == 3){
						 subString2 = time.substring(1, 3);
						 subString1 = time.substring(0, 1);
					}else{
						 subString2 = time.substring(2, 4);
						 subString1 = time.substring(0, 2);	
					}
					return subString1 + ":" + subString2;
				}
			%>
			<%
				String dayStr[] = {"월","화","수","목","금","토","일"};
				Connection conn = null;
				Connection con = null;
				ResultSet rs = null;
				ResultSet rc = null;
				Statement stmt = null;
				Statement stm = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					stmt = conn.createStatement();
					con = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					stm = con.createStatement();
					
					String query = "SELECT * FROM class";
					rs = stmt.executeQuery(query);
					while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
						String qu = "SELECT * FROM class_time where class_id = '" + rs.getInt(1) +"'";
						rc = stm.executeQuery(qu);
						String start = "";
						String ed = "";
						String day = "";
						String temp = "";
						while(rc.next()){
							temp = ChangeFormat(rc.getString(2));
							start = start + temp+ "<br />";
							temp = ChangeFormat(rc.getString(3));
							ed = ed + temp + "<br />";
							day = day + dayStr[rc.getInt(4)] + "<br />";
						} // end while
						rc.close();
			%>
			<tr>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%= start %></td>
				<td><%= ed %></td>
				<td><%= day %></td>
				
				<td><a href="admin_modify_class.jsp?class_id=<%=rs.getString(1)%>">수정하기</a></td>
				<td><a href="admin_delete_class.jsp?class_id=<%=rs.getString(1)%>">삭제</a></td>
			</tr>
			<%
					} // end while
			%>
			<%
					rs.close();        // ResultSet exit
					stmt.close();
					stm.close();
					con.close();
					conn.close();    // Connection exit
				}
				catch (SQLException e) {
				    out.println("err:"+e.toString());
				} 
			%>

		</table>
	</div>
</body> 
</html>
