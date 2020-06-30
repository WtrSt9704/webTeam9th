<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>토론사이트</title>
	<link type='text/css' rel='stylesheet' href='resources/bootstrap.min.css'>
	<link type='text/css' rel='stylesheet' href='resources/style.css'>
	<script src="resources/sidebox.js"></script>
	<script src="resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		// 새 토론 만들기 버튼 클릭
		$(function() {
			$('#write_post').click(function () {
				location.href = "writePost.jsp";
			});
		});
	</script>
</head>
<body>
<div class="container-outer">
	<div class="logo-main">
		<img class="logo" src="resources/토론.png">
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

	<div class="container-inner">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th style="width: 10%;">분류</th>
				<th style="width: 40%;">제목</th>
				<th style="width: 40%;">토론 현황</th>
				<th style="width: 10%;">참여</th>
			</tr>
			</thead>
			<%-- 이후에 jsp로 구현 --%>
			<tbody>
			<tr>
				<td>정치</td>
				<td>
					<a href="#">제목 1</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width:40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">찬성 40%</div>
						<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">반대 60%</div>
					</div>
				</td>
				<td>30</td>
			</tr>
			<tr>
				<td>사회</td>
				<td>
					<a href="#">제목 2</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width:27%" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100">찬성 27%</div>
						<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:73%" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100">반대 73%</div>
					</div>
				</td>
				<td>24</td>
			</tr>
			<tr>
				<td>교육</td>
				<td>
					<a href="#">제목 3</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width:80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">찬성 80%</div>
						<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">반대 20%</div>
					</div>
				</td>
				<td>10</td>
			</tr>
			<tr>
				<td>문화</td>
				<td>
					<a href="#">제목 4</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width:62%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="62">찬성 62%</div>
						<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:38%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="38">반대 38%</div>
					</div>
				</td>
				<td>70</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 5</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 6</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 7</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 8</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 9</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			<tr>
				<td>기타</td>
				<td>
					<a href="#">제목 10</a>
				</td>
				<td>
					<div class="progress">
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">찬성 0%</div>
						<div class="progress-bar bg-secondary progress-bar-striped" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">반대 0%</div>
					</div>
				</td>
				<td>0</td>
			</tr>
			</tbody>
		</table>

		<div style="text-align: right;">
			<button class="btn btn-primary" id="write_post">새 토론 만들기</button>
		</div>
	</div>

</div>
</body>
</html>