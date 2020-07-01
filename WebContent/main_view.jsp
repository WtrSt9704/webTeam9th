<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dao.Board"%>
<%@page import="dao.Comment"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% 
	BoardDAO dao = BoardDAO.getInstance();
	Board cur_b = dao.getBoard_detail(Integer.parseInt(request.getParameter("target_pid")));
	
	
	if(dao.view(cur_b.getBoard_id(), cur_b.getHits()) <1){
		out.println("<script>alert('오류가 발생했습니다.');location.href='main_boards.jsp';</script>");
	}
	
	int pros = cur_b.getPros();
	int cons = cur_b.getCons();
	int total_comment = pros + cons;
	if( total_comment == 0) total_comment = 1;
	float pros_per = (float)pros/total_comment*100;
	float cons_per = (float)cons/total_comment*100;
	
	ArrayList<Comment> pros_list = dao.getComments(cur_b.getBoard_id(), "p", 0);
	int pros_count = pros_list.size();
	
	ArrayList<Comment> cons_list = dao.getComments(cur_b.getBoard_id(), "c", 0);
	int cons_count = cons_list.size();
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.bttselected{
	background-color:#002130;
	color:white;
}
.bttopps{
	background-color:#670000;
	color:white;
}
</style>
<script>
$(function() {

    $('.button-class1').click(function(){
        if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
        if( !$(this).hasClass('btn-primary') ) $(this).addClass('btn-primary');
        if( $('.button-class2').hasClass('btn-danger') ) $('.button-class2').removeClass('btn-danger');
        if( !$('.button-class2').hasClass('btn-default') ) $('.button-class2').addClass('btn-default');
        document.comment_form.stand.value = "p";
    });
    
    $('.button-class2').click(function(){
        if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
        if( !$(this).hasClass('btn-danger') ) $(this).addClass('btn-danger');
        if( $('.button-class1').hasClass('btn-primary') ) $('.button-class1').removeClass('btn-primary');
        if( !$('.button-class1').hasClass('btn-default') ) $('.button-class1').addClass('btn-default');
        document.comment_form.stand.value = "c";
    });
    $(".bttproperty2").click(function(){
    	$(".bttopps").removeClass("bttopps");
		if($(this).hasClass("bttselected")){
			$(this).removeClass("bttselected");
		}else{
			$(".bttselected").removeClass("bttselected");
			$(this).addClass("bttselected");
			$("#"+$(this).attr("opps")).addClass("bttopps");
			var offset = $("#"+$(this).attr("opps")).offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
		}
	});
});
function addcom(){
	//var form = document.comment_form;
	//url = "main_comment_proc.jsp?stand=" + hwf.stand.value + "&passwd="+hwf.passwd.value;
	//window.open(url,"id check", "toolbar=no, width=300, height=150, top=150, left=150");
	document.comment_form.submit();
	//window.location.reload();
}
function comup(s){
	var form = document.comment_form;
	url = "comup_proc.jsp?cid=" + s;
	window.open(url,"id check", "toolbar=no, width=300, height=150, top=150, left=150");
	//form.load();
	//window.location.reload();
}
function oppose(s){
	if(document.comment_form.opposition.value == s){
		document.comment_form.opposition.value = "0";
	}else{
		document.comment_form.opposition.value = s;
	}
	
}
</script>
<title><%=cur_b.getSubject() %></title>
</head>
<body>
<div>
<%@ include file="main_header.jsp"%>
<%@ include file="main_nav.jsp"%>
<ul class="list-group"><li class="list-group-item">
<div class="container">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr><th style="background-color: #eeeeee; text-align: center;"><%=cur_b.getSubject() %></th></tr>
			</thead>
			<tbody>
				<tr><td>
					<div class="row">
						<div class="col-md" style="text-align:left">
						  	작성자 : <%=cur_b.getUsername()%>
						</div>
						<div class="col-md" style="text-align:right">
						  	| 조회수 : <%=cur_b.getHits() %>
							| 작성일 : <%=cur_b.getRegDate() %>
						</div>
					</div>
					
				</td></tr>
				<tr><td>
					<%=cur_b.getContents() %>
				</td></tr>
				<tr><td>
					<div class="progress">
						<div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: <%= pros_per%>%;">찬성:<%= pros_per%>%</div>
						<div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%= cons_per%>%; background-color: red;">반대:<%= cons_per%>%</div>
					</div>
				</td></tr>
			</tbody>
		</table>
		<form name="comment_form" action="main_comment_proc.jsp">
			<div class="row">
				<div class="col-md" style="text-align:left">
					<table class="table table-striped" style="border: 1px solid #dddddd">
						<thead>
							<tr><th style="background-color: #002266; color:white; text-align: center;">찬성측 의견 (<%=pros_count %> 개)</th></tr>
						</thead>
						<tbody>
						<%
							for(int i = 0; i < pros_count; i ++){
						%>
							<tr><td class="bttproperty2" opps="<%=pros_list.get(i).getOpposition()%>" id="<%=pros_list.get(i).getComment_id()%>" onclick="oppose(<%=pros_list.get(i).getComment_id()%>)">
								<div class="row">
									<div class="col-md" style="margin-left:10px;text-align:left">
									  	<h5><%=pros_list.get(i).getUsername()%></h5>
									</div>
									<div class="col-md" style="text-align:right">
										<%if(pros_list.get(i).getOpposition() > 0){%><span style="color:red;">( 지목중 )</span><%} %>
									  	추천수 : <%=pros_list.get(i).getUP() %>
									  	<button class="btn btn-primary pull-right" onclick="comup(<%=pros_list.get(i).getComment_id()%>)">공감</button>
									</div>
								</div>
								<%=pros_list.get(i).getContents()%>
								<div style="text-align:right; color:grey;">
									작성일 : <%=pros_list.get(i).getRegDate() %>
								</div>
							</td></tr>
						<%} %>
						</tbody>
					</table>
				</div>
				<div class="col-md" style="text-align:right">
					<table class="table table-striped" style="border: 1px solid #dddddd">
						<thead>
							<tr><th style="background-color: #670000; color:white; text-align: center;">반대측 의견 (<%=cons_count %> 개)</th></tr>
						</thead>
						<tbody>
							<%
								for(int i = 0; i < cons_count; i ++){
							%>
								<tr><td class="bttproperty2" opps="<%=cons_list.get(i).getOpposition()%>" id="<%=cons_list.get(i).getComment_id()%>" onclick="oppose(<%=cons_list.get(i).getComment_id()%>)">
									<div class="row">
										<div class="col-md" style="margin-left:10px;text-align:left">
										  	<h5><%=cons_list.get(i).getUsername()%></h5>
										</div>
										<div class="col-md" style="text-align:right">
											<%if(cons_list.get(i).getOpposition() > 0){%><span style="color:red;">( 지목중 )</span><%} %>
										  	추천수 : <%=cons_list.get(i).getUP() %>
										  	<button class="btn btn-primary pull-right" onclick="comup(<%=cons_list.get(i).getComment_id()%>)">공감</button>
										</div>
									</div>
									<%=cons_list.get(i).getContents()%>
									<div style="text-align:right; color:grey;">
										작성일 : <%=cons_list.get(i).getRegDate() %>
									</div>
								</td></tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<%if(session.getAttribute("id") == null || session.getAttribute("name") == null){ %>
				<ul class="list-group"><li class="list-group-item" style="text-align:center;">
					의견을 입력하려면 로그인이 필요합니다.
				</li></ul>
			<%}else{%>
				<div class="container">

				    <div class="btn-group" role="group" aria-label="...">
				      <button type="button" class="btn btn-primary button-class1">찬성의견 내기</button>
				      <button type="button" class="btn btn-default button-class2">반대의견 내기</button>
				    </div>
				</div>
			<tr><td>
				<input type="hidden" name="stand" value="p"/>
				<input type="hidden" name="bid" value="<%=cur_b.getBoard_id() %>"/>
				<input type="hidden" name="opposition" value="0"/>
				<textarea rows"3" class="form-control" placeholder="의견" name="content" maxlength="400" required></textarea>
				<br>
				<button class="btn btn-primary pull-right" onclick="addcom()">의견쓰기</button>
			</td></tr>
			<%} %>
		</form>
	</div>
</li></ul>
</div>
</body>
</html>