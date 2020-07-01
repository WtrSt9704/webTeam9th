<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dao.Board"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
BoardDAO dao = BoardDAO.getInstance();
ArrayList<Board> boardlist;
String cat = session.getAttribute("category").toString();
if("전체".equals(cat)){
	boardlist = dao.getBoards_simple_all(0);
}else if("핫이슈".equals(cat)){
	boardlist = dao.getBoards_simple_hot(0);
}else{
	boardlist = dao.getBoards_simple(cat, 0);
}
int bdlstsz = boardlist.size();
String admin = "asdfghjk";
String id = "";
if(session.getAttribute("id") != null)
	id = session.getAttribute("id").toString();
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>토론사이트</title>
<script>
function view(s){
	document.board_v.target_pid.value = s;
	document.board_v.submit();
}
</script>
</head>
<body>
<div>
<%@ include file="main_header.jsp"%>
<%@ include file="main_nav.jsp"%>
	<div>
		<div class="panel">
		  <div class="panel-heading">
		  	<div class="row">
				<div class="col-md" style="text-align:left">
		    		<h3 class="panel-title"><%=session.getAttribute("category").toString()%> 게시판</h3>
		    	</div>
		    	<div class="col-md" style="text-align:right">
		    		<% if("공지사항".equals(cat) == false){ %>
		    		<a href="main_write.jsp"><button class="btn btn-primary pull-right" onclick="write()"><% if("건의".equals(cat)){ %>건의하기<%}else{ %>토론 열기<%} %></button></a>
		    		<%} else if(admin.equals(id)){ %>
		    		<a href="main_write.jsp"><button class="btn btn-primary pull-right" onclick="write()">공지 작성</button></a>
		    		<%} %>
		    	</div>
		  </div>
			<ul class="list-group">
				<% 
					for(int i = 0; i < bdlstsz; i ++){
				%>
					<li class="list-group-item bttproperty" onclick="view('<%=boardlist.get(i).getBoard_id()%>')">
						<h4><%=boardlist.get(i).getSubject()%></h4>
						<div style="text-align:right">
						  	| 작성자 : <%=boardlist.get(i).getUsername()%>
						  	| 조회수 : <%=boardlist.get(i).getHits() %>
							| 작성일 : <%=boardlist.get(i).getRegDate() %>
						</div>
					</li>
				<% }%>
			</ul>
		</div>   
	</div>
</div>
<form name="board_v" action="main_view.jsp">
	<input type="hidden" name="target_pid">
</form>
</body>
</html>