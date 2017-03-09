<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
<meta charset="utf-8"/>
<link href="resources/css/home_new.css" rel="stylesheet"/>
<link href="resources/css/font-awesome.min.css" rel="stylesheet"/>
<link href="resources/css/github-markdown.css" rel="stylesheet"/>
</head>


<body>
	<div class="sidebar">
		<div class="portrait">
			<img src="resources/images/portrait.png"/>
		</div>
		<div class="navbar">
			<a href="home"><span class="fa fa-folder fa-2x"></span></a>
			<a href="film"><span class="fa fa-film fa-2x"></span></a>
			<a href="about"><span class="fa fa-user-o fa-2x"></span></a>
		</div>
		<div class="tags-list">
			<c:forEach var="tag" items="${tags}">
				<span class="tag"><a href="tag?tagId=${tag.tagid}">${tag.name}</a></span>						
			</c:forEach>
		</div>
		
		<div class="copyright">
			Copyright <span class="fa fa-copyright"></span> 2017 knife037 Powered By Blog
		</div>
	</div>
	
	<div class="main">
		<c:forEach var="article" items="${articles}">
			<div class="article-abstract">
				<span class="fa fa-bookmark fa-5x"></span>
				<span class="title">${article.title}</span>
				
				<div class="info">				
					<span class="">发布于 ${article.date}</span>&nbsp;\&nbsp;
					<span class="comment-count">${article.commentCount} 条评论</span>&nbsp;\&nbsp;
					<span>180 浏览</span>
					<div class="tags">
						<c:forEach var="tag" items="${article.tags}">		
							<span class="tag"><a href="tag?tagId=${tag.tagid}">${tag.name}</a></span>							
						</c:forEach>
					</div>
				</div>
				
				<div class="abstract-content">
					${article.cont}
				</div>
				<div class="container">
					<a class="btn-more" href="article?articleid=${article.articleid}"><span class="fa fa-book"> More</span></a>
				</div>
			</div>
		</c:forEach>	
	</div>
</body>
<script src="resources/js/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("div[class='abstract-content']").each(function(){
		var text = $(this).text().substring(0, 200);
		$(this).html(text.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];}));
	});
	//$("body").addClass("body-show");
	$("body").show("slow");
})
</script>


</html>