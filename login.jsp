<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <% if (request.getParameter("error") == null) { %>
            <h1>	<img src='logo.jpg'>
	</h1> 
        <% } else { %>
            <h1><%= request.getParameter("error") %></h1>
       <% } %>
 
		<table id = "list" type = "post">
		<form action="form_professor.jsp" method="button">
			<td><button href="form_professor.jsp">교수</button>
			</td>
		</form>
		<form action="form_student.jsp" method="post">
			<td><button href="form_student.jsp">학생</button>
			</td>
		</form>
		</table>
    </body>
</html>