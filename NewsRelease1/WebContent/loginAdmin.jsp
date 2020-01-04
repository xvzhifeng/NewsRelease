<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title> - 登录</title>
    
    <link href="libs/css/bootstrap.min.css" rel="stylesheet">
    <link href="libs/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="libs/css/animate.css" rel="stylesheet">
    <link href="libs/css/style.css" rel="stylesheet">
    <link href="libs/css/login.css" rel="stylesheet">
    
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        var a=0;
        function changerimg(o) {
			o.src="img?a="+(a++);
		}
    </script>

</head>
<a href="login.html">普通用户登录</a>
<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="Admin/login">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到后台框架</p>
                    <input type="text"  name="adminName" class="form-control uname" placeholder="用户名" />
                    <input type="password"  name="adminPass" class="form-control pword m-b" placeholder="密码" />
                    
               
                <button class="btn btn-success btn-block" type="submit">登录</button>
                 </form>
                
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; xzf
            </div>
        </div>
    </div>
   
</body>

</html>
