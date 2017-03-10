<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Kitrst's Blog</title>
		<link rel="stylesheet" href="resources/css/login.css" />
		<link rel="stylesheet" href="resources/css/font-awesome.min.css" />
	</head>
	<body>
		<div class="login">
			<div class="text">
				<img src="resources/images/login.png" />
			</div>
			<div class="container">
				<form id="form" method="post">
					<input name="username" type="text" placeholder="Username"/>
					<input name="password" type="password" placeholder="Password"/>
				</form>
				<a class="btn-login" href="javascript:void(0)">
					<span class="fa-stack fa-lg">
	 				<i class="fa fa-circle fa-stack-2x" style="color:#373737"></i>
					<i class="fa fa-arrow-circle-right fa-stack-1x fa-inverse" style="color:#9393FF"></i>
					</span>
				</a>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="resources/js/jquery.min.js" ></script>
	<script>
		$(".btn-login").click(function() {
			$("#form").submit();
		});
	</script>
</html>
