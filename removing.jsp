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
  String sqlStr = "select * from wish_list where class_id = '"+ request.getParameter("del")+"'";
  ResultSet rset = stmt.executeQuery(sqlStr);
  int class_id = Integer.parseInt(id);
	String number = (String)session.getAttribute("student_number");
  while(rset.next()){
	  if(rset.getString(3).equals(number)){
		  String qu = "DELETE FROM wish_list where class_id = '" + request.getParameter("del") + "'";
		  st.executeUpdate(qu);
		
	  }
  }
		st.close();			
					
  
  //쿼리문 전송
  st.close();
  stmt.close();
  co.close();
  conn.close();
response.sendRedirect("wish_list.jsp");
 }
  catch(Exception e){
  out.println( e );
 }
 %>