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

</head>
<body>

<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		request.setAttribute("now", now);
		%>
<form action="register" method="post">
	
		<input type="hidden" name="userRegister" value="${now}">

			
		<div class="inputview">			
		
		<span class="inputspan"> 
		<label class="inputtext">名称:</label> 
		<input class="inputinput" name="userName" value=""/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">密码:</label> 
		<input class="inputinput" name="userPass" value=""/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">性别:</label> 
		<input class="inputinput" name="userSex" value=""/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">邮箱:</label> 
		<input class="inputinput" name="userEmail" value=""/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">生日:</label> 
		<input class="inputinput" name="userBirthday" value=""/>
		</span>
		<span class="inputspan"> 
		<label class="inputtext">电话:</label> 
		<input class="inputinput" name="userTell" value=""/>
		</span>
		
		
		</div>
		
		<div class="inputbtpanel ">
		<input class="seachbt1" type="submit" > 保存
		</div>
	</form>

</body>
</html>
