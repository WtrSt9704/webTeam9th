<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>submit</title>
</head>
<body>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String anonymous = request.getParameter("anonymous");
	String category = request.getParameter("category");
	String post = request.getParameter("post");
	String id = (String)session.getAttribute("id");
	String name = anonymous == null ? "익명" : (String)session.getAttribute("name");
	Statement stmt = null;

	try {
		String param = String.format("'%s', '%s', '%s', '%s', '%s', 0, 0, 0", id, name, category, title, post);
		String sql = "INSERT INTO document(id, name, category, title, text, pros, cons, comments) VALUES(" + param + ");";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		response.sendRedirect("main.jsp");
	} catch (SQLException ex) {
		out.println("document 테이블 삽입이 실패했습니다.<br>");
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
