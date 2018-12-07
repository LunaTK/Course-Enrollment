<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <form action="authentication_student.jsp" method="post">
            <label>학번: </label>
            <input name="id" type="text"><br>
            <label>PW: &nbsp;</label>
            <input name="pw" type="password"><br>
            <input type="submit" value="로그인">
        </form>
    </body>
</html>