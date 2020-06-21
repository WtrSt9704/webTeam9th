<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link type='text/css' rel='stylesheet' href='style.css'></link>
<title>회원가입</title>
<style>
	input[type="button"]{
		text-align: center;
	}
</style>
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
	<div>
		<div><img src="토론.png" style="width:300px"></div>
		<div class="basicbox" style="text-align: center;">
			<h4>회원가입</h4>
			<form name="hwf" style="text-align: left;" action="processSignup.jsp" method="POST">
				ID : <input type="text" name="id"><span id="chkbtt" class="btt" onclick="idchk()">중복검사</span><br>
				별명              : <input type="text" name="name"><br>
				비밀번호        : <input type="text" name="passwd"><br>
				비밀번호 확인 : <input type="text" name="passwdc">
				<input name="idchk" value="false" style="display:none; visibility:hidden;">
			</form>
			</div>
			<p></p>
			<div class="btt" onclick="check()">회원가입</div>
		</div>
	</div>
</body>
</html>