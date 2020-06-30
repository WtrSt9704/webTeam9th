<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>

	<title>토론사이트</title>
	<link type='text/css' rel='stylesheet' href='resources/bootstrap.min.css'>
	<link type='text/css' rel='stylesheet' href='resources/style.css'>
	<script src="resources/sidebox.js"></script>
	<script src="resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"></script>

</head>

<body>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String category, title;
	int pros, comments, prosp, consp;
	try {
		String sql = "select * from document";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<div class="container-outer">
	<div class="logo-main">
		<img class="logo" src="resources/토론.png">
	</div>
	<div class="sidebox">
		<div class="basicbox user-info">
			<%=session.getAttribute("name") %>님 환영합니다. <br>
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

	<div class="container-inner">
		<table class="table table-striped table-bordered table-condensed">

			<thead>
			<tr>
				<th style="width: 10%;">분류</th>
				<th style="width: 40%;">제목</th>
				<th style="width: 40%;">토론 현황</th>
				<th style="width: 10%;">참여</th>
			</tr>
			</thead>

			<tbody>
			<%
				while(rs.next()) {
					category = rs.getString("category");
					title = rs.getString("title");
					pros = rs.getInt("pros");
					comments = rs.getInt("comments");

					if (comments > 0) {
						prosp = pros * 100 / comments;
						consp = 100 - prosp;
					}
					else {
						prosp = 0;
						consp = 0;
					}
			%>
			<tr>
				<td><%=category %></td>
				<td>
					<a href="#"><%=title %></a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width:<%=prosp %>%" aria-valuenow="<%=prosp %>" aria-valuemin="0" aria-valuemax="100">찬성 <%=prosp %>%</div>
						<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:<%=consp %>%" aria-valuenow="<%=consp %>" aria-valuemin="0" aria-valuemax="100">반대 <%=consp %>%</div>
					</div>
				</td>
				<td><%=comments %></td>
			</tr>
			<%
				}
			%>
			</tbody>
		</table>

		<div style="text-align: right;">
			<button class="btn btn-primary" id="write_post" onclick="location = 'writePost.jsp'">새 토론 만들기</button>
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

