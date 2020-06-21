<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<script type="text/javascript">
	function ok( ){
		opener.document.hwf.passwd.focus();
		opener.document.hwf.idchk.value='true';
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
try {
	String sql = "select id from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
%>
<div class="basicbox">
<p>이미  사용중인 id 입니다.<p/>

		<a class="btt" href="#" onclick = "opener.document.hwf.id.focus(); window.close();">닫기</a>
</div>
<%
	}else{
%>
<div class="basicbox">
<p>사용 가능 합니다.<p/>

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
