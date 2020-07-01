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
<% 
	request.setCharacterEncoding("utf-8"); 
	String id = session.getAttribute("id").toString();
	String name = session.getAttribute("name").toString();
	String content = request.getParameter("content");	
	String stand = request.getParameter("stand");
	int board_id = Integer.parseInt(request.getParameter("bid"));
	//response.sendRedirect("main_boards.jsp");
	BoardDAO dao = BoardDAO.getInstance();
	String date = dao.getDate();
	String time = dao.gettime();
	String reg_time = date+" "+time;
	if("p".equals(stand)){
		int chk = dao.pros_up(board_id);
		if(chk <1){
			out.println("<script>alert('오류가 발생했습니다.');location.href='main_boards.jsp';</script>");
		}
	}else{
		int chk = dao.cons_up(board_id);
		if(chk <1){
			out.println("<script>alert('오류가 발생했습니다.');location.href='main_boards.jsp';</script>");
		}
	}
	int check;
	if("0".equals(request.getParameter("opposition"))){
		check = dao.insertComment(reg_time, id, name, content, board_id, stand);
	}else{
		check = dao.insertComment(reg_time, id, name, content, board_id, stand,Integer.parseInt(request.getParameter("opposition").toString()));
	}
	if(check>=1){
		out.println("<script>location.href='main_view.jsp?target_pid="+ board_id + "';</script>");
	}else{
		out.println("<script>alert('의견을 내는데 실패하였습니다! 다시 시도하세요.');location.href='main_boards.jsp';</script>");
	}

%>

</body>
</html>