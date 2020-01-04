<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻内容</title>
</head>

<link rel="stylesheet" href="../b.css">
<body>
<div>
<div class="headleft"></div>

<c:forEach items="${list}" var="r" varStatus="v">		
	<div class="head">	
	<h1 align="center">
		${r.newsName}
		</h1>
	</div>
<div class="besisl"></div>
<div class="body">
		<div style="margin-left: 20px;">
		${r.newsText}
		
		</div>
</div>
	</c:forEach>
	<div class="besis">
	<iframe src ="../Comment/edit.jsp?id=${list[0].id}" width="100%" height="100%">
	</iframe>
</div>		
		
		</div>	
<div> 
<iframe src ="../Comment/indexC?id=${list[0].id}" width="100%" height="100%">
	</iframe>
</div>
</body>
</html>