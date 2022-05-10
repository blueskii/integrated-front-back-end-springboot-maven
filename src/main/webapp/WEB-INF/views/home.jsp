<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>SpringFramework</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<div class="card m-2">
			<div class="card-header">
				Rest API 테스트
			</div>
			<div class="card-body">
			
				<div class="card m-2">
					<div class="card-header">
						회원 가입
					</div>
					<div class="card-body">
						<div>
							<form id="joinForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" autocomplete="username">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mname</span></div>
									<textarea name="mname" class="form-control"></textarea>
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control" autocomplete="current-password">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mrole</span></div>
									<select class="form-control" name="mrole">
										<option value="ROLE_ADMIN">ROLE_ADMIN</option>
										<option value="ROLE_MANAGER">ROLE_MANAGER</option>
										<option value="ROLE_USER" selected>ROLE_USER</option>
									</select>
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">memail</span></div>
									<input type="email" name="memail" class="form-control">
								</div>
									
								<div class="mt-3">
									<a href="javascript:join1()" class="btn btn-info btn-sm mr-2">POST /member/join1</a>
									<a href="javascript:join2()" class="btn btn-info btn-sm">POST /member/join2</a>
								</div>
							</form>		
							<script th:inline="javascript">
								function join1() {
									var member = {
										mid: 		$("#joinForm [name=mid]").val(),
										mname: 		$("#joinForm [name=mname]").val(),
										mpassword: 	$("#joinForm [name=mpassword]").val(),
										mrole: 		$("#joinForm [name=mrole]").val(),
										memail: 	$("#joinForm [name=memail]").val(),
									};
									
									$.ajax({
										url: "${pageContext.request.contextPath}/member/join1",
										method: "post",
										data: member
									}).done((data) => {
										console.log(data);
									});
								}
								
								function join2() {
									var member = {
										mid: 		$("#joinForm [name=mid]").val(),
										mname: 		$("#joinForm [name=mname]").val(),
										mpassword: 	$("#joinForm [name=mpassword]").val(),
										mrole: 		$("#joinForm [name=mrole]").val(),
										memail: 	$("#joinForm [name=memail]").val(),
									};
									
									$.ajax({
										url: "${pageContext.request.contextPath}/member/join2",
										method: "post",
										data: JSON.stringify(member),
										contentType: "application/json",
										processData: false //data를 QueryString으로 표현하지 않음
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>	
				
				<div class="card m-2">
					<div class="card-header">
						인증
					</div>
					<div class="card-body">
						<div>
							<form id="loginForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" autocomplete="username">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control" autocomplete="current-password">
								</div>
									
								<div class="mt-3">
									<a href="javascript:login1()" class="btn btn-info btn-sm mr-2">POST /member/login1</a>
									<a href="javascript:login2()" class="btn btn-info btn-sm">POST /member/login2</a>
								</div>
							</form>			
							<script th:inline="javascript">
								function login1() {
									var mid = $("#loginForm [name=mid]").val();
									var mpassword = $("#loginForm [name=mpassword]").val();
									$.ajax({
										url: "${pageContext.request.contextPath}/member/login1",
										method: "post",
										data: {mid, mpassword}
									}).done((data) => {
										console.log(data);
										sessionStorage.setItem("mid", data.mid);
									    sessionStorage.setItem("jwt", data.jwt);
									});
								}
								
								function login2() {
									var mid = $("#loginForm [name=mid]").val();
									var mpassword = $("#loginForm [name=mpassword]").val();
									$.ajax({
										url: "${pageContext.request.contextPath}/member/login2",
										method: "post",
										data: JSON.stringify({mid, mpassword}),
										contentType: "application/json",
										processData: false //data를 QueryString으로 표현하지 않음
									}).done((data) => {
										console.log(data);
										sessionStorage.setItem("mid", data.mid);
									    sessionStorage.setItem("jwt", data.jwt);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						인증 확인
					</div>
					<div class="card-body">
						<div>
							<a href="javascript:authTest1()" class="btn btn-info btn-sm mr2">GET /board/test(without jwt)</a>
							<a href="javascript:authTest2()" class="btn btn-info btn-sm">GET /board/test(with jwt)</a>
							<script th:inline="javascript">
								function authTest1() {
									$.ajax({
										url: "${pageContext.request.contextPath}/board/test"
									}).done((data) => {
										console.log(data);
									});
								}
								
								function authTest2() {
									$.ajax({
										url: "${pageContext.request.contextPath}/board/test",
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 목록
					</div>
					<div class="card-body">		
						<div>
							<a href="javascript:getBoardList()" class="btn btn-info btn-sm">GET /board/list</a>
							<script th:inline="javascript">
								function getBoardList() {
									$.ajax({
										url: "${pageContext.request.contextPath}/board/list",
										data: {pageNo:1},
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 보기
					</div>
					<div class="card-body">			
						<div>
							<form id="boardInfoForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bno</span></div>
									<input type="text" name="bno" class="form-control">
								</div>	
								<div class="mt-3">
									<a href="javascript:getBoard()" class="btn btn-info btn-sm mr-2">GET /board/{bno}</a>
								</div>		
							</form>
							<script th:inline="javascript">
								function getBoard() {
									const bno = $("#boardInfoForm [name=bno]").val();
									
									$.ajax({
										url: "${pageContext.request.contextPath}/board/" + bno,
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 쓰기
					</div>
					<div class="card-body">	
						<div>
							<form id="boardInsertForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">btitle</span></div>
									<input type="text" name="btitle" class="form-control">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bcontent</span></div>
									<textarea name="bcontent" class="form-control"></textarea>
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" value="user" readonly>
								</div>
								
								<div class="input-group">
								    <div class="input-group-prepend"><span class="input-group-text">battach</span></div>
								    <input type="file" class="form-control" name="battach">
							  	</div>
									
								<div class="mt-3">
									<a href="javascript:createBoard()" class="btn btn-info btn-sm mr-2">POST /board/create</a>
								</div>
							</form>
							<script th:inline="javascript">
								function createBoard() {
									const btitle = $("#boardInsertForm [name=btitle]").val();
									const bcontent = $("#boardInsertForm [name=bcontent]").val();
									const mid = $("#boardInsertForm [name=mid]").val();
									const battach = document.querySelector("#boardInsertForm [name=battach]").files[0];
									
									//Multipart/form-data
									const formData = new FormData();
									formData.append("btitle", btitle);
									formData.append("bcontent", bcontent);
									formData.append("mid", mid);
									if(battach) {
										formData.append("battach", battach);
									}
									
									$.ajax({
										url: "${pageContext.request.contextPath}/board/create",
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
										method: "post",
										data: formData,
										processData: false,
										contentType: false,
										cache: false
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 수정
					</div>
					<div class="card-body">	
						<div>
							<form id="boardUpdateForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bno</span></div>
									<input type="text" name="bno" class="form-control">
								</div>			
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">btitle</span></div>
									<input type="text" name="btitle" class="form-control">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bcontent</span></div>
									<textarea name="bcontent" class="form-control"></textarea>
								</div>
								
								<div class="input-group">
								    <div class="input-group-prepend"><span class="input-group-text">battach</span></div>
								    <input type="file" class="form-control" name="battach">
							  	</div>
									
								<div class="mt-3">
									<a href="javascript:updateBoard()" class="btn btn-info btn-sm mr-2">POST /board/update</a>
								</div>
							</form>
							<script th:inline="javascript">
								function updateBoard() {
									const bno = $("#boardUpdateForm [name=bno]").val();
									const btitle = $("#boardUpdateForm [name=btitle]").val();
									const bcontent = $("#boardUpdateForm [name=bcontent]").val();
									const battach = document.querySelector("#boardUpdateForm [name=battach]").files[0];
									
									//Multipart/form-data
									const formData = new FormData();
									formData.append("bno", bno);
									formData.append("btitle", btitle);
									formData.append("bcontent", bcontent);
									if(battach) {
										formData.append("battach", battach);
									}
									
									$.ajax({
										url: "${pageContext.request.contextPath}/board/update",
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
										//multipart/form-data 인코딩된 데이터는 반드시 POST 방식으로 처리(PUT 방식이 아님)
										method: "post",
										data: formData,
										processData: false,
										contentType: false,
										cache: false
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 삭제
					</div>
					<div class="card-body">	
						<div>
							<form id="boardDeleteForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bno</span></div>
									<input type="text" name="bno" class="form-control">
								</div>	
								<div class="mt-3">
									<a href="javascript:deleteBoard()" class="btn btn-info btn-sm mr-2">DELETE /board/{bno}</a>
								</div>		
							</form>
							<script th:inline="javascript">
								function deleteBoard() {
									const bno = $("#boardDeleteForm [name=bno]").val();
									
									$.ajax({
										url: "${pageContext.request.contextPath}/board/" + bno,
										headers: {Authorization:"Bearer " + sessionStorage.getItem("jwt")},
										method: "delete",
									}).done((data) => {
										console.log(data);
									});
								}
							</script>
						</div>
					</div>
				</div>
				
				<div class="card m-2">
					<div class="card-header">
						게시물 첨부 가져오기
					</div>
					<div class="card-body">	
						<div>
							<form id="downloadAttachForm">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">bno</span></div>
									<input type="text" name="bno" class="form-control">
								</div>	
								<div class="mt-3">
									<a href="javascript:downloadAttach()" 
									   class="btn btn-info btn-sm mr-2">GET /board/battach/{bno}</a>
								</div>		
							</form>
							<img id="attachImg" class="mt-2" width="300px"/>
							<script th:inline="javascript">
								function downloadAttach() {
									const bno = $("#downloadAttachForm [name=bno]").val();
									const url = "${pageContext.request.contextPath}/board/battach/" + bno;
									const jwt = "jwt=" + sessionStorage.getItem("jwt");
									$("#attachImg").attr("src", url + "?" + jwt);
								}
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>