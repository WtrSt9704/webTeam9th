<%@page import="dao.Categorys.category"%>
<%@page import="dao.Categorys"%>
<%@page import="java.util.Locale.Category"%>
<script>
function changecat(s){
	document.category_c.target_category.value = s;
	document.category_c.submit();
}
function gototeaminfo(){
	location.href = "main_teaminfo.jsp";
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
	background-color: transparent;
}
.bttproperty:hover{
	background-color: #002130;
	color : white;
}
.bttproperty2{
	cursor: pointer;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}
.bttproperty2:hover{
	background-color: #002130;
	color : white;
}
</style>
<div class="col-md-2 float-left" style="background-color:#EAEAEA; padding-top:30px; padding-bottom:150px; margin-right:20px;">
<div class="panel">
    <div class="panel-heading">
      <h3 class="panel-title">안내</h3>
    </div>
    <!-- 사이드바 메뉴목록1 -->
	<ul class="list-group">
		<li class="list-group-item bttproperty" onclick="changecat('공지사항')">공지사항</li>
		<li class="list-group-item bttproperty" onclick="changecat('건의')">건의게시판</li>
	</ul>
</div>
  <!-- 패널 타이틀2 -->
<div class="panel">
  <div class="panel-heading">
    <h3 class="panel-title">토론 게시판</h3>
  </div>
    <!-- 사이드바 메뉴목록2 -->
	<ul class="list-group">
		<li class="list-group-item bttproperty" onclick="changecat('핫이슈')" style="color:red;">★ 핫이슈 ★</li>
		<li class="list-group-item bttproperty" onclick="changecat('전체')">전체 이슈</li>
		<% int total = Categorys.category.values().length;for(int i = 0; i < total; i ++ ){ %>
			<li class="list-group-item bttproperty" onclick="changecat('<%=Categorys.category.values()[i] %>')"><%=Categorys.category.values()[i] %></li>
		<% }%>
	</ul>
</div>      
  <!-- 패널 타이틀3 -->
<div class="panel">
  <div class="panel-heading">
    <h3 class="panel-title">개발자 정보</h3>
  </div>
      <!-- 사이드바 메뉴목록3 -->
      <ul class="list-group">
        <li class="list-group-item bttproperty" onclick="gototeaminfo()">참여 인원</li>
      </ul>
    </div>
</div> 
<form name="category_c" action="category-change-proc.jsp">
	<input type="hidden" name="target_category">
</form>