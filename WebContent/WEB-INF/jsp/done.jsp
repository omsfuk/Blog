<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New</title>
		<link rel="stylesheet" href="/Blog/resources/css/done.css" />
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
			<table border="2px">
				<colgroup>
					<col width="80%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>文章标题</td>
					<th>操作</td>
				</tr>
				<tr>
					<td>Java入门</td>
					<td>
						<div class="btn"><span class="fa fa-edit">Edit</span></div>
						<div class="btn"><span class="fa fa-trash-o">Delete</span></div>
					</td>
				</tr>
				<tr>
					<td>Strutr2 之 Hello World</td>
					<td>
						<div class="btn"><span class="fa fa-edit">Edit</span></div>
						<div class="btn"><span class="fa fa-trash-o">Delete</span></div>
					</td>
				</tr>	
				<tr>
					<td>Spring搭建小型Blog</td>
					<td>
						<div class="btn"><span class="fa fa-edit">Edit</span></div>
						<div class="btn"><span class="fa fa-trash-o">Delete</span></div>
					</td>
				</tr>	
				<tr>
					<td>Java入门</td>
					<td>
						<div class="btn"><span class="fa fa-edit">Edit</span></div>
						<div class="btn"><span class="fa fa-trash-o">Delete</span></div>
					</td>
				</tr>	
			</table>	
		</div>
	</body>

</html>
