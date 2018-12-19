<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/WEB-INF/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
/* $(function(){
	alert(1);
	$("#maniForm").submit(	   
			alert(2);
		    var form = $(this);
		    
		    $.ajax({
		        url: form.attr("action"),
		        type: form.attr("mathod"),
		        data: form.serialize(),
		        dataType: "json",
		        error: function (){
		 			alert("Error");
		        },
		        success: function (data){
		           alert(data);
		        }
		    });
		);
});
 */

</script>
<body>

	<form action="/SpringMVC/moattr" method="post" id="maniForm">
	userName:<input type="text" name="userName"><br>
	password:<input type="password"><br>
	age:         <input type="text" name="age"><br>
	gender:    <input type="text" name="gender"><br>
	                <input type="submit" value="submit" id="sub">
	</form>
</body>
</html>