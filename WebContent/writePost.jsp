<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>새 토론 만들기</title>
	<link type='text/css' rel='stylesheet' href='resources/bootstrap.min.css'>
	<link type='text/css' rel='stylesheet' href='resources/style.css'>
	<script src="resources/sidebox.js"></script>
	<script src="resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function() {

			// 등록 버튼 클릭
			$('#submit').click(function () {

				if ($.trim($('#title').val()) === '')
					alert("제목을 입력해 주세요.");

				else if ($('#category').val() === 'none')
					alert("분류를 선택해 주세요.");

				else if ($.trim($('#post').val()) === '')
					alert("내용을 입력해 주세요.");
				else
					$('#form_write').submit();
			});
			// 취소 버튼 클릭
			$('#cancel').click(function() {
				if (confirm("작성 중인 내용이 모두 사라집니다.\n취소하시겠습니까?"))
					location.href = "main.jsp";
			});
		});
	</script>
</head>
<body>
<div class="container-outer">
	<div class="logo-main">
		<a href="main.jsp">
			<img class="logo" src="resources/토론.png">
		</a>
	</div>
	<div class="sidebox">
		<div class="basicbox user-info">
			<%=session.getAttribute("name") %>님 환영합니다. <br>
			<button class="btt" onclick="mypage()">마이페이지</button>
			<button class="btt" onclick="logout()">로그아웃</button>
		</div>

		<div class="side-menu">
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
			<div class="side-list">목록</div>
		</div>
	</div>

	<div class="container-inner" style="border: 1px solid gray; padding: 3%;">
		<h2>글 쓰기</h2>
		<form id="form_write" action="submitPost.jsp" method="POST">
			<div class="form-inline" style="margin: 40px 0 15px;">
				<label for="title" style="margin-right: 10px;">제목:</label>
				<input type="text" class="form-control" id="title" name="title" style="width: 70%;">
				<input type="checkbox" class="btn btn-primary" id="anonymous" name="anonymous" style="margin-left: 35px;">
				<label for="anonymous" style="margin-left: 10px;">익명</label>
			</div>
			<div class="form-inline" style="margin-bottom: 40px;">
				<label for="category" style="margin-right: 10px;">분류:</label>
				<select class="form-control" id="category" name="category" style="width: 90px">
					<option value="none">선택</option>
					<option value="사회">사회</option>
					<option value="경제">경제</option>
					<option value="정치">정치</option>
					<option value="문화">문화</option>
					<option value="기술">기술</option>
					<option value="환경">환경</option>
					<option value="헌법">헌법</option>
					<option value="교육">교육</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div style="margin-bottom: 15px;">
				<textarea class="form-control" id="post" name="post" rows="10"></textarea>
			</div>
		</form>
		<div style="text-align: right;">
			<button class="btn btn-secondary" id="cancel">취소</button>
			<button class="btn btn-primary" id="submit">등록</button>
		</div>
	</div>

</div>
</body>
</html>