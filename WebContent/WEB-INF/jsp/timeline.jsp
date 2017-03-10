<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Home</title>
		<link href="resources/css/_home.css" rel="stylesheet" />
		<link href="resources/css/font-awesome.min.css" rel="stylesheet" />
	</head>
	<body>
		<div class="navbar">
			<div class="black-bg">				
			</div>
			<img class="portrait" src="resources/images/portrait.png" />
			<img class="signature" src="resources/images/signature.png" />
			<div class="btns">
				<div class="btn-nav">
					<a class="fa fa-paw" href="home"></a>主页
				</div>
				<div class="btn-nav">
					<a class="fa fa-paper-plane" href="timeline"></a>归档
				</div>
				<div class="btn-nav">
					<a class="fa fa-user-circle" href="about"></a>关于
				</div>
			</div>
			<div class="tags">
				<c:forEach var="tag" items="${tags}">
					<a href="tag?tagid=${tag.uuid}" class="tag" data-color="${tag.color}"><span class="tag-text">${tag.name}</span></a>
				</c:forEach>
			</div>
		</div>
		
		<div class="timeline-main">
			<div class="timeline">
				<c:forEach var="article" items="${articles}">
					<div class="a-piece">
						<div class="date">${article.date}</div>
						<span class="fa-stack fa-2x">
						  <i class="fa fa-circle fa-stack-2x" style="color:#D2E9FF"></i>
						  <i class="fa fa-check fa-stack-1x" style="color:#7D7DFF"></i>
						</span>
						<a href="article?articleid=${article.uuid}"><div class="title">${article.title}</div></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/_home.js"></script>
</html>
