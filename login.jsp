﻿<!DOCTYPE html>
<html>
<head>
	<title> 수업 수정, 삭제 </title>
	<link rel="stylesheet" href="./css/admin.css" type="text/css">
	<meta charset="utf-8"></meta>
</head>
<body>
<div id="header">
	<a id="home_ref" href="login.jsp">
		<img src='logo.jpg'></img>
	</a>
	</div>
	<div id="nav">
</div>

<div class="wrapper_div">
	<aside class="form">
		<h2> LOGIN </h2>
			<form action="auth.jsp" method="post">
				<input type="text" name="id" placeholder="name"> </input>
					<br>
				<input type="password" name="pw" placeholder="password"> </input>
					<br>
				<button type="submit"> Login </button>
			</form>
	</aside>

	<section id="content">
		<h3 style="text-align:center">수강신청 일반안내</h3>
		<ul class="gonzi">
			<li> 로그인은 수강신청 시작 전에도 가능합니다.</li>
			<li> 수강신청은 학기단위로 시행합니다.</li>
			<li> 정규학기 수강신청 기간동안 등록예정학기별 대기순번제를 운영합니다. </li>
			<li> 매크로 방지 및 다중접속 제한이 시행됩니다.
				<ul>
					<li> 일정횟수 이상 클릭 또는 단기간내 과도한 클릭시 매크로 방지 시스템이 실행됩니다. </li>
					<li>한 PC에서 여러 개의 창을 띄우는 경우, PC와 모바일에서 동시에 수강신청을 진행하는 경우 등
		  다중접속이 제한됩니다.</li>
				</ul>
			</li>
			<li> 수강신청 사이트 책가방 담은 강좌의 정렬 순서는 GLS [책가방] 메뉴에서 설정할 수 있습니다.</li>
			<li> 수강신청 모바일앱: 구글 플레이스토어, 애플 앱스토어에서 '성균관대 수강신청' 검색 </li>
		  <li> 2018학년도 겨울계절수업부터 수강신청 전용 사이트/모바일앱에서 수강신청 가능합니다.</li>
			<br>(기존 GLS 메뉴에서는 계절수업 수강료 납부/환불 계좌만 확인 가능)	<br>
		</ul>
	</section>
</div>
</body>
</html>
