<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New</title>
		<link rel="stylesheet" href="/Blog/resources/css/tags.css" />
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
			<div class="queryDialog">
				<div class="text">确认删除</div>
				<div class="text delTagName"></div>
				<div class="text">标签</div>
				<div class="ok">Yes</div>
				<div class="cancel">No</div>
				<form id="delTag">
					<input name="delTagName" type="text"/>
				</form>
			</div>
			<div class="addTagDialog">
				<form id="addTag">
					<input name="addTagName" type="text" />
				</form>
				<div class="ok">Ok</div>
				<div class="cancel">Cancel</div>
			</div>
			<div class="tags">
				<c:forEach var="tag" items="${tags}">
					<div title="${tag.name}" class="tag">${tag.name}</div>
				</c:forEach>
				<div class="btn-addTag"><span class="fa fa-plus-square fa-3x"></span></div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/Blog/resources/js/jquery.min.js" ></script>
	<script>
		$(document).ready(function() {
			$(".tag").click(function() {
				$(".delTagName").text($(this).text());
				$(".queryDialog").fadeIn("0.5");				
			});
			$(".queryDialog .ok").click(function() {
				$(".queryDialog").fadeOut("0.3");
				var tagName = $(".delTagName").text();
				$("div[title=" + tagName + "]").hide("1");
				$("input[name='delTagName']").val(tagName);
				$("#delTag").submit();
				
			});
			$(".queryDialog .cancel").click(function() {
				$(".queryDialog").fadeOut("0.3");
			});
			$(".btn-addTag").click(function() {
				$(".addTagDialog").fadeIn("0.5");
			})
			$(".addTagDialog .ok").click(function() {
				var tagName = $("input[name='addTagName']").val();
				var isExist = false;
				$(".tag").each(function() {
					
					if($(this).text().indexOf(tagName) != -1) {
						
						isExist = true;
						return;
					}					
				})
				if(isExist == true) {
					alert("标签已存在！");
				} else {
					$("#addTag").submit();
				}
				$(".addTagDialog").fadeOut("0.3");
			});
			$(".addTagDialog .cancel").click(function() {
				$(".addTagDialog").fadeOut("0.3");
			});
		});
	</script>

</html>