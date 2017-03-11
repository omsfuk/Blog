<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome</title>
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/admin/css/navbar.css" />
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/admin/css/index.css" />
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/common/css/font-awesome.min.css" />
	</head>
	<body>
		<div class="navbar">
			<a href="<%=application.getInitParameter("rootURL") %>/admin/index">
				<div class="btn-nav">
					<span class="fa fa-paper-plane-o fa-2x"></span>
					<span class="text">Home</span>
				</div>
			</a>
			<a href="<%=application.getInitParameter("rootURL") %>/admin/new">
				<div class="btn-nav">
					<span class="fa fa-file-o fa-2x"></span>
					<span class="text">New</span>
				</div>
			</a>
			<a href="<%=application.getInitParameter("rootURL") %>/admin/manage">
				<div class="btn-nav">
					<span class="fa fa-edit fa-2x"></span>
					<span class="text">Manage</span>
				</div>
			</a>
			<a href="<%=application.getInitParameter("rootURL") %>/admin/tags">
				<div class="btn-nav">
					<span class="fa fa-tags fa-2x"></span>
					<span class="text">Tags</span>
				</div>
			</a>
			<a href="<%=application.getInitParameter("rootURL") %>/admin/logout">
				<div class="btn-nav">
					<span class="fa fa-sign-in fa-2x"></span>
					<span class="text">LogOut</span>
				</div>
			</a>
		</div>		
		
		<div class="main">
			<div class="title">
				Welcome, Kitrst
			</div>
			<div class="title">
				You Have Written
			</div>
			<div class="emphisis">
				${articleCount}
			</div>
			<div class="title">
				Blogs
			</div>
		</div>
	</body>
</html>
