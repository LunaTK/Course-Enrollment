<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
				Connection conn = null;
				ResultSet rs = null;
				Statement stmt = null;
				String sqlStr = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=UTF-8&serverTimezone=UTC", "root", "sim6769");
					stmt = conn.createStatement();

					String query = "SELECT * FROM professor";
					rs = stmt.executeQuery(query);
    // 0: 인증 가능 사용자 및 비밀번호 목록.
    // 1: form 으로부터 전달된 데이터를 변수에 저장.
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    // 2: 사용자 인증
    String redirectUrl = "form.jsp?error=login-failed.."; // 인증 실패시 요청 될 url 
	while(rs.next()){
		if(rs.getString(1).equals(id) && rs.getString(2).equals(pw)){
            redirectUrl = "index_professor.html?id=" + id; // 인증 성공 시 재 요청 url
		}
	}

    response.sendRedirect(redirectUrl);
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>