<link type='text/css' rel='stylesheet' href='style.css'>
<script>
function login() {
	location.href = "login.jsp";
}
function logout() {
	location.href = "logout-proc.jsp";
}
</script>
<style>
.bttproperty{
	cursor: pointer;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
	transition : 0.5s;
	display : inline-block;
}
.bttproperty:hover{
	background-color: #002130;
}
h4.headerbar{
display:inline;
}
</style>
<a href="main.jsp">
<div style="text-align:center; background-color:#CC3D3D">
	<img src="resources/images/logo.png" style="width:200px">
</div>
</a>
<div style="text-align:right; color:white;background-color:#005766; height:40px;">
	<div style="padding-right:20px;">
		<h4 class="headerbar">|</h4>
<% if(session.getAttribute("id") == null){ %>
		<div class="bttproperty" onclick="login()" style="height:100%;"><h4> Login </h4></div>
<%}else{ %>
		<div class="bttproperty" onclick="logout()" style="height:100%;"><h4> Logout </h4></div>
<%} %>
	</div>
</div>