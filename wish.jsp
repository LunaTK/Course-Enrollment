<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
 String id = request.getParameter("del");

 try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					Statement stm = con.createStatement();
					PreparedStatement preparedStmt = null;
	int class_id = Integer.parseInt(id);
	if(id != null){	
		String number = (String)session.getAttribute("student_number");
		if(number == null){
			response.sendRedirect("login.jsp");
		}
  String Str = "select * from wish_list";
  ResultSet rset = stm.executeQuery(Str);
  while(rset.next()){
	  if(rset.getString(2).equals(request.getParameter("del")) && rset.getString(3).equals(number)){
		stm.close();
		con.close();
		out.println("<script type=\"text/javascript\">alert('해당 강의가 이미 책가방에 있습니다.');location='list_class.jsp';</script>");
	  }
  }
  int student_number =  Integer.parseInt(number);
				String sqlStr = "INSERT INTO wish_list (`class_id`, `student_number`) values (?,?)";
				preparedStmt = con.prepareStatement(sqlStr);
				preparedStmt.setInt(1, class_id);
				preparedStmt.setInt(2, student_number);
				preparedStmt.execute();
  //쿼리문 전송
				preparedStmt.close();
  stm.close();
  con.close();
  out.println("<script type=\"text/javascript\">alert('책가방에 담겼습니다.');location='list_class.jsp';</script>");
}
 }
  catch(Exception e){
  out.println( e );
 }
 %>
