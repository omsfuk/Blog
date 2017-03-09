<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8"/>
<link href="resources/css/home_new.css" rel="stylesheet"/>
<style>
body {
	background:url(resources/images/bg/2.png) no-repeat;
	background-size:100% 100%;
}
</style>

</head>
<body>
	<div class="form-login">
		<div class="header">
			请登录
		</div>
		<form id="form">
			<input size="10" name="username" type="text" placeholder="请输入用户名"/>
			<input size="10" name="password" type="password" placeholder="请输入密码"/>
			<a class="btn-login" href="javascript:void(0)">GO</a>			
		</form>
		
	</div>
</body>
<script src="resources/js/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("a[class='btn-login']").click(function() {
		$("#form").submit();	
	})
		
})
</script>
</html>