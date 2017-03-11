<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${article.title}</title>
		<link href="<%=application.getInitParameter("rootURL") %>/resources/home/css/home.css" rel="stylesheet" />
		<link href="<%=application.getInitParameter("rootURL") %>/resources/common/css/font-awesome.min.css" rel="stylesheet" />
		<link href="<%=application.getInitParameter("rootURL") %>/resources/common/css/github-markdown.css" rel="stylesheet" />
	</head>
	<body>
		<div class="navbar">
			<div class="black-bg">				
			</div>
			<img class="portrait" src="<%=application.getInitParameter("rootURL") %>/resources/home/images/portrait.png" />
			<img class="signature" src="<%=application.getInitParameter("rootURL") %>/resources/home/images/signature.png" />
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
					<a href="<%=application.getInitParameter("rootURL") %>/tag/${tag.uuid}" class="tag" data-color="${tag.color}"><span class="tag-text">${tag.name}</span></a>	
				</c:forEach>
			</div>
		</div>
		
		<div class="main">
			<div class="article">
				<div class="title">
					${article.title}
				</div>
				<div class="footer">
					<div class="date">
						<span class="fa fa-clock-o"> ${article.date}</span>						
					</div>					
					<div class="tag-list">
						<span class="fa fa-tags fa-lg"></span>
						<c:forEach var="tag" items="${article.tags}">
							<a href="<%=application.getInitParameter("rootURL") %>/tag/${tag.uuid}" class="tag" data-color="${tag.color}"><span class="tag-text">${tag.name}</span></a>
						</c:forEach>
					</div>
				</div>
				<div class="content markdown-body">
					
				</div>				
			</div>
			
		</div>
	</body>
<script src="<%=application.getInitParameter("rootURL") %>/resources/common/js/jquery.min.js"></script>
<script src="<%=application.getInitParameter("rootURL") %>/resources/common/js/showdown.min.js"></script>
<script src="<%=application.getInitParameter("rootURL") %>/resources/home/js/home.js"></script>
<script>
	$(document).ready(function() {
		$.get("<%=application.getInitParameter("rootURL") %>/getArticle?uuid=${article.uuid}", function(result) {
			var converter = new showdown.Converter();
		    var html = converter.makeHtml(result);
			$("div[class='content markdown-body']").html(html);	
		})
	});
</script>
</html>
