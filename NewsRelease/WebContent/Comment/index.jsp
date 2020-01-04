<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<link href="../libs/layui/css/layui.css" rel="stylesheet">
<link href="../css/css.css" rel="stylesheet">
<style type="text/css">
.layui-table{
margin-left: 30px !important;
}

.mui-ellipsis-3 {   display: -webkit-box; 
     overflow: hidden;   white-space: normal!important; 
       text-overflow: ellipsis;  
    word-wrap: break-word;   -webkit-line-clamp: 1; 
      -webkit-box-orient: vertical;}
</style>
   </head>
<body>
<div class="layui-form layui-border-box layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
					<tr>
	
	<td width="200" >评论内容</td>
	<td style="width: 100px;">评论者</td>
	<td style="width: 100px;">评论时间</td>
	</tr>
				</thead>
				<tbody>
	
  	<c:forEach items="${list}" var="r" varStatus="v">		
		<tr >
		<td>${r.cContent}</td>
		<td >${r.cName}</td>
		<td>${r.cTime}</td>
		</tr>
		
	</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>


</body>
</html>
