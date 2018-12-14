<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/SpringMVC/user/90">SELECT_USER</a>
	<br>
	<br>
	<form action="/SpringMVC/user/80" method="post">
		<input type="text" name="id"> <br> <input type="submit"
			value="INSERT_USER">
	</form>
	<br>
	<br>
	<form action="/SpringMVC/user/70" method="post">
		<input type="hidden" name="_method" value="PUT"> <br>
		<br> <input type="text" name="id"> <br>
		<br> <input type="submit" value="UPDATE_USER">
	</form>
	<br>
	<br>
	<form action="/SpringMVC/user/60" method="post">
		<input type="hidden" name="_method" value="DELETE"> <br>
		<br> <input type="text" name="id"> <br>
		<br> <input type="submit" value="DELETE_USER">
	</form>
	<br>
	<br>
<span >${userId }</span>
</body>
</html>