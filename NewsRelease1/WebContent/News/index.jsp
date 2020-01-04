<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<link href="../libs/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../libs/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../libs/layui/layui.all.js"></script>
<script type="text/javascript" src="../libs/js/util.js"></script>
<script type="text/javascript" src="../libs/js/mylayer.js"></script>
<script type="text/javascript" src="../libs/layer/layer.js"></script>
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
	<div class="demoTable">
	<script type="text/javascript">
	function fresh(){
		location.href="index";
	}
function del(id){
	if(confirm("是否删除?"))
	{
		location.href="delete?id="+id;
	}
}


function openadd(){
	layer.open({
		  type: 2,
		  title: '新增',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['800px', '600px'],
		  content: 'add'
		}); 
}

function openedit(id){
	layer.open({
		  type: 2,
		  title: '修改',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['800px', '800px'],
		  content: 'edit?id='+id
		}); 
}
	</script>
	
	<form action="index" method="post">
	<input name="txt"> 
	<button  class="layui-btn" type="submit">查询</button> 
	
	<button  type="button" class="layui-btn" onclick="openadd()">新增</button>
	</form>

	</div>
<div class="layui-form layui-border-box layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
					<tr>
	
	<td style="width: 200px;">新闻名称</td>
	<td width="200" >新闻内容</td>
	<td style="width: 100px;">类型</td>
	<td style="width: 100px;">发布时间</td>
	<td style="width: 100px;">新闻状态</td>
	<td style="width: 100px;">发布者</td>
	
	<td>操作</td></tr>
				</thead>
				<tbody>
	
  	<c:forEach items="${list}" var="r" varStatus="v">		
		<tr >
		<td>
		<form action="context" method="post">
		<input type="hidden" name="txt" value="${r.id}"> 
	<button  type="submit" style="border: 0; background-color: transparent;outline: none;">${r.newsName}</button>  
	
		</form></td>
		<td style="overflow:hidden; width: 200px;" width="200">
		<p  class="mui-ellipsis-3">
		${r.newsText}</p></td>
		<td>${r.classifyName}</td>
		<td >${r.newsTime}</td>
		<td> ${r.newsStatu}</td>
		<td>${r.newsReleaseID}</td>
		
		<td>
		<a href="javascript:del(${r.id})">删除</a>
		<a href="javascript:openedit(${r.id})">修改</a>
		</td>
		</tr>
		
	</c:forEach>
  	
			
				</tbody>
			</table>
		</div>
	</div>
	
	
	
</div>

<div style="margin-left: 50px;">
<a href="index?pageno=${search.prino}">上一页</a>&nbsp&nbsp&nbsp&nbsp
<a href="index?pageno=${search.nextno}">下一页</a>
</div>

</body>
</html>
