<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="user" scope="page" class="bean.Testbean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css0">
	-->
  </head>
  
  <body>
    	注册成功 <br>
    	<hr>java bean属性方法
       	<br>
    	username <%= user.getUsername() %><br>
    	password <%= user.getPassword() %><br>
    	age <%= user.getAge() %><br>
    	<hr>
    	<hr>getProperty<br>
    	username <jsp:setProperty property="username" name="userName"/><br>
    	password <jsp:setProperty property="password" name="password"/><br>
    	age <jsp:setProperty property="age" name="age"/><br>
    	<hr><br>
    	
  </body>
</html>
