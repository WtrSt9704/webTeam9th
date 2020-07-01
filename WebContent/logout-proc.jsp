<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>등록</title>
</head>
<body>
<%
session.removeAttribute("name");
session.removeAttribute("id");
response.sendRedirect("main.jsp");
%>
</body>
</html>
