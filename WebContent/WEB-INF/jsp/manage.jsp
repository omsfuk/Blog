<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage</title>
		<link rel="stylesheet" href="/Blog/resources/admin/css/navbar.css" />
		<link rel="stylesheet" href="/Blog/resources/admin/css/manage.css" />
		<link rel="stylesheet" href="/Blog/resources/common/css/font-awesome.min.css" />
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
			<a href="manage">
				<div class="btn-nav">
					<span class="fa fa-edit fa-2x"></span>
					<span class="text">Manage</span>
				</div>
			</a>
			<a href="tags">
				<div class="btn-nav">
					<span class="fa fa-tags fa-2x"></span>
					<span class="text">Tags</span>
				</div>
			</a>
			<a href="logout">
				<div class="btn-nav">
					<span class="fa fa-sign-in fa-2x"></span>
					<span class="text">LogOut</span>
				</div>
			</a>
		</div>		
		
		<div class="main">
			<table border="2px">
				<colgroup>
					<col width="80%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>文章标题</td>
					<th>操作</td>
				</tr>
				<c:forEach var="article" items="${articles}">
					<tr>
						<td>${article.title}</td>
						<td>
							<div title="edit" class="btn" data-articleid="${article.uuid}"><span class="fa fa-edit">Edit</span></div>
							<div title="delete" class="btn" data-articleid="${article.uuid}"><span class="fa fa-trash-o">Delete</span></div>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</div>
	</body>
	<script type="text/javascript" src="/Blog/resources/common/js/jquery.min.js" ></script>
	<script>
		$(document).ready(function() {
			$("div[title='delete']").click(function() {
				var btn = $(this);
				$.get("delete?articleid=" + btn.attr("data-articleid"), function(result) {
				})
				window.location.href = "new/" + btn.attr("admin/manage");
			})
			$("div[title='edit']").click(function() {
				var btn = $(this);
				window.location.href = "new/" + btn.attr("data-articleid");
			})
		});
	</script>

</html>

