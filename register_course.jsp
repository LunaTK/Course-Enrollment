<!DOCTYPE html>
<html>
<head>
	<title> 수강 신청 </title>
	<link rel="stylesheet" href="css/admin.css">
</head>
<body>
	<div id="header">
		<a id="home_ref" href="index.html">
			<img src='logo.jpg'>
		</a>	
	</div>
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
		<h2>학생 등록 </h2>
		<form action="" method="post">
			<table>
				<tr><td><label>학번</label></td>
				<td><input name="student_id" type="text"></td></tr>
				<tr><td><label>비밀번호</label></td>
				<td><input name="password" type="password"></td></tr>
				<tr><td><label>이름</label></td>
				<td><input name="student_name" type="text"></td></tr>
				<tr><td><label>학년</label></td>
				<td><input name="year" type="number"></td></tr>
				<tr><td><label>허용학점</label></td>
				<td><input name="possible_credit" type="number"></td></tr>
			</table>
			<br>
			<button type="submit" class="register_btn">등록 </button>
		</form>
	</div>
</body>
</html>