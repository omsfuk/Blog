<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Article</title>
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
				<span class="tag"><a href="javascript:void(0)">${tag.name}</a></span>						
			</c:forEach>
		</div>
	</div>
	
	<div class="main">
		<div class="article">
			<span class="fa fa-bookmark fa-5x"></span>
			<span class="title">${article.title}</span>
			
			<div class="info">				
				<span class="">发布于 ${article.date}</span>&nbsp;\&nbsp;
				<span class="comment-count">${commentsCount} 条评论</span>&nbsp;\&nbsp;
				<span>180 浏览</span>
				<div class="tags">
					<c:forEach var="tag" items="${article.tags}">		
						<span class="tag"><a href="javascript:void(0)">${tag.name}</a></span>							
					</c:forEach>
				</div>
			</div>
			
			<div class="markdown-body content">
				
${article.cont}
				
			</div>
		</div>
		<div class="comment">
		
			<div class="previous-comment">
				<c:forEach var="comment" items="${comments}">
					<div class="a-comment">
						<div class="a-comment">
							<span class="fa fa-user-circle fa-2x"></span>${comment.name}<span style="float:right;">${comment.date}</span>
							<div class="comment-content">${comment.cont}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<form action="comment" id="comment" method="post">
				<textarea name="cont" rows="5"></textarea>
				<input type="hidden" value="${article.articleid}" name="articleid"/>
				<div class="option">
					 邮箱 <input name="email" type="text" cols="20"/>
					 姓名 <input name="name" type="text" cols="20"/>
					<a class="btn-submit" href="javascript:void(0)">Submit</a>
				</div>
			</form>
		</div>
	</div>

</body>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/showdown.min.js"></script>
<script>
$(document).ready(function() {
	var converter = new showdown.Converter();
	var content = $("div[class='markdown-body content']");
    var text = content.text();
    
    alert(text);
    
    text = converter.makeHtml(text);
    content.html(text);
    
    $("body").fadeIn();
    
    $("a[class='btn-submit']").click(function() {
    	$("#comment").submit();
    });
})
</script>
</html>