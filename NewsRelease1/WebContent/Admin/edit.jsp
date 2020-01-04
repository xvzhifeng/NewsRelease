<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">
<script type="text/javascript" src="../libs/js/jquery.min.js"></script>
<script type="text/javascript" src="../libs/layer/layer.js"></script>
<script type="text/javascript">
function save(){
	var url=$("form").attr("action");
	$.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url ,//url
            data: $('form').serialize(),
            success: function (result) {
                if (result.status>0) {
                	parent.fresh();
                	var mylay = parent.layer.getFrameIndex(window.name);
                	parent.layer.close(mylay);
                }else{
                	layer.alert("保存失败", {
                	    skin: 'layui-layer-lan'
                	    ,closeBtn: 0
                	    ,anim: 4 //动画类型
                	  });
                }
                ;
            },
            error : function() {
                parent.parent.login();
            }
			
        });
}

</script>
</head>
<body>

	
<c:if test="${info!=null}">
<form action="update" method="post">
<input type="hidden" name="id" value="${info.id}">
</c:if>


<c:if test="${info==null}">
<form action="insert" method="post">

</c:if>
			
		<div class="inputview">			
		
		<span class="inputspan"> 
		<label class="inputtext">名称:</label> 
		<input class="inputinput" name="name" value="${info.name}"/>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">性别:</label> 
		<select name="sex" class="inputselect"> 
	<c:forEach items="${sexs}" var="r" varStatus="v">
	<c:if test="${info.sex!=v.index}">
	<option value="${v.index}">${r}</option>
	</c:if>
	
	<c:if test="${info.sex==v.index}">
	<option selected="selected" value="${v.index}">${r}</option>
	</c:if>
		
	</c:forEach>
	</select>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">班级:</label> 
		<select name="classid" class="inputselect"> 
	<c:forEach items="${classlist}" var="r">
	<c:if test="${info.classid!=r.id}">
	<option value="${r.id}">${r.name}</option>
	</c:if>
	
	<c:if test="${info.classid==r.id}">
	<option selected="selected" value="${r.id}">${r.name}</option>
	</c:if>
		
	</c:forEach>
	</select>
		</span>
		
		
		
		</div>
		
		<div class="inputbtpanel ">
		<button class="seachbt1" type="button" onclick="save();" >保存</button>
		</div>
	</form>

</body>
</html>
