<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>토론사이트</title>
	<link type='text/css' rel='stylesheet' href='resources/bootstrap.min.css'>
	<link type='text/css' rel='stylesheet' href='resources/style.css'>
	<script src="resources/sidebox.js"></script>
	<script src="resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var label_pros = $('#label_pros');
			var label_cons = $('#label_cons');

			$('#pros').click(function () {
				label_pros.removeClass("btn-secondary");
				label_pros.addClass("btn-primary");
				label_cons.removeClass("btn-danger");
				label_cons.addClass("btn-secondary");
			})

			$('#cons').click(function () {
				label_pros.removeClass("btn-primary");
				label_pros.addClass("btn-secondary");
				label_cons.removeClass("btn-secondary");
				label_cons.addClass("btn-danger");
			})

			$('#submit').click(function () {

				if ($(':radio[name="radio_pc"]:checked').val() === undefined)
					alert('찬성/반대를 선택해 주세요.');

				else if ($.trim($('#text_comment').val()) === '')
					alert("내용을 입력해 주세요.");
				else
					$('#form_write').submit();
			});
		});
	</script>

</head>

<body>
<%@ include file="dbconn.jsp" %>
<%
	String num = request.getParameter("num");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String name, category, title, text;
	int pros, cons, comments, visit, prosp, consp;
	try {
		// 조회수++
		conn.prepareStatement("update document set visit=visit+1 where num=" + num).executeUpdate();

		// 글 읽기
		String sql = "select * from document where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();

		rs.next();
		name = rs.getString("name");
		category = rs.getString("category");
		title = rs.getString("title");
		text = rs.getString("text");
		pros = rs.getInt("pros");
		cons = rs.getInt("cons");
		comments = rs.getInt("comments");
		visit = rs.getInt("visit");

		if (comments > 0) {
			prosp = pros * 100 / comments;
			consp = 100 - prosp;
		}
		else {
			prosp = 0;
			consp = 0;
		}
		rs.close();
		pstmt.close();

		// 댓글 가져오기
		String cName, cText, color;
		int cPros;

		sql = "select * from comment where docnum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
%>

<div class="container-outer">
	<div class="logo-main">
		<a href="main.jsp">
			<img class="logo" src="resources/토론.png">
		</a>
	</div>
	<div class="sidebox">
		<div class="basicbox user-info">
			<%=session.getAttribute("name") %>님 환영합니다.<br>
			<button class="btt" onclick="mypage()">마이페이지</button>
			<button class="btt" onclick="logout()">로그아웃</button>
		</div>

		<div class="side-menu">
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
		</div>
	</div>

	<div class="container-inner" style="border: 1px solid gray; padding: 3%;">

		<%-- 제목, 헤더 부분 --%>
		<h2 style="margin-bottom: 20px;"><%=title %></h2>

		<span class="name-label">작성</span>
		<span class="name-body"><%=name %></span>
		<span class="split-bar"></span>

		<span class="name-label">조회</span>
		<span class="name-body"><%=visit %></span>
		<span class="split-bar"></span>

		<span class="name-label">의견</span>
		<span class="name-body"><%=comments %></span>

		<hr>

		<%-- 본문 부분 --%>
		<div class="text-body">
			<%=text %>
		</div>

		<div class="progress" style="width: 90%; margin: 15% 5% 5% 5%;">
			<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated " role="progressbar" style="width:<%=prosp %>%;" aria-valuenow="<%=prosp %>" aria-valuemin="0" aria-valuemax="100">찬성 <%=prosp %>%</div>
			<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:<%=consp %>%;" aria-valuenow="<%=consp %>" aria-valuemin="0" aria-valuemax="100">반대 <%=consp %>%</div>
		</div>

		<hr style="margin-bottom: 5%;">

		<%-- 의견 부분 --%>
		<span class="name-label" style="font-size: x-large">의견</span>
		<span class="name-body" style="font-size: x-large"><%=comments %></span>
		<%
			while (rs.next()) {
				cName = rs.getString("name");
				cText = rs.getString("text");
				cPros = rs.getInt("proscons");
				color = cPros == 1 ? "lightblue" : "pink";
		%>
		<div class="comment" style="background: <%=color %>;">
			<b><%=cName %></b>
			<div class="comment-body">
				<%=cText %>
			</div>
		</div>
		<%
			}
		%>
		<form id="form_write" action="submitComment.jsp" method="POST">
			<textarea class="form-control" id="text_comment" name="comment" rows="4" placeholder="의견 작성" style="margin-top: 5%;"></textarea>
			<div class="btn-group-toggle" data-toggle="buttons" style="text-align: center; margin-top: 2%;">
				<label class="btn btn-secondary" id="label_pros" style="width:20%; margin: 1%;">
					<input type="radio" name="radio_pc" id="pros" value="pros" style="width:50px; margin: 1%;"> 찬성
				</label>
				<label class="btn btn-secondary" id="label_cons" style="width:20%; margin: 1%;">
					<input type="radio" name="radio_pc" id="cons" value="cons" style="width:50px; margin: 1%;"> 반대
				</label>
			</div>
		</form>
		<div style="text-align: right;">
			<button class="btn btn-primary" id="submit">작성</button>
		</div>
	</div>
</div>

<%
	} catch (SQLException ex) {
	out.println("document 테이블 호출이 실패했습니다.<br>");
	out.println("SQLException: " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}
%>

</body>
</html>
