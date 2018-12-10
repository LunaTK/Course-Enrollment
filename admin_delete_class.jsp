<%@ page import="java.sql.*" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String class_id = request.getParameter("class_id");
    boolean is_closed = false;

	Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String redirectUrl = "list_class_admin.jsp";
	try{
		ResourceBundle resource = ResourceBundle.getBundle("sw4/dbconfig");
        String url=resource.getString("url");
        String id=resource.getString("id");
        String pw=resource.getString("pw");
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pw);
        String uid = request.getParameter("id");
        String upw = request.getParameter("pw");

        stmt = conn.createStatement();


        String sqlStr = "SELECT class_state FROM class WHERE class_id="+class_id;
        rs = stmt.executeQuery(sqlStr);
        if(rs.next()){
            if(rs.getString("class_state").equals("폐강")){
                is_closed=true;
            }
        }
        if(is_closed){
            sqlStr = "DELETE FROM class WHERE class_id="+class_id;
            stmt.executeUpdate(sqlStr);
            sqlStr = "DELETE FROM class_time WHERE class_id="+class_id;
            stmt.executeUpdate(sqlStr);
            out.println("<script>alert('수업이 삭제 되었습니다.');</script>");
        }
        else{
            out.println("<script>alert('폐강 상태가 아니라 삭제할 수 없습니다.');</script>");
        }
        rs.close();
        stmt.close();
        conn.close();
        out.println("<script type=\"text/javascript\">location='" + redirectUrl +"';</script>");

	}
	catch (SQLException e) {
        out.println("err:"+e.toString());
    }
%>
