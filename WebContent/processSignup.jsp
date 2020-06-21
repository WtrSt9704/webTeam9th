<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		Statement stmt = null;

		try {
			String sql = "INSERT INTO Member(id, passwd, name) VALUES('" + id + "','" + passwd + "', '" + name + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			%>
			<div class="center"><div class="basicbox">
			<h1>회원가입 완료</h1>
			<a class="btt" href="login.jsp">로그인 화면으로</a>
			</div></div>
			<%
		} catch (SQLException ex) {
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>