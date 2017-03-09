<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8"/>
	<link href="resources/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="resources/css/github-markdown.css" rel="stylesheet"/>
	<link href="resources/css/admin.css" rel="stylesheet"/>
	<title>Write</title>
</head>


<body>
<div class="sidebar">
	<a href="index"><div class="fa fa-home fa-3x"></div></a>
	<a href="write"><div class="fa fa-file-text fa-2x"></div></a>
	<a href="manage"><div class="fa fa-list fa-2x"></div></a>
	<a href="comment"><div class="fa fa-comments fa-2x"></div></a>
	<a href="tags"><div class="fa fa-tags fa-2x"></div></a>
</div>
<div title="信息" class="btn-pop">
	<span class="fa fa-chevron-up fa-2x"></span>
</div>
<div title="保存" class="btn-save">
	<span class="fa fa-book fa-2x"></span>
</div>
<div title="存为草稿" class="btn-draft">
	<span class="fa fa-sticky-note fa-2x"></span>
</div>
<form id="form" method="post">
	<div class="write-options">
		
			<input type="text" name="title" placeholder="一定要起个一个高大上的名字呦^^"/>
			<c:forEach var="tag" items="${tags}">
				<input type="checkbox" name="tagList" value="${tag.name}"/>
			</c:forEach>		
		<div class="tags">
			<c:forEach var="tag" items="${tags}">
				<span class="tag">${tag.name}</span>	
			</c:forEach>
		</div>
	</div>

	<div class="content">
		<div class="left">
			<textarea spellcheck="false" name="cont"></textarea>
		</div>
		<div class="right markdown-body">
			
		</div>
	</div>
</form>
</body>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/showdown.min.js"></script>
<script>
$(document).ready(function() {
	$(".btn-pop").click(function() {
		var span = $(".btn-pop span");
		var classes;
		if(span.attr("class").indexOf("up") != -1) {
			classes = "fa fa-chevron-down fa-2x"
		} else {
			classes = "fa fa-chevron-up fa-2x";
		}
		span.removeClass();
		span.addClass(classes);	
		$(".write-options").slideToggle();		
	});
	$("textarea[name='cont']").focus(function() {
		var span = $(".btn-pop span");	
		if(span.attr("class").indexOf("down") == -1) {
			$(".btn-pop").click();
		}
	});
	
	var converter = new showdown.Converter();
    
	$("textarea").keyup(function(e){
		html = converter.makeHtml($(this).val());
		var right = $(".right");
		right.html(html);
		right[0].scrollTop = right[0].scrollHeight;
	});
	
	$("span[class='tag']").click(function() {
		var a = $(this);
		var name = a.text();
		var classes;
		var chk = $("input[value='" + name + "']").get(0);
		if(chk.checked) {
			chk.checked = false;
			classes = "tag";
		} else {
			chk.checked = true;
			classes = "tag-checked";
		}
		a.removeClass();
		a.addClass(classes);
	});
	
	$("div[class='btn-save']").click(function() {
		alert("success");
		$("#form").submit();
	});

});
</script>
</html>