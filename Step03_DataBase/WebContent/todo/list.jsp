<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
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
	</ol>
	<h1>할 일 목록 입니다.</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>할 일</th>
				<th>등록/수정된 시간</th>
				<th>수정 하러 가기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(TodoDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/todo/insertform.jsp">할 일 추가 하러가기</a>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 todo 를 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>



