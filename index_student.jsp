﻿<!DOCTYPE html>

<html>

<head>
	
<title> 수강신청 </title>
	
<link rel="stylesheet" href="css/admin.css">

</head>

<body>
	<%
		if(session.getAttribute("student_number")==null){
			out.println("<script type=\"text/javascript\">alert('권한이 필요합니다. 로그인을 해주세요.');location='login.jsp';</script>");
		}
	%>
	<div id="header">
		
<a id="home_ref" href="index_student.jsp">
			
<img src='logo.jpg'>
		
</a>	
	
</div>
	
<br>
<div id="nav">
		
<ul>
			
	
<li> <a href="modify_class_student.jsp">수강신청 확정내역</a>
</li>
			
<li> <a href="list_class.jsp">수업 목록 </a>
</li>
			
<li> <a href="search_class.jsp">수업 검색</a>
</li>
	
<li> <a href="wish_list.jsp">책가방</a>
</li>	
<li> <a href="timetable.jsp">시간표 보기</a>
</li>
<li style="float:right; text-transform: uppercase;"> <a class="logout" href="logout.jsp">logout</a></li>
</ul>
	
</div>
	
<div id="content">
		
<h2>수강신청 일반안내</h2>
		
- 로그인은 수강신청 시작 전에도 가능합니다.<br>
- 수강신청은 학기단위로 시행합니다.<br>
- 정규학기 수강신청 기간동안 등록예정학기별 대기순번제를 운영합니다.<br>
- 매크로 방지 및 다중접속 제한이 시행됩니다.<br>
- 일정횟수 이상 클릭 또는 단기간내 과도한 클릭시 매크로 방지 시스템이 실행됩니다.<br>
- 한 PC에서 여러 개의 창을 띄우는 경우, PC와 모바일에서 동시에 수강신청을 진행하는 경우 등
  다중접속이 제한됩니다.<br>
- 수강신청 사이트 책가방 담은 강좌의 정렬 순서는 GLS [책가방] 메뉴에서 설정할 수 있습니다.<br>
- 수강신청 모바일앱: 구글 플레이스토어, 애플 앱스토어에서 '성균관대 수강신청' 검색<br>
- 2018학년도 겨울계절수업부터 수강신청 전용 사이트/모바일앱에서 수강신청 가능합니다.<br>
(기존 GLS 메뉴에서는 계절수업 수강료 납부/환불 계좌만 확인 가능)	<br>	
</div>
</body>
</html>
