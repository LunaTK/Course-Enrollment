<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
	<title> 수업 수정 </title>
	<link rel="stylesheet" href="css/admin.css">
	<script type="text/javascript">
		var time_count = 0;
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
			out.println("<script type=\"text/javascript\">alert('권한이 필요합니다. 로그인을 해주세요.');location='login.jsp';</script>");
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
		<h2>수업 수정 </h2>
		<%
			String in_class_id = request.getParameter("class_id");
			int class_id = Integer.parseInt(in_class_id);

			int class_credit=0;
			int class_max_people=0;
			String class_name = null;
			String class_professor =null;
			int class_room=0;
			int class_year = 0;
			String[] str_start_time = null;
			String[] str_end_time = null;
			String[] str_day_of_clas = null;

			int i=0;
			Connection conn = null;
			Statement stmt = null;
			String sqlStr = null;
			PreparedStatement preparedStmt = null;
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course", "lunatk", "Thtlf1210");

				stmt = conn.createStatement();
				sqlStr = "select * from class where class_id ="+class_id;
				ResultSet rset = stmt.executeQuery(sqlStr);
				if(rset.next()){
					class_name = rset.getString("class_name");
					class_credit = rset.getInt("class_credit");
					class_max_people = rset.getInt("class_max_people");
					class_professor = rset.getString("class_professor");
					class_room = rset.getInt("class_room");
					class_year = rset.getInt("class_year");
				}
				sqlStr = "select * from class_time where class_id="+class_id;
				rset = stmt.executeQuery(sqlStr);
				rset.last();  

				str_start_time = new String[rset.getRow()];
				str_end_time = new String[rset.getRow()];
				str_day_of_clas = new String[rset.getRow()];
				rset.beforeFirst();
				i=0;
				while(rset.next()){
					str_start_time[i]=Integer.toString(rset.getInt("start_time"));

					str_end_time[i] = Integer.toString(rset.getInt("end_time"));
					str_day_of_clas[i] = rset.getString("day_of_class");

					i +=1;
				}
				i=0;
				stmt.close();
				conn.close();
			}
			catch (SQLException e) {
			    out.println("err:"+e.toString());
			}
		%>
		<%!
			public static String getArrayString(String[] items){
				//out.println("<script>alert('수업이 등록 되었습니다.');</script>");
			    String result = "[";
			    for(int i = 0; i < items.length; i++) {
			        result += "\"" + items[i] + "\"";
			        if(i < items.length - 1) {
			            result += ", ";
			        }
			    }
			    result += "]";

			    return result;
			}
		%>
		<form method="post">
			<table>
				<tbody id="class_tbody">
				<tr><td><label>강의명</label></td>
				<td><input id="class_name" name="class_name" type="text"></td></tr>
				<tr><td><label>강사명</label></td>
				<td><input id="class_professor" name="class_professor" type="text"></td></tr>
				<tr><td><label>수강인원</label></td>
				<td><input id="class_max_people" name="class_max_people" type="number"></td></tr>
				<tr><td><label>강의실</label></td>
				<td><input id="class_room" name="class_room" type="number"></td></tr>
				<tr><td><label>수강대상학년</label></td>
				<td><input id="class_year" name="class_year" type="number"></td></tr>
				<tr><td><label>수강학점</label></td>
				<td><input id="class_credit" name="class_credit" type="number"></td></tr>
				</tbody>
			</table>
			<br>
			<button type="button" class="register_btn" onclick="add_time();">강의 시간 추가</button>/
			<button type="button" class="register_btn" onclick="delete_time();">삭제</button>
			<br>
			<button type="submit" class="register_btn">수정 </button>
		</form>
		<script type="text/javascript">
			document.getElementById("class_credit").value = <%= class_credit %>;

			document.getElementById("class_max_people").value = <%= class_max_people %>;
			document.getElementById("class_name").value = '<%=class_name%>';
			document.getElementById("class_professor").value = '<%= class_professor%>';
			document.getElementById("class_room").value = <%= class_room %>;
			document.getElementById("class_year").value = <%= class_year %>;
			var start_time = <%= getArrayString(str_start_time) %>;
			var end_time = <%= getArrayString(str_end_time)%>;
			var day_of_clas = <%= getArrayString(str_day_of_clas)%>;

			var i=0;
			for(i=0;i<start_time.length;i++){
				add_time();
			}
			var element_start_time = document.getElementsByName("start_time");
			var element_end_time = document.getElementsByName("end_time");
			for(i=0;i<start_time.length;i++){
				element_start_time[i].value = start_time[i];
				element_end_time[i].value = end_time[i];
				document.getElementsByName("day_of_class"+String(i))[Number(day_of_clas[i])].checked = true;
			}
		</script>
		<%
			class_name = request.getParameter("class_name");
			class_professor = request.getParameter("class_professor");
			String in_class_max_people = request.getParameter("class_max_people");
			String in_class_room = request.getParameter("class_room");
			String in_class_year = request.getParameter("class_year");
			String in_class_credit = request.getParameter("class_credit");
			String[] in_start_time = request.getParameterValues("start_time");
			String[] in_end_time = request.getParameterValues("end_time");
			if(class_name != null && class_professor != null && in_class_max_people != null && in_class_room != null && in_class_year != null && in_class_credit != null){
				class_max_people = Integer.parseInt(in_class_max_people);
				class_room = Integer.parseInt(in_class_room);
				class_year = Integer.parseInt(in_class_year);
				class_credit = Integer.parseInt(in_class_credit);
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
				conn = null;
				stmt = null;
				sqlStr = null;
				preparedStmt = null;
				ResultSet rs = null;
				PreparedStatement pStmt = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course", "lunatk", "Thtlf1210");
					stmt = conn.createStatement();
					//insert into class table 
					sqlStr = "UPDATE class SET class_credit=?, class_max_people=?, class_name=?, class_professor=?, class_room=?, class_year=? where class_id=?";
					preparedStmt = conn.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
					preparedStmt.setInt(1, class_credit);
					preparedStmt.setInt(2, class_max_people);
					preparedStmt.setString(3, class_name);
					preparedStmt.setString(4, class_professor);
					preparedStmt.setInt(5, class_room);
					preparedStmt.setInt(6, class_year);
					preparedStmt.setInt(7, class_id);
					preparedStmt.execute();
				
					sqlStr = "DELETE from class_time where class_id="+String.valueOf(class_id);
					stmt.executeUpdate(sqlStr);

					for(i=0;i<start_time.length;i++){
						sqlStr = "INSERT INTO class_time (class_id, start_time, end_time, day_of_class) values (?,?,?,?)";
						pStmt = conn.prepareStatement(sqlStr);
						pStmt.setInt(1, class_id);
						pStmt.setInt(2, start_time[i]);
						pStmt.setInt(3, end_time[i]);
						pStmt.setString(4, day_of_clas[i]);
						pStmt.execute();
					}
					
					
					out.println("<script>alert('수업이 수정 되었습니다.');</script>");
					pStmt.close();
					preparedStmt.close();
					stmt.close();
					conn.close();
				}
				catch (SQLException e) {
			        out.println("err:"+e.toString());
			    }
			}
			
		%>

	</div>
</body>
</html>