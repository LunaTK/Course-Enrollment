<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
    Connection conn = null;
    ResultSet studentRS = null;
    ResultSet adminRS = null;
    Statement stmt = null;
    String redirectUrl = "javascript:alert('로그인 실패')";
    try{
        ResourceBundle resource = ResourceBundle.getBundle("sw4/dbconfig");
        String url=resource.getString("url");
        String id=resource.getString("id");
        String pw=resource.getString("pw");
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pw);
        String uid = request.getParameter("id");
        String upw = request.getParameter("pw");

        String studentQuery = "SELECT * FROM student where student_number = '" + uid + "' and student_pswd = '"+ upw + "';";
        String adminQuery = "SELECT * FROM admin where id_admin = '" + uid + "' and pswd_admin = '"+ upw + "';";
        
        stmt = conn.createStatement();
        studentRS = stmt.executeQuery(studentQuery);

        stmt = conn.createStatement();
        adminRS = stmt.executeQuery(adminQuery);
        // 0: 인증 가능 사용자 및 비밀번호 목록.
        // 1: form 으로부터 전달된 데이터를 변수에 저장.
        // 2: 사용자 인증

        if (studentRS.next()) { // 학생 로그인 성공인
            session.setAttribute("student_number", uid);
            redirectUrl = "index_student.html?id=" + id; // 학생 메인 페이지
        } else if (adminRS.next()) {
            redirectUrl = "admin.html"; // 어드민 페이지
        } else {
            out.println("<script>alert('로그인 실패');</script>");
            redirectUrl = "index.html";
        }


        response.sendRedirect(redirectUrl);
        adminRS.close();        // ResultSet exit
        studentRS.close();
        stmt.close();     // Statement exit
        conn.close();    // Connection exit
    }
    catch (SQLException e) {
        out.println("err:"+e.toString());
    }
%>