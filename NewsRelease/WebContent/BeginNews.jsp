<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="b.css">
<style type="text/css">

.mui-ellipsis-3 {   display: -webkit-box;   overflow: hidden;  
 white-space: normal!important;   text-overflow: ellipsis;   
 word-wrap: break-word;   
-webkit-line-clamp: 1;  
 -webkit-box-orient: vertical;}

</style>
<meta charset="UTF-8">
<title>新闻</title>
</head>
<link rel="stylesheet" href="../b.css">
<body>
<div>
<div class="headleft"> </div>
<div class="head" >  

<table>  <tr>

 	<td style="width: 100px;height: 50px"> 
 	<form action="ClassifyFunction" method="post">
		<input type="hidden" name="txt" value="1"> 
	<button  type="submit" style="border: 0; 
	background-color: transparent;
	outline: none;">
	<div style="text-align: center;">
	<h2 align="center" >热点</h2>
	</div>
	</button>  
	</form> 
	</td>
	<td style="width: 100px;height: 50px">  
 <form action="ClassifyFunction" method="post">
		<input type="hidden" name="txt" value="2"> 
	<button  type="submit" style="border: 0; 
	background-color: transparent;
	outline: none;">
	<div style="text-align: center;">
	<h2 align="center" >时尚</h2>
	</div>
	</button>  
	</form> 
	</td>
	<td style="width: 100px;height: 50px">  
 <form action="ClassifyFunction" method="post">
		<input type="hidden" name="txt" value="3"> 
	<button  type="submit" style="border: 0; 
	background-color: transparent;
	outline: none;">
	<div style="text-align: center;">
	<h2 align="center" >世界</h2>
	</div>
	</button>  
	</form> 
	</td>
	<td style="width: 100px;height: 50px">  
 <form action="ClassifyFunction" method="post">
		<input type="hidden" name="txt" value="4"> 
	<button  type="submit" style="border: 0; 
	background-color: transparent;
	outline: none;">
	<div style="text-align: center;">
	<h2 align="center" >八卦</h2>
	</div>
	</button>  
	</form> 
	</td>

<td><a href="../login.html">
 用户登录
</a></td>
<td style="width: 100px;height: 50px"></td>
<td style="width: 200px;height: 50px">   
<form action="indexID" method="post">
	<input name="txt"> 
	<button  class="layui-btn" type="submit">ID查询</button> 
</form>
	</td>
	
	<td style="width: 200px;height: 50px">   
<form action="indexall" method="post">
	<input name="txt"> 
	<button  class="layui-btn" type="submit">全文检索</button> 
</form>
	</td>
</tr></table>
</div>
<div class="besis"> besisl</div>
<div class="body"> 
<div style="text-align: left;">
	<c:forEach items="${list}" var="r" varStatus="v">
	<form action="context" method="post">
		<input type="hidden" name="txt" value="${r.id}"> 
	<button  type="submit" style="border: 0; 
	background-color: transparent;
	outline: none;">
	<div style="text-align: center;">
	<c:if test="${ r.newsStatu eq '显示状态'}">
	<h2 align="center" >${r.newsName}</h2>
	</c:if>
	</div>
	</button>  
	</form>
	<c:if test="${ r.newsStatu eq '显示状态'}">
	<p> ${r.newsTime} &nbsp&nbsp&nbsp&nbsp&nbsp ${r.newsReleaseID}</p>
	</c:if>
	</c:forEach>
</div>
</div>
<div class="besis"> besis</div>

<div class="foot"> <h3 align="center"> @xzf</h3></div>


</div>
<%-- <div class="layui-form layui-border-box layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
					<tr>
	
	<td style="width: 200px;">新闻名称</td>
	<td style="width: 100px;">新闻内容</td>
	</tr>
				</thead>
				<tbody>
	
  	<c:forEach items="${list}" var="r" varStatus="v">		
		<tr >
		<td>
		<form action="context" method="post">
		<input type="hidden" name="txt" value="${r.id}"> 
	<button  type="submit" style="border: 0; background-color: transparent;outline: none;">${r.newsName}</button>  
	
		</form></td>
		<td style="width: 200px;">
		<p style="width: 100px;"  class="mui-ellipsis-3 ">
		
		${r.newsText}</p></td>
		
		</tr>
		
	</c:forEach>
  	
			
				</tbody>
			</table>
		</div>
 --%>
</body>
</html>