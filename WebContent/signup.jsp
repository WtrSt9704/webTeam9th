<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link type='text/css' rel='stylesheet' href='style.css'>
<title>회원가입</title>
<%@ include file="dbconn.jsp" %>
<script type="text/javascript">
	function check( ){
		var form = document.hwf;
		var prev;
		var count = 0;
		var regExp1 = /[a-zA-Z]/;
		var regExp2 = /[~!@\$%<>^&*]/;
		var regExp3 = /[0-9]/;
		if(form.idchk.value == "false"){
			alert("id 중복체크를 해주세요.");
		}
		else if(form.name.value.length < 3){
			alert("별명은 세 글자 이상이어야 합니다.");
		}
		else if(regExp2.test(form.name.value)){
			alert("특수문자는 사용할 수 없습니다.");
		}else if(regExp1.test(form.passwd.value) && regExp2.test(form.passwd.value) && regExp3.test(form.passwd.value)&& form.passwd.value.length >= 8){
			if(form.passwd.value == form.passwdc.value)
				form.submit();
			else{
				alert("비밀번호가 일치하지 않습니다.");
				form.passwdc.focus();
			}
		}else{
			alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
		}
 	}
	function idchk(){
		var form = document.hwf;
		var regExp2 = /[~!@\$%<>^&*]/;
		if(form.id.value.length < 8 || regExp2.test(form.id.value)){
			alert("id는 8글자 이상에 특수문자를 포함하지 않아야 합니다.");
		}else{
			url = "idCheck.jsp?id=" + hwf.id.value;
			window.open(url,"id check", "toolbar=no, width=300, height=150, top=150, left=150");
		}
		
	}
	
</script>
</head>
<body>
	<div class="center">
	<div style="text-align: center;">
		<img class="logo" src="토론.png">
		<div class="basicbox" style="text-align: center;">
			<h4>회원가입</h4>
			<form name="hwf" style="text-align: left;" action="processSignup.jsp" method="POST">
				<label class="label-signup" for="id">ID : </label>
				<input type="text" id="id" name="id">
				<span id="chkbtt" class="btt" onclick="idchk()">중복검사</span> <br>
				<label class="label-signup" for="name">별명 : </label>
				<input type="text" id="name" name="name"> <br>
				<label class="label-signup" for="passwd">비밀번호 : </label>
				<input type="password" id="passwd" name="passwd"> <br>
				<label class="label-signup" for="passwdc">비밀번호 확인 : </label>
				<input type="password" id="passwdc" name="passwdc">
				<input name="idchk" value="false" style="display:none; visibility:hidden;">
			</form>
			</div>
			<button class="btt" onclick="check()">회원가입</button>
		</div>
	</div>
</body>
</html>