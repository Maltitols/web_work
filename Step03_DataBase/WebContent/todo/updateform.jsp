<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 수정할 할 일의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. TodoDao 객체를 이용해서 수정할 할 일의 정보를 얻어온다.
	TodoDto dto=TodoDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 form 에 잘 출력해서 응답한다. 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* navbar가 상단에 고정되면서 공간이 남아 겹쳐진다 */
	body{
		padding-top: 50px;
	}
</style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>
			<li><a href="">할 일 목록</a></li>
			<li><a href="">쇼핑</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀 더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>할 일 수정 폼</li>
	</ol>
	<h1>할 일 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="num">번호</label>
			<input class="form-control" type="text" id="num" value="<%=num%>" disabled/>
			<!-- disabled 된 input 요소는 form 전송 했을때 전송이 되지 않는다.
			따라서 번호도 같이 전송되게 하려면 input type="hidden" 으로 만들어 놓고
			form 전송했을때 번호도 같이 전송되게 한다. -->
			<input type="hidden" name="num" value="<%=num%>"/>
		</div>
		<div class="form-group">
			<label for="content">할 일</label>
			<input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent() %>" />
		</div>
		<div class="form-group">
			<label for="regdate">저장한 시간</label>
			<input class="form-control" type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" disabled/>
		</div>
		<button class="btn btn-primary" type="submit">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
</body>
</html>