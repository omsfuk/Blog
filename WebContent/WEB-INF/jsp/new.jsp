<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New</title>
		<link rel="stylesheet" href="/Blog/resources/css/new.css" />
		<link rel="stylesheet" href="/Blog/resources/css/font-awesome.min.css" />
	</head>
	<body>
		<div class="navbar">
			<a href="index">
				<div class="btn-nav">
					<span class="fa fa-paper-plane-o fa-2x"></span>
					<span class="text">Home</span>
				</div>
			</a>
			<a href="new">
				<div class="btn-nav">
					<span class="fa fa-file-o fa-2x"></span>
					<span class="text">New</span>
				</div>
			</a>
			<a href="draft">
				<div class="btn-nav">
					<span class="fa fa-legal fa-2x"></span>
					<span class="text">Draft</span>
				</div>
			</a>
			<a href="done">
				<div class="btn-nav">
					<span class="fa fa-edit fa-2x"></span>
					<span class="text">Done</span>
				</div>
			</a>
			<a href="tags">
				<div class="btn-nav">
					<span class="fa fa-tags fa-2x"></span>
					<span class="text">Tags</span>
				</div>
			</a>
			<a href="signOut">
				<div class="btn-nav">
					<span class="fa fa-sign-in fa-2x"></span>
					<span class="text">SignOut</span>
				</div>
			</a>
		</div>		
		
		<div class="main">
			<form id="form" method="post">
				<input type="text" name="title" placeholder="请起一个炫酷的标题"/>
				<textarea spellcheck="false" name="cont" rows="20"></textarea>
				<c:forEach var="tag" items="${tags}">
					<input type="checkbox" style="display: none" name="tagList" value="${tag.name}"/>
				</c:forEach>
			</form>
			<div class="tags">
				<c:forEach var="tag" items="${tags}">
					<div class="tag">${tag.name}</div>
				</c:forEach>
			</div>
			<div id="publish" class="btn">Publish</div>
			<div id="draft" class="btn">As Draft</div>
		</div>
	</body>
	<script type="text/javascript" src="/Blog/resources/js/jquery.min.js" ></script>
	<script>
		$(document).ready(function() {
			$("div[class='tag'").click(function() {
				var tag = $(this);
				var tagName = tag.text();
				if(tag.attr("class").indexOf("tag-checked") != -1) {
					tag.removeClass().addClass("tag");
					$("input[type='checkbox'][value='" + tagName + "']").attr("checked", false);				
				} else {
					tag.removeClass().addClass("tag-checked");
					$("input[type='checkbox'][value='" + tagName + "']").attr("checked", true);
				}
			})
			$("#publish").click(function() {
				$("#form").submit();
			});
		});
	</script>
</html>
