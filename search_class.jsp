<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
	</div>
	<div id="nav">
		<ul>
			<li> <a href="modify_class.jsp">수업 수정, 삭제</a></li>
			<li> <a href="list_class.jsp">수업 목록 </a></li>
			<li> <a href="search_class.jsp">수업 검색</a></li>
			<li> <a href="wish_list.jsp">책가방</a></li>	
		</ul>
	</div>
	<div id="content">
		<h2>수업 검색 </h2>
		<form method="post">
			<table>
				<tr>
					<td><label>강의명</label></td>
					<td><input name="class_name" type="string"></td>
				</tr>
				<tr>
					<td><label>학년</label></td>
					<td><input name="class_year" type="string"></td>
				</tr>
				<tr>
					<td>신청 가능</td>
					<td>
						<select name="class_state"> 
					<option value="진행중" selected>진행중</option>
					<option value="폐강">폐강</option>  
					<option value="신청종료">신청종료</option> 
					</select> 
</td></tr>
			</table>
			
			<button type="submit" class="register_btn">검색 </button>
		</form>
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
	<%!
public String ChangeFormat(String time) {
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
		int i = 0;
				String in_class_name = request.getParameter("class_name");
				String in_class_year = request.getParameter("class_year");
				String in_class_state = request.getParameter("class_state");
				Connection conn = null;
				Connection con = null;
				ResultSet rs = null;
				ResultSet rc = null;
				Statement stmt = null;
				Statement stm = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
			if((in_class_name != null) || (in_class_year != null) ){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					stmt = conn.createStatement();
					con = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					stm = con.createStatement();
				
					String query = "SELECT * FROM class";
					rs = stmt.executeQuery(query);
					while(rs.next()){
						if((rs.getString(5).equals(in_class_name))|| (rs.getString(8).equals(in_class_year)) && (rs.getString(10).equals(in_class_state))){
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
	<td><a href="getting.jsp?get=<%=rs.getString(1)%>" onclick="OnButtonDown(this)">신청하기</a>
	</td>
</form>
<form action="wish_list.jsp" method="post">
	<td><a href="wish_list.jsp?del=<%=rs.getString(1)%>" onclick="OnButtonUp(this)">담기</a>
	</td>
	</tr>
		<%
						}
					}
  rs.close();        // ResultSet exit
  stmt.close();
stm.close();
con.close();
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
			}
%>
	</div>
</body>
</html>
