<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.twy.com/jsp/jstl/myfn" prefix="myfn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"></link>
</head>
<style type="text/css">
	body
	{
		background:url(../images/login-bg.png) no-repeat center center;
	}
</style>
<body>
	${message}
	<br/>
	<h1>网店后台管理</h1><br/>
	<br/><br/>
<nav>
	<a href="${pageContext.request.contextPath}/manager/addCategory.jsp">添加分类</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showAllCategories">查询分类</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showAddBook">添加商品</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showBooks">查看商品</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showPayedOrders">订单查询</a>
	<a href="#">公告中心</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=logout">退出登陆</a>
	<a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
</nav>
	 <c:forEach items="${applicationScope.menus}" var="m">
	 	<a href="${pageContext.request.contextPath}${m.uri}">${m.name}</a>
	 </c:forEach>
	<br/><br/><br/>
	
