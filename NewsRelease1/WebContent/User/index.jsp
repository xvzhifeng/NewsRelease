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
		  area: ['340px', '400px'],
		  content: 'add'
		}); 
}

function openedit(id){
	layer.open({
		  type: 2,
		  title: '新增',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['340px', '400px'],
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
	
	<td style="width: 200px;">名称</td>
	<td style="width: 100px;">邮箱</td>
	<td style="width: 100px;">生日</td>
	<td style="width: 100px;">性别</td>
	<td style="width: 100px;">等级</td>
	<td style="width: 100px;">电话</td>
	<td style="width: 100px;">注册时间</td>
	
	<td>操作</td></tr>
				</thead>
				<tbody>
	
  	<c:forEach items="${list}" var="r" varStatus="v">		
		<tr >
		<td>${r.userName}</td>
		<td>${r.userEmail}</td>
		<td>${r.userBirthday}</td>
		<td>${r.userSex}</td>
		<td>${r.userClass}</td>
		<td>${r.userTell}</td>
		<td>${r.userRegister}</td>
		
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

</div>
<div style="margin-left: 50px;">
<a href="index?pageno=${search.prino}">上一页</a>&nbsp&nbsp&nbsp&nbsp
<a href="index?pageno=${search.nextno}">下一页</a>
</div>

</body>
</html>
