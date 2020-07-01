<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>logout</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("login.jsp");
%>
</body>
</html>
