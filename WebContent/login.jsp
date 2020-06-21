<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link type='text/css' rel='stylesheet' href='style.css'></link>
<title>토론사이트</title>
<style>
	input[type="button"]{
		text-align: center;
	}
</style>
<script type="text/javascript">
	function login( ){
		var form = document.hwf;
		var regExp2 = /[~!@\$%<>^&*]/;
		if(form.id.value.length == 0){
			alert("id를 입력해주세요.");
		}else if(form.passwd.value.length == 0){
			alert("비밀번호를 입력해주세요.");
		}else{
			url = "memberCheck.jsp?id=" + hwf.id.value + "&passwd="+hwf.passwd.value;
			window.open(url,"id check", "toolbar=no, width=300, height=150, top=150, left=150");
		}	
	} 
</script>
</head>
<body>
	<div class="center">
	<div>
		<div><img src="토론.png" style="width:300px"></div>
		<div class="basicbox" style="text-align: center;">
			<h2>로그인</h2>
			<form name="hwf" style="text-align: left;" action="processLogin.jsp" method="POST">
				ID : <input type="text" name="id"><br>
				비밀번호 : <input type="text" name="passwd">
			</form>
			</div>
			<p></p>
			<div class="btt" onclick="login()">로그인</div>
		</div>
	</div>
</body>
</html>