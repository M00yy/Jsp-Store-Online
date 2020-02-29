<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
		.c1{
		
		height:800px;
	   width:100%;
		float:left;
		
		}
		.c11
		{
		padding-left:40px;
		padding-top:10px;
		height:50%;
	    width:100%
		}
		.c12
		{
		
		height:50%;
		width:100%
		}
		
		</style>
  </head>
  
  <body>
<div class="c1">
<div class="c11">
<img alt="" src="images/p1.jpg" style="height:400px ;width:100%">
</div>
<div class="c12">
<h3 style="text-align:center">网站公告</h3>
<hr>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：购物满500送精美礼品</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：4月20-25狂欢购物</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：购物满500送精美礼品</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：4月20-25狂欢购物</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：购物满500送精美礼品</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;公告：4月20-25狂欢购物</h4>
</div>
</div>

  </body>
</html>
