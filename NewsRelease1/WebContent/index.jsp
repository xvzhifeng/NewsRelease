<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title> 后台主页</title>

    <link rel="shortcut icon" href="favicon.ico">
     <link href="libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="libs/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="libs/css/animate.css" rel="stylesheet">
    <link href="libs/css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="libs/layer/layer.js"></script>
    <script type="text/javascript">
    function openpass(){
    	layer.open({
		      type: 2,
		      title: '修改密码。',
		      shadeClose: true,
		      shade: false,
		      maxmin: false, //开启最大化最小化按钮
		      area: ['403px', '300px'],
		      content: 'User/alter?id='+${user.id}
		    });
    }
    /* function openpass1(){
    	layer.open({
		      type: 2,
		      title: '修改密码。',
		      shadeClose: true,
		      shade: false,
		      maxmin: false, //开启最大化最小化按钮
		      area: ['403px', '300px'],
		      content: 'Admin/alter?id='+${Admin.id}
		    });
    } */
    
    function fresh(){
		//location.href="../index.jsp";
	}
    
    function login(){
    	location.href="../login.html";
    }
    </script>
    <script type="text/javascript">
    function openpass1(){
    	layer.open({
		      type: 2,
		      title: '修改密码。',
		      shadeClose: true,
		      shade: false,
		      maxmin: false, //开启最大化最小化按钮
		      area: ['403px', '300px'],
		      content: 'Admin/alter?id='+${Admin.id}
		    });
    }
    
    function fresh(){
		//location.href="../index.jsp";
	}
    
    function login(){
    	location.href="../login.html";
    }
    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">新闻发布系统</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">新闻
                        </div>
                    </li>
                    
                    <c:if test="${Admin!=null}">
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">管理员功能菜单</span>
                    </li>
                    <li>
                        <a class="J_menuItem" href="User/index">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">用户管理</span>
                        </a>
                    </li>
         			</c:if>
         			<c:if test="${user!=null}">
         			<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">普通用户功能菜单</span>
                    </li>
         			
         			</c:if>
                    <li>
                        <a class="J_menuItem" href="News/index">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">新闻管理</span>
                        </a>
                    </li>
                    
                     <li>
                        <a class="J_menuItem" href="News/begin">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">新闻页面</span>
                        </a>
                    </li>
                    
                    
                    <c:if test="${user!=null}">
                    <li>
                        <a class="J_menuItem" href="javascript:;" onclick="openpass();">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">修改密码</span>
                        </a>
                    </li>
                    </c:if>
                    
                    <c:if test="${Admin!=null}">
                    <li>
                        <a class="J_menuItem" href="javascript:;" onclick="openpass1();">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">修改密码</span>
                        </a>
                    </li>
                    </c:if>
                  <c:if test="${user!=null}">
                    <li>
                        <a class="J_menuItem" href="User/outlogin">
                            <i class="fa fa-home"></i>
                    
                            <span class="nav-label">退出系统</span>
                        </a>
                    </li>
                    </c:if>
                    
                      <c:if test="${Admin!=null}">
                    <li>
                        <a class="J_menuItem" href="Admin/outlogin">
                            <i class="fa fa-home"></i>
                    
                            <span class="nav-label">退出系统</span>
                        </a>
                    </li>
                    </c:if>
                   
                   
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                       <!-- 头部放置 -->
                    </div>
                    
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="blank.html" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="libs/js/jquery.min.js?v=2.1.4"></script>
    <script src="libs/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="libs/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="libs/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="libs/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="libs/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="libs/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="libs/js/plugins/pace/pace.min.js"></script>

</body>

</html>
    