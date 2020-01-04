<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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

<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		request.setAttribute("now", now);
		%>
	
<c:if test="${info!=null}">
<form action="update" method="post">
<input type="hidden" name="id" value="${info.id}">
</c:if>


<c:if test="${info==null}">
<form action="insert" method="post">
<input type="hidden" name="userRegister" value="${now}">
</c:if>
			
		<div class="inputview">			
		
		<span class="inputspan"> 
		<label class="inputtext">名称:</label> 
		<input class="inputinput" name="userName" value="${info.userName}"/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">密码:</label> 
		<input class="inputinput" name="userPass" value="${info.userPass}"/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">性别:</label> 
		<input class="inputinput" name="userSex" value="${info.userSex}"/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">邮箱:</label> 
		<input class="inputinput" name="userEmail" value="${info.userEmail}"/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">生日:</label> 
		<input class="inputinput" name="userBirthday" value="${info.userBirthday}"/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">电话:</label> 
		<input class="inputinput" name="userTell" value="${info.userTell}"/>
		</span>
		
		
		</div>
		
		<div class="inputbtpanel ">
		<button class="seachbt1" type="button" onclick="save();" >保存</button>
		</div>
	</form>

</body>
</html>
