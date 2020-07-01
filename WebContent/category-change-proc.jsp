<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>등록</title>
</head>
<body>
<%
session.setAttribute("category", request.getParameter("target_category"));

response.sendRedirect("main_boards.jsp");
%>
</body>
</html>
