<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
 String id = request.getParameter("del");
int MAX = 0;
int class_people = 0;

 try{
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection conn = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					Statement stmt = conn.createStatement();
					Connection co = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					Statement st = co.createStatement();
  String sqlStr = "select * from enroll_list where class_id = '"+ request.getParameter("del")+"'";
  ResultSet rset = stmt.executeQuery(sqlStr);
  int class_id = Integer.parseInt(id);
	String number = (String)session.getAttribute("student_number");
	if(number == null){
			out.println("<script type=\"text/javascript\">alert('로그인이 필요합니다.');location='login.jsp';</script>");
		}
  while(rset.next()){
	  if(rset.getString(3).equals(number)){
		  String qu = "DELETE FROM enroll_list where class_id = '" + request.getParameter("del") + "'";
		  st.executeUpdate(qu);
		
	  }
  }
		st.close();			
	String query = "UPDATE class SET class_people = class_people - 1 where class_id='" + request.getParameter("del")+"'";
  //쿼리문 전송
  stmt.executeUpdate(query);		
  
  //쿼리문 전송
  st.close();
  stmt.close();
  co.close();
  conn.close();
out.println("<script type=\"text/javascript\">alert('강의가 삭제 되었습니다.');location='modify_class_student.jsp';</script>");
 }
  catch(Exception e){
  out.println( e );
 }
 %>
