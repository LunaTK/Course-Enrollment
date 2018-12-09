<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
 String id = request.getParameter("get");
int MAX = 0;
int class_people = 0;

 try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					Statement stm = con.createStatement();
  String sqlStr = "select * from class where class_id = '"+ request.getParameter("get")+"'";
  ResultSet rset = stm.executeQuery(sqlStr);
					if(rset.next()){
						MAX = rset.getInt("class_max_people");
						class_people = rset.getInt("class_people");
					}
					if(MAX <= class_people){
						out.println("강의가 꽉찼습니다. <hr>");
						stm.close();
						con.close();
						response.sendRedirect("fail.jsp");
					}
					
  String query = "UPDATE class SET class_people = class_people + 1 where class_id='" + request.getParameter("get")+"'";
  //쿼리문 전송
  stm.executeUpdate(query);
  stm.close();
  con.close();
response.sendRedirect("list_class.jsp");
 }
  catch(Exception e){
  out.println( e );
 }
 %>
