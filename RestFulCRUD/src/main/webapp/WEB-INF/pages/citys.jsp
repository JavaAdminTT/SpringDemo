<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/RestFulCRUD/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".delBtn").click(function(){
			$("#myFrom").attr("action",this.href);
			$("#myFrom").submit();
			return false;
		});
	});
</script>
<body>
	<div>
		<c:if test="${empty citys || citys == null }">
		   <h1>沒有任何員工</h1>
		</c:if>
		<h1>员工信息</h1>
		<table border="1" >
			<thead >
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>CountryCode</th>
					<th>District</th>
					<th>Population</th>
					<th>update</th>
					<th>delete</th>
				</tr>
			</thead>
			<c:forEach items="${citys }" var="city">
				<tr>
					<th>${city.ID }</th>
					<th>${city.name }</th>
					<th>${city.countryCode }</th>
					<th>${city.district }</th>
					<th>${city.population }</th>
					<th><a href="/RestFulCRUD/city/${city.ID }">update</a></th>
					<th><a href="/RestFulCRUD/city/${city.ID }" class="delBtn">DEL</a></th>
				</tr>
			</c:forEach>
		</table>
			<a href="/RestFulCRUD/gotoAddPage">添加城市</a>
			
			<form action="" method="post" id="myFrom">
				<input type="hidden" name="_method" value="DELETE">
			</form>
	</div>
</body>
</html>