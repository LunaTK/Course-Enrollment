<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
	<title> 학생 등록 </title>
	<link rel="stylesheet" href="./css/admin.css?ver=51">
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
<br>
	<div id="nav">
		<ul>
			<li> <a href="register_student.jsp">학생 등록</a></li>
			<li> <a href="register_class.jsp">수업 등록 </a></li>
			<li> <a href="modify_class.jsp">수업 수정, 삭제</a></li>
			<li> <a href="list_class_admin.jsp">수업 목록 </a></li>
			<li> <a href="search_class_admin.jsp">수업 검색</a></li>
      <li style="float:right; text-transform: uppercase;"> <a class="logout" href="logout.jsp">logout</a></li>
		</ul>
	</div>
  <div class="form_student">
		<h2 style="font:sans-serif;">학생 등록 </h2>
		<form action="" method="post">
			<table style="width:400px">
				<tr>
					<td>
						<input name="student_id" type="text" placeholder="학번"></input>
					</td>
				</tr>
				<tr>
					<td>
						<input name="password" type="password" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<input name="student_name" type="text" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td>
						<input name="year" type="number" placeholder="학년">
					</td>
				</tr>
				<tr>
					<td>
						<input name="possible_credit" type="number" placeholder="허용학점">
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">등록 </button>
		</form>
		<%
			String in_student_number = request.getParameter("student_number");
			String student_pswd = request.getParameter("student_pswd");
			String student_name = request.getParameter("student_name");
			String in_student_year = request.getParameter("student_year");
			String in_allowed_credit = request.getParameter("allowed_credit");
			if(in_student_number != null && student_pswd != null && student_name != null && in_student_year != null && in_allowed_credit != null){
				int student_number = Integer.parseInt(in_student_number);
				int student_year = Integer.parseInt(in_student_year);
				int allowed_credit = Integer.parseInt(in_allowed_credit);
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
				//insert into student_id_pswd table
				sqlStr = "INSERT INTO student (student_number, student_pswd, allowed_credit, student_year, student_name) values (?,?,?,?,?)";
				preparedStmt = conn.prepareStatement(sqlStr);
				preparedStmt.setInt(1, student_number);
				preparedStmt.setString(2, student_pswd);
				preparedStmt.setInt(3, allowed_credit);
				preparedStmt.setInt(4, student_year);
				preparedStmt.setString(5, student_name);
				preparedStmt.execute();

				//insert into student_credit_year table
				out.println("<script>alert('학생이 등록 되었습니다.');</script>");
			}
		%>
	</div>
</body>
</html>
