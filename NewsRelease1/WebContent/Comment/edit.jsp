<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<% long date = new Date().getTime(); request.setAttribute("date", date); %>

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" charset="UTF-8" src="../ueditor/ueditor.config.js"> </script>
<script type="text/javascript" charset="UTF-8" src="../ueditor/ueditor.parse.js"> </script>
<script type="text/javascript" charset="UTF-8" src="../ueditor/ueditor.parse.min.js"> </script>
<script type="text/javascript" charset="UTF-8" src="../ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="UTF-8" src="../ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="UTF-8" src="../ueditor/lang/zh-cn/zh-cn.js"> </script>
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
               // parent.parent.login();
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
	
<form action="insert" method="post">

			
		<div class="inputview">			
		
		<input type="hidden" name="NewsID" value="${param.id}">
		<input type="hidden" name="cTime" value="${now}"/>
		<c:if test="${user!=null}">
		<input type="hidden" name="cName" value="${user.userName}">
		</c:if>
		
		<c:if test="${Admin!=null}">
		<input type="hidden" name="cName" value="${Admin.adminName}">
		</c:if>
		
		
		</div>
		
		<textarea rows="50" cols="50" name="cContent">
		在此输入评论内容
		</textarea>
		
		<div class="inputbtpanel ">
		<input type="submit" value="评论">
		</div>
	</form>

</body>
</html>
