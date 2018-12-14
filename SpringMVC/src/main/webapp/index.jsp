<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="/SpringMVC/param?id=789">Hello_SpringMVC</a><br><br>

<form action="/SpringMVC/login" method="post">

	UserName: <input type="text" name="userName"><br>
	Password:  <input type="password" name="password"><br>
	Age :          <input type="text" name="age"><br>
	Gender:      <input type="text" name="gender"><br>
	
	<input type="submit" value="login">

</form>
</body>
</html>