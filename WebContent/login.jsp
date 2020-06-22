<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link type='text/css' rel='stylesheet' href='style.css'>
<title>토론사이트</title>
<script type="text/javascript">
	function login( ){
		var form = document.hwf;
		var regExp2 = /[~!@$%<>^&*]/;
		if(form.id.value.length == 0){
			alert("id를 입력해주세요.");
		}else if(form.passwd.value.length == 0){
			alert("비밀번호를 입력해주세요.");
		}else{
			url = "memberCheck.jsp?id=" + hwf.id.value + "&passwd="+hwf.passwd.value;
			window.open(url,"id check", "toolbar=no, width=300, height=150, top=150, left=150");
		}
	}
	function signup() {
		location.href = "signup.jsp";
	}
</script>
</head>
<body>
	<div class="center">
		<div>
			<div><img class="logo" src="토론.png"></div>
			<div class="basicbox">
				<h2>로그인</h2>
				<form name="hwf" action="processLogin.jsp" method="POST">
					<label class="label-login" for="id">ID : </label>
					<input type="text" id="id" name="id"> <br>
					<label class="label-login" for="passwd">비밀번호 : </label>
					<input type="password" id="passwd" name="passwd">
				</form>
			</div>
			<button class="btt" onclick="login()">로그인</button> <br>
			<button class="btt" onclick="signup()">회원가입</button>
		</div>
	</div>
</body>
</html>
