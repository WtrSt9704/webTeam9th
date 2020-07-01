<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.DB_connection" %>
<%@ page import="dao.Board" %>
<%@ page import="dao.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이솔루션-JPIA 관리자</title>
</head>
<body>
<% if(session.getAttribute("id") == null || session.getAttribute("name") == null){
		out.println("<script>alert('세션이 소실되었습니다. 다시 로그인하여 주세요.');location.href='login.jsp';</script>");
	} 
%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String id = session.getAttribute("id").toString();
	String name = session.getAttribute("name").toString();
	String subject = request.getParameter("subject");	
	String content = request.getParameter("content");	
	String category = request.getParameter("category");
	session.setAttribute("category", request.getParameter("category"));
	//response.sendRedirect("main_boards.jsp");
	BoardDAO dao = BoardDAO.getInstance();
	String date = dao.getDate();
	String time = dao.gettime();
	String reg_time = date+" "+time;
	
	int check = dao.insertVisitor(reg_time, id,name, category, subject, content);
	if(check>=1){
		out.println("<script>alert('새로운 토론이 개설되었습니다!');location.href='main_boards.jsp';</script>");
	}else{
		out.println("<script>alert('토론 개설에 실패하였습니다!');location.href='main_boards.jsp';</script>");
	}

%>

</body>
</html>