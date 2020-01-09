<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* navbar가 상단에 고정되면서 공간이 남아 겹쳐진다 */
	body{
		padding-top: 50px;
	}
</style>
</head>
<body>
<%-- 피 include 되는 jsp 페이지에 파라미터를 전달할수 있음 --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="category"/>
</jsp:include>
<div class="container">
	<!-- 현재 페이지의 위치를 좀 더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>할 일 추가 폼</li>
	</ol>
	<h1>할 일 추가 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="content">할 일</label>
			<input class="form-control" type="text" name="content" id="content"/>
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
	</form>
</div>
</body>
</html>