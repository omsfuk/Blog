<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Home</title>
		<link href="<%=application.getInitParameter("rootURL") %>/resources/home/css/home.css" rel="stylesheet" />
		<link href="<%=application.getInitParameter("rootURL") %>/resources/common/css/font-awesome.min.css" rel="stylesheet" />
	</head>
	<body>
		<div class="navbar">
			<div class="black-bg">				
			</div>
			<img class="portrait" src="resources/home/images/portrait.png" />
			<img class="signature" src="resources/home/images/signature.png" />
			<div class="btns">
				<div class="btn-nav">
					<a class="fa fa-paw" href="<%=application.getInitParameter("rootURL") %>/home"></a>主页
				</div>
				<div class="btn-nav">
					<a class="fa fa-paper-plane" href="<%=application.getInitParameter("rootURL") %>/timeline"></a>归档
				</div>
				<div class="btn-nav">
					<a class="fa fa-user-circle" href="<%=application.getInitParameter("rootURL") %>/about"></a>关于
				</div>
			</div>
			<div class="tags">
				<c:forEach var="tag" items="${tags}">
					<a href="<%=application.getInitParameter("rootURL") %>/tag/${tag.uuid}" class="tag"  data-color="${tag.color}"><span class="tag-text">${tag.name}</span></a>	
				</c:forEach>
			</div>
		</div>
		
		<div class="about">
			<div class="title">About Me</div>
			<div class="text">后端程序猿一枚</div>
			<div class="text">热衷于前端UI</div>
			<div class="text">所学驳杂</div>
			<div class="text">撰此博客，抒情感怀</div>
		</div>
	</body>
	<script src="<%=application.getInitParameter("rootURL") %>/resources/common/js/jquery.min.js"></script>
	<script src="<%=application.getInitParameter("rootURL") %>/resources/home/js/home.js"></script>
</html>
