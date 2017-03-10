<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
		
		<div class="main">
			<c:forEach var="article" items="${articles}">
				<div class="article">
					<div class="title">
						${article.title}
					</div>
					<div class="content">
						${article.cont}
					</div>
					<div class="footer">
						<div class="date">
							<span class="fa fa-clock-o"> ${article.date}</span>						
						</div>					
						<div class="tag-list">
							<span class="fa fa-tags fa-lg"></span>
							<c:forEach var="tag" items="${article.tags}">
								<a href="tag?tagid=${tag.uuid}" class="tag" data-color="${tag.color}"><span class="tag-text">${tag.name}</span></a>	
							</c:forEach>							
						</div>
						<a class="btn-more" href="article?articleid=${article.uuid}">More...</a>
					</div>
				</div>
			</c:forEach>
			
			<!-- <div class="page">
				<a href="javascript:void(0)"><span class="fa fa-arrow-circle-left"></span></a>
				<div class="text">&nbsp;1&nbsp;/&nbsp;10&nbsp;</div>
				<a href="javascript:void(0)"><span class="fa fa-arrow-circle-right"></span></a>
			</div>
			 -->
		</div>
	</body>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/_home.js"></script>
</html>
