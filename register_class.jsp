<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
	<title> 수업 등록 </title>
	<link rel="stylesheet" href="css/admin.css">
	<script type="text/javascript">
		var time_count = 1;
		function add_time(){
			var tbody = document.getElementById("class_tbody");
			var row = tbody.insertRow(tbody.rows.length);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var str1 = "<label>강의 요일 </label>";
			var str2 = "<input name='day_of_class"+time_count.toString()+"' type='radio' value='0' required>월 <input name='day_of_class"+time_count.toString()+"' type='radio'value='1'>화 <input name='day_of_class"+time_count.toString()+"' type='radio' value='2'>수 <input name='day_of_class"+time_count.toString()+"' type='radio' value='3'>목 <input name='day_of_class"+time_count.toString()+"' type='radio' value='4'>금";
			cell1.innerHTML=str1;
			cell2.innerHTML=str2;

			row = tbody.insertRow(tbody.rows.length);
			cell1 = row.insertCell(0);
			cell2 = row.insertCell(1);
			str1 = "<label>시작시간</label>";
			str2 = "<input name='start_time' type='number' required>";
			cell1.innerHTML=str1;
			cell2.innerHTML=str2;

			row = tbody.insertRow(tbody.rows.length);
			cell1 = row.insertCell(0);
			cell2 = row.insertCell(1);
			str1 = "<label>종료시간</label>";
			str2 = "<input name='end_time' type='number' required>";
			cell1.innerHTML=str1;
			cell2.innerHTML=str2;
			time_count +=1 ;
		}
		function delete_time(){
			var tbody = document.getElementById("class_tbody");
			if (tbody.rows.length<=10) return;
			tbody.deleteRow(tbody.rows.length-1);
			tbody.deleteRow(tbody.rows.length-1);
			tbody.deleteRow(tbody.rows.length-1);
			time_count -=1;
		}
	</script>
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
			<input id="time_count" name="time_count" type="hidden" value=1>
			<table>
				<tbody id="class_tbody">
					<tr><td><label>강의명</label></td>
					<td><input name="class_name" type="text" required></td></tr>
					<tr><td><label>강사명</label></td>
					<td><input name="class_professor" type="text" required></td></tr>
					<tr><td><label>수강인원</label></td>
					<td><input name="class_max_people" type="number" required></td></tr>
					<tr><td><label>강의실</label></td>
					<td><input name="class_room" type="number" required></td></tr>
					<tr><td><label>수강대상학년</label></td>
					<td><input name="class_year" type="number" required></td></tr>
					<tr><td><label>수강학점</label></td>
					<td><input name="class_credit" type="number" required></td></tr>
					<tr><td><label>강의 요일 </label></td>
						<td><input name="day_of_class0" type="radio" value="0" required>월
							<input name="day_of_class0" type="radio" value="1">화
							<input name="day_of_class0" type="radio" value="2">수
							<input name="day_of_class0" type="radio" value="3">목
							<input name="day_of_class0" type="radio" value="4">금
						</td>	
					</tr>
					<tr><td><label>시작시간</label></td>
					<td><input name="start_time" type="number" required></td></tr>
					<tr><td><label>종료시간</label></td>
					<td><input name="end_time" type="number" required></td></tr>
				</tbody>
			</table>
			<br>
			<button type="button" class="register_btn" onclick="add_time();">강의 시간 추가</button>/
			<button type="button" class="register_btn" onclick="delete_time();">삭제</button>
			<br>
			<button type="submit" class="register_btn">등록 </button>
		</form>
		
		<%
			String class_name = request.getParameter("class_name");
			String class_professor = request.getParameter("class_professor");
			String in_class_max_people = request.getParameter("class_max_people");
			String in_class_room = request.getParameter("class_room");
			String in_class_year = request.getParameter("class_year");
			String in_class_credit = request.getParameter("class_credit");
			String in_time_count = request.getParameter("time_count");
			String[] in_start_time = request.getParameterValues("start_time");
			String[] in_end_time = request.getParameterValues("end_time");
			int i;
			if(class_name != null && class_professor != null && in_class_max_people != null && in_class_room != null && in_class_year != null && in_class_credit != null){
				int class_max_people = Integer.parseInt(in_class_max_people);
				int class_room = Integer.parseInt(in_class_room);
				int class_year = Integer.parseInt(in_class_year);
				int class_credit = Integer.parseInt(in_class_credit);
				int time_count = Integer.parseInt(in_time_count);
				int []start_time = new int[in_start_time.length];
				for(i=0;i<in_start_time.length;i++){
					start_time[i] = Integer.parseInt(in_start_time[i]);
				}
				int []end_time = new int[in_end_time.length];
				for(i=0;i<in_end_time.length;i++){
					end_time[i] = Integer.parseInt(in_end_time[i]);
				}
				String []day_of_clas = new String[in_start_time.length];
				for(i=0;i<in_start_time.length;i++){
					day_of_clas[i] = request.getParameter("day_of_class"+String.valueOf(i));
				}
				Connection conn = null;
				Statement stmt = null;
				String sqlStr = null;
				PreparedStatement preparedStmt = null;
				ResultSet rs = null;
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
				sqlStr = "INSERT INTO class (class_credit, class_max_people, class_name, class_professor, class_room, class_year, class_people, class_state) values (?,?,?,?,?,?,?,?)";
				preparedStmt = conn.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
				preparedStmt.setInt(1, class_credit);
				preparedStmt.setInt(2, class_max_people);
				preparedStmt.setString(3, class_name);
				preparedStmt.setString(4, class_professor);
				preparedStmt.setInt(5, class_room);
				preparedStmt.setInt(6, class_year);
				preparedStmt.setInt(7, 0);
				preparedStmt.setString(8, "폐강");
				preparedStmt.execute();
				rs = preparedStmt.getGeneratedKeys();
				if(rs.next()){
					sqlStr = "SELECT class_id from class where class_id="+String.valueOf(rs.getInt(1));
					
					ResultSet rset = stmt.executeQuery(sqlStr);
					if(rset.next()){
						int class_id = rset.getInt("class_id");
						out.println(class_id);
						for(i=0;i<start_time.length;i++){
							sqlStr = "INSERT INTO class_time (class_id, start_time, end_time, day_of_class) values (?,?,?,?)";
							preparedStmt = conn.prepareStatement(sqlStr);
							preparedStmt.setInt(1, class_id);
							preparedStmt.setInt(2, start_time[i]);
							preparedStmt.setInt(3, end_time[i]);
							preparedStmt.setString(4, day_of_clas[i]);
							preparedStmt.execute();
						}
					}
				}
				out.println("<script>alert('수업이 등록 되었습니다.');</script>");
			}
			
		%>
	</div>
</body>
</html>