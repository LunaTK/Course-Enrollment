<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
 String id = request.getParameter("get");
int MAX = 0;
int class_people = 0;
int credit = 0;
int all = 0;
int allow = 0;
int i;

 try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection( "jdbc:mysql://softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com:3306/course?characterEncoding=UTF-8&serverTimezone=UTC", "lunatk", "Thtlf1210");
					Statement stm = con.createStatement();
				PreparedStatement preparedStmt = null;
					int class_id = Integer.parseInt(id);
		 String number = (String)session.getAttribute("student_number");
		if(number == null){
			response.sendRedirect("login.jsp");
		}
	String s = "select * from student where student_number ='"+ (String)session.getAttribute("student_number")+"'";
	ResultSet r = stm.executeQuery(s);
	while(r.next()){
		allow = r.getInt("allowed_credit");
	}
  String sqlStr = "select * from class where class_id = '"+ request.getParameter("get")+"'";
 
		
  ResultSet rst = stm.executeQuery(sqlStr);
					if(rst.next()){
						MAX = rst.getInt("class_max_people");
						class_people = rst.getInt("class_people");
						credit = rst.getInt("class_credit");
					}
					if(class_people >= 4){
						String query2 = "UPDATE class SET class_state = '진행중' where class_id='" + request.getParameter("get")+"'";
  //쿼리문 전송
	stm.executeUpdate(query2);
					}
					if(class_people == (MAX - 1)){
						String query3 = "UPDATE class SET class_state = '신청 종료' where class_id='" + request.getParameter("get")+"'";
  //쿼리문 전송
	stm.executeUpdate(query3);
					}
					if(MAX <= class_people){
						stm.close();
						con.close();
						out.println("<script type=\"text/javascript\">alert('해당 강의가 꽉찼습니다.');location='list_class.jsp';</script>");
					}
					
	 String St = "select * from enroll_list";
  ResultSet rset = stm.executeQuery(St);
  while(rset.next()){
	  if(rset.getString(2).equals(request.getParameter("get")) && rset.getString(3).equals(number)){
		stm.close();
		con.close();
		out.println("<script type=\"text/javascript\">alert('해당 강의가 이미 신청 되었습니다.');location='list_class.jsp';</script>");
	  }
  }	
  String sm = "select enrolled_credit from enrolled_credit where student_number ='"+ (String)session.getAttribute("student_number")+"'";
  ResultSet rmet = stm.executeQuery(sm);
  while(rmet.next()){
	  all = rmet.getInt("enrolled_credit");
  }
  if(all>=allow){
	  stm.close();
		con.close();
		out.println("<script type=\"text/javascript\">alert('더이상 강의를 들으실수없습니다.');location='list_class.jsp';</script>");
  }
  
	int student_number =  Integer.parseInt(number);
				String Str = "INSERT INTO enroll_list (`class_id`, `student_number`) values (?,?)";
				preparedStmt = con.prepareStatement(Str);
				preparedStmt.setInt(1, class_id);
				preparedStmt.setInt(2, student_number);
				preparedStmt.execute();
  //쿼리문 전송
				preparedStmt.close();  
  String query = "UPDATE class SET class_people = class_people + 1 where class_id='" + request.getParameter("get")+"'";
  //쿼리문 전송
  stm.executeUpdate(query);
  
		
  
  
  stm.close();
  con.close();
	out.println("<script type=\"text/javascript\">alert('강의가 신청 되었습니다.');location='list_class.jsp';</script>");
 }
  catch(Exception e){
  out.println( e );
 }
 %>
