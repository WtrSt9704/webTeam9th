<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>submit</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String anonymous = request.getParameter("anonymous");
	String category = request.getParameter("category");
	String post = request.getParameter("post");
	out.println(title);
	out.println(anonymous);
	out.println(category);
	out.println(post);
%>
</body>
</html>
