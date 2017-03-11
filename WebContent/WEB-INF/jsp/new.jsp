<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New</title>
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/admin/css/navbar.css" />
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/admin/css/new.css" />
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/common/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=application.getInitParameter("rootURL") %>/resources/common/css/github-markdown.css" />
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
			<a href="<%=application.getInitParameter("rootURL") %>/adminlogout">
				<div class="btn-nav">
					<span class="fa fa-sign-in fa-2x"></span>
					<span class="text">LogOut</span>
				</div>
			</a>
		</div>		
		
		<div class="main">
			<form id="form" method="post">
				<input name="title" class="title" type="text"/>
				<textarea name="cont" id="content" spellcheck="false" rows="20"></textarea>
			
				<div class="markdown-body">
					
				</div>
				<div class="tags">
					<c:forEach var="tag" items="${tags}">
						<input type="checkbox" style="display: none" name="tagList" value="${tag.name}"/>
						<div class="tag">${tag.name}</div>
					</c:forEach>
				</div>
			</form>
			<div id="preview" class="btn">Preview</div>
			<div id="publish" class="btn">Publish</div>
			
		</div>
	</body>
	<script type="text/javascript" src="<%=application.getInitParameter("rootURL") %>/resources/common/js/jquery.min.js" ></script>
	<script type="text/javascript" src="<%=application.getInitParameter("rootURL") %>/resources/common/js/showdown.min.js" ></script>
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
			$("#preview").click(function() {
				var textarea = $("#content");
				var markbody = $(".markdown-body");
				var title = $(".main .title");
				if(textarea.css("display") != "none") {
					var converter = new showdown.Converter();
		 			var html = converter.makeHtml(textarea.val());
					markbody.html(html);	
					textarea.hide("slow");
					title.hide("slow");
					markbody.show("slow");
				} else {
					markbody.hide("slow");
					title.show("slow");
					textarea.show("slow");
				}
			});
			$("#publish").click(function() {
				$("#form").submit();
			});
		});
	</script>
</html>
