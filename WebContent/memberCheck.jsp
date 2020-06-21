<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<script type="text/javascript">
	function ok( ){
		opener.document.hwf.id.focus();
		window.close();
	}
</script>
<link type='text/css' rel='stylesheet' href='style.css'></link>
<title>등록</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name;
try {
	String sql = "select name from member where id=? AND passwd=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	rs = pstmt.executeQuery();
	if(rs.next()){
		name = rs.getString("name");
		session.setAttribute("id", id);
		session.setAttribute("name", name);
%>
<script>
opener.document.hwf.submit();
window.close();
</script>
<%
	}else{
%>
<div class="basicbox">
<p>id와 비밀번호를 확인해주세요.<p/>

		<a class="btt" href="#" onclick = "ok()">닫기</a>
</div>
<%
	}
} catch (SQLException ex) {
	out.println("Member 테이블 호출이 실패했습니다.<br>");
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
