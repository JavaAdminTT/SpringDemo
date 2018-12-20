<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/RestFulCRUD/city" method="post">
		Name:<form:input path="Name"/><br>
		CountryCode:<form:input path="CountryCode"/><br>
		District:<form:input path="District"/><br>
		Population:<form:input path="Population"/><br>
		<input type="submit" value="AddCity">
	</form:form>
</body>
</html>