<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>회원 가입 페이지</h1>
	<form action="signup.jsp" method="post" id="signupForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id"/>
			<p class="help-block" id="msg_notuse">사용 불가능한 아이디 입니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
			<p class="help-block" id="msg_tooshort">비밀번호가 너무 짧습니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
			<p class="help-block" id="msg_diff">비밀번호가 서로 다릅니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" />			
			<p class="help-block" id="msg_email">올바른 email 형식이 아닙니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</div>
<script>
	//아이디 유효성 여부
	var isIdValid=false;
	//아이디를 입력할때 실행할 함수 등록 
	$("#id").on("input", function(){
		//1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부를 응답 받는다.
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.jsp",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				//일단 초기화 시켜 놓고 
				$("#id")
				.parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback")
				.hide();
				
				if(responseData.isExist){//아이디가 이미 존재하는 경우 (사용불가)
					//색상을 빨간색으로 
					$("#id")
					.parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에러메세지 보이게 
					$("#msg_notuse").show();
					//상태 바꾸기 
					isIdValid=false;
				}else{//아닌경우(사용가능)
					$("#id")
					.parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					$("#msg_notuse").hide();
					isIdValid=true;
				}
			}
		});
	});
	
	//비밀번호 유효성 여부
	var isPwdValid=false;
	//비번을 입력할때 실행할 함수 등록 
	$("#pwd").on("input", function(){
		//1. 입력한 비번을 읽어온다.
		var inputPwd=$("#pwd").val();
		$("#pwd")
		.parent()
		.removeClass("has-success has-error")
		.find(".form-control-feedback")
		.hide();
		if(inputPwd.length<6){
			$("#pwd")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
			$("#msg_tooshort").show();
			isPwdValid=false;
		}else{
			$("#pwd")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
			$("#msg_tooshort").hide();
			isPwdValid=true;
		}
	});
	//비밀번호 일치 여부
	var isPwd2Valid=false;
	//비번확인을 입력할때 실행할 함수 등록 
	$("#pwd2").on("input", function(){
		//1. 입력한 비번들을 읽어온다.
		var inputPwd=$("#pwd").val();
		var inputPwd2=$("#pwd2").val();
		$("#pwd2")
		.parent()
		.removeClass("has-success has-error")
		.find(".form-control-feedback")
		.hide();
		if(inputPwd!=inputPwd2){
			$("#pwd2")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
			$("#msg_diff").show();
			isPwdValid=false;
		}else{
			$("#pwd2")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
			$("#msg_diff").hide();
			isPwdValid=true;
		}
	});
	//이메일 유효성 여부
	var isEmailValid=false;
	//이메일을 입력할때 실행할 함수 등록 
	$("#email").on("input", function(){
		//1. 입력한 비번을 읽어온다.
		var email=$("#email").val();
		//@가 포함돼있지 않으면 null
		var emailValid=email.match("@");
		$("#email")
		.parent()
		.removeClass("has-success has-error")
		.find(".form-control-feedback")
		.hide();
		if(emailValid==null){
			$("#email")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
			$("#msg_email").show();
			isPwdValid=false;
		}else{
			$("#email")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
			$("#msg_email").hide();
			isPwdValid=true;
		}
	});
	//폼에 제출 이벤트가 발생했을때 실행할 함수 등록
	$("#signupForm").on("submit", function(){
		//폼의 유효성 검증을 하고 만일 통과를 못하면 폼 제출을 막는다.
		
		//1. 아이디 유효성 검증
		if(!isIdValid){
			//잘못된 메세지를 띄우고 
			alert("아이디 중복확인을 하세요!");
			//잘못된 곳을 바로 입력할수 있도록 포커스 주기
			$("#id").focus();
			return false; //폼 제출 막기
		}
		
		//2. 비밀번호 유효성 검증
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd != pwd2){
			alert("비밀번호를 확인 하세요!");
			$("#pwd").focus();
			return false;
		}
		
		//3. 이메일 유효성 검증 
		var email=$("#email").val();
		// @ 가 포함 되어 있는지 확인한다 만일 포함되어 있지 않으면 null 이 리턴된다.
		var emailValid=email.match("@");
		if(emailValid == null){
			alert("이메일 형식에 맞게 입력하세요!");
			$("#email").focus();
			return false;
		}
		
	});
</script>
</body>
</html>