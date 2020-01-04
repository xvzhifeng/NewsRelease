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
	
<c:if test="${info!=null}">
<form action="update" method="post">
<input type="hidden" name="id" value="${info.id}">
</c:if>


<c:if test="${info==null}">
<form action="insert" method="post">
<input type="hidden" name="newsStatu" value="发布状态"/>
</c:if>
			
		<div class="inputview">			
		
		<span class="inputspan"> 
		<label class="inputtext">名称:</label> 
		<input class="inputinput" name="newsName" value="${info.newsName}"/>
		</span>
		
		<%-- <span class="inputspan"> 
		<label class="inputtext">内容:</label> 
		<input class="inputinput" name="newsText" value="${info.newsText}"/>
		</span> --%>
		
		<span class="inputspan"> 
		<label class="inputtext">类别:</label> 
			<select name="classifyID" class="inputselect"> 
			<c:forEach items="${classifylist}" var="r">
			<c:if test="${info.classifyID!=r.id}">
			<option value="${r.id}">${r.classifyName}</option>
			</c:if>
			
			<c:if test="${info.classifyID==r.id}">
			<option selected="selected" value="${r.id}">${r.classifyName}</option>
			</c:if>
				
			</c:forEach>
			</select>
		</span>
		
		<div align="center" style="width:80%">  
            <textarea id="newsEditor" name="newsText" style="height: 80%">${info.newsText}</textarea>   
           <!-- //<input type="submit" value="发 布">   -->
           <script type="text/javascript">
           UE.getEditor('newsEditor');
           // var content = UE.getPlainTxt();//content就是编辑器的带格式的内容
           </script>  
		</div>
		<c:if test="${Admin!=null}">
		<span class="inputspan"> 
		<label class="inputtext">新闻状态:</label> 
		<input class="inputinput" name="newsStatu" value="${info.newsStatu}"/>
		</span>
		</c:if>
		<input type="hidden" name="newsTime" value="${now}"/>
		<c:if test="${user!=null}">
		<input type="hidden" name="newsReleaseID" value="${user.userName}">
		</c:if>
		
		<c:if test="${Admin!=null}">
		<input type="hidden" name="newsReleaseID" value="${Admin.adminName}">
		</c:if>
		
		
		</div>
		
		<div class="inputbtpanel ">
		<button class="seachbt1" type="button" onclick="save();" >保存</button>
		</div>
	</form>

</body>
</html>
