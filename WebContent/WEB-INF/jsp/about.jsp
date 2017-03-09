<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>About</title>
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
		
		</div>
	</div>
	
	<div class="main">
		<div class="article">
			<span class="fa fa-bookmark fa-5x"></span>
			<span class="title">作者自传</span>
			
			<div class="info">				
				<span class="">发布于 2017-03-03</span>&nbsp;\&nbsp;
				<span class="comment-count">0 条评论</span>&nbsp;\&nbsp;
				<span>180 浏览</span>
			</div>
			
			<div class="content markdown-body">
				这是kitrst的个人博客
				用来记载一些文字
			</div>
		</div>
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
	$("body").fadeIn();
})
</script>



</html>