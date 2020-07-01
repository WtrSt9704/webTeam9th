<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>토론사이트</title>
<style>
</style>
<script>
	function replacesubmit(){
		
		var form = document.writeform;
		if(form.subject.value.length == 0){
			alert("제목을 입력해야 합니다.");
		}else if(form.content.value.length == 0){
			alert("내용을 입력해야 합니다.");
		}else{
			form.subject.value = String(form.subject.value).replace(/ /gi, "&nbsp;");
			form.subject.value = String(form.subject.value).replace(/\n/gi, "<br>");
			form.content.value = String(form.content.value).replace(/ /gi, "&nbsp;")
			form.content.value = String(form.content.value).replace(/\n/gi, "<br>")
			form.submit();
		}
	}
</script>
</head>
<body>
<% if(session.getAttribute("id") == null || session.getAttribute("name") == null){
		out.println("<script>alert('로그인이 필요합니다!');location.href='login.jsp';</script>");
	} 
%>
<div>
<%@ include file="main_header.jsp"%>
<%@ include file="main_nav.jsp"%>
<% String cur_category = session.getAttribute("category") == null? "":session.getAttribute("category").toString();%>
<ul class="list-group"><li class="list-group-item">
	<div class="container">
		<form name="writeform" method="post" action="main_write_proc.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">
						<% if("공지사항".equals(cur_category) || "건의".equals(cur_category)){ %>
							<%=cur_category %>
							<input type="hidden" name="category" value="<%=cur_category %>"/>
						<%}else{ %>
						<select name="category">
							<% for(int i = 0; i < total; i ++ ){%>
								<option class="list-group-item bttproperty" value="<%=Categorys.category.values()[i] %>" <%if(Categorys.category.values()[i].toString().equals(cur_category)){ %> selected<%} %>><%=Categorys.category.values()[i] %></option>
							<% }%>
						</select>
							 게시판
							 <%} %>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="50" required/></td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;" required></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
		<button class="btn btn-primary pull-right" onclick="replacesubmit()">글쓰기</button>
	</div>
</li></ul>
</div>
</body>
</html>