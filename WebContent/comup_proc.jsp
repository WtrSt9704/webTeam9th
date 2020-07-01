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
		out.println("<script>alert('로그인이 필요합니다.');window.close();</script>");
	} 
%>
<% 
	request.setCharacterEncoding("utf-8"); 
	int cid = Integer.parseInt(request.getParameter("cid"));
	BoardDAO dao = BoardDAO.getInstance();
	int check = dao.com_up(cid);
	if(check>=1){
		out.println("<script>opener.location.reload(); window.close();</script>");
	}else{
		out.println("<script>alert('오류발생');window.close();</script>");
	}

%>

</body>
</html>