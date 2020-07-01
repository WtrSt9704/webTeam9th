<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>submit</title>
</head>
<body>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String docnum = request.getParameter("docnum");
	String comment = request.getParameter("comment");
	String anonymous = request.getParameter("anonymous");
	String name = anonymous == null ? (String)session.getAttribute("name") : "익명";
	int proscons = request.getParameter("radio_pc").equals("pros") ? 1 : 0;
	Statement stmt = null;

	try {
		String param = String.format("%s, '%s', '%s', %d", docnum, name, comment, proscons);
		String sql = "INSERT INTO comment(docnum, name, text, proscons) VALUES(" + param + ");";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);

		if (proscons == 1)
			conn.prepareStatement("update document set pros=pros+1 where num=" + docnum).executeUpdate();
		else
			conn.prepareStatement("update document set cons=cons+1 where num=" + docnum).executeUpdate();

		conn.prepareStatement("update document set comments=comments+1 where num=" + docnum).executeUpdate();

		response.sendRedirect("read.jsp?num=" + docnum);

	} catch (SQLException ex) {
		out.println("comment 테이블 삽입이 실패했습니다.<br>");
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
