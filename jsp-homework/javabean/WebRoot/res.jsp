<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="squ" class="bean.RectBean" scope="page"/>
<jsp:setProperty property="*" name="squ"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'res.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my Result page. <br>
    length<jsp:getProperty property="length" name="squ"/><br>
    width<jsp:getProperty property="width" name="squ"/><br>
    per<jsp:getProperty property="perimeter" name="squ"/><br>
    area<jsp:getProperty property="area" name="squ"/>
  </body>
</html>
